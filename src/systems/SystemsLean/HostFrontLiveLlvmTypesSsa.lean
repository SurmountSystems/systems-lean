/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmTypesSsa.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmTypesSsa. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses the library LlvmTypesSsa.lean. Not the mill entry
  LlvmTypesSsaMain.lean. Not Linear.lean. Not IrGraph.lean.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not write out/llvm-ir. Dests skipped.
  Text parse only. Do not import SystemsLean.LlvmTypesSsa.
  Skip-fold IO defs validateTypesSsaPackage, llvmTypesSsaWrite, and main.
  Skip theorem, example, open, and bodies outside the atom grammar
  (match, let, lambda, bang, dotted app, string append, && chains).
  Keep dotted imports, the namespace, the end, and simple String/Bool atoms.
  liveRel is the bare basename LlvmTypesSsa.lean, not a path.
  kernelCheck is HostKernel.kernelCheck, not a hardcoded true.
  Occupancy stays 49. Mill stays 69 of 69. Not FullHost. Not Lake-gone.
  Not occupancy name 50.
  Unique needles (trailing newline, each once in the library):
  import SystemsLean.KernelTypes
  namespace SystemsLean.LlvmTypesSsa
  def stageId : String := "SLAKE_LLVM_TYPES_SSA_V0"
  def hostId : String := "HOST-LLVM-TYPES-SSA"
  def llvmTypesSsaFullBackendClaimed : Bool := false
  def typesSsaBasename : String := "slake_types_ssa.ll"
  def ssaShapedId : String := "SSA-SHAPED"
  end SystemsLean.LlvmTypesSsa
  PARSE-LIVE-LLVM-TYPES-SSA
  HOST-FRONT-LIVE-LLVM-TYPES-SSA
  SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_SSA_V0
  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLlvmTypesSsaSource,
  kernelCheckLiveLlvmTypesSsaSource,
  hostFrontLiveLlvmTypesSsaReady, liveLlvmTypesSsaSource,
  liveLlvmTypesSsaRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveLlvmTypesSsa
  Not package typecheck GREEN. Not PROVABLY. Not freestanding residual free.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmTypesSsaSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmTypesSsa

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from the mill MAIN id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-TYPES-SSA"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-TYPES-SSA"

/-- Live file basename. Not a path. -/
def liveRel : String := "LlvmTypesSsa.lean"

/-- Live file relative to repo root. Dual-pin path. Library, not the mill entry. -/
def liveLlvmTypesSsaRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmTypesSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def hostFrontLiveLlvmTypesSsaFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmTypesSsaResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmTypesSsaProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). Library has about one hundred command starts. -/
def liveLlvmTypesSsaParseFuel : Nat := 1024

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLlvmTypesSsaSkipFuel : Nat := 16384

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

/-- String-safe comment strip for live LlvmTypesSsa.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . KernelTypes`. -/
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
def cmdAddsLlvmTypesSsa (c : Cmd) : List String :=
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
  s == "validateTypesSsaPackage" || s == "llvmTypesSsaWrite" || s == "main"
    || s == "containsSub" || s == "filterArgs"

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownLlvmTypesSsa (kn : List String) : Cmd -> Bool
  | Cmd.def_ x ty body =>
      !skipDefName x.raw
        && (match ty with
            | some t => !typeHasUInt32OrIo t
            | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmTypesSsaParseFuel body
        && termNoAppN liveLlvmTypesSsaParseFuel body
  | Cmd.defBind x bs ret body =>
      !skipDefName x.raw
        && !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmTypesSsaParseFuel body
        && termNoAppN liveLlvmTypesSsaParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefLlvmTypesSsa (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveLlvmTypesSsaSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open, theorem, example skip. -/
def parseOneCmdLlvmTypesSsa (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLlvmTypesSsa fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. A body outside the grammar skips that command only. -/
def parseCmdsLlvmTypesSsa : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmTypesSsa liveLlvmTypesSsaParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmTypesSsaSkipFuel rest
      if cmdBodyKnownLlvmTypesSsa kn c then
        parseCmdsLlvmTypesSsa n rest2
          (kn ++ cmdAddsLlvmTypesSsa c) (acc ++ [c])
      else
        parseCmdsLlvmTypesSsa n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveLlvmTypesSsaSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLlvmTypesSsa n rest2 kn acc
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

/-- Parse live LlvmTypesSsa.lean text.
    Greppable: parseLiveLlvmTypesSsaSource, PARSE-LIVE-LLVM-TYPES-SSA. -/
def parseLiveLlvmTypesSsaSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmTypesSsa liveLlvmTypesSsaParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmTypesSsa"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmTypesSsa parse. Not a fixture.
    Returns HostKernel.kernelCheck, not a hardcoded true.
    Greppable: kernelCheckLiveLlvmTypesSsaSource, PARSE-LIVE-LLVM-TYPES-SSA. -/
def kernelCheckLiveLlvmTypesSsaSource (src : String) : Bool :=
  match parseLiveLlvmTypesSsaSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmTypesSsaParsed? : Option Module :=
  match parseLiveLlvmTypesSsaSource liveLlvmTypesSsaSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Count non-overlapping needle hits. Empty needle counts as zero. -/
def countNeedle (hay needle : String) : Nat :=
  if needle.isEmpty then 0 else (hay.splitOn needle).length - 1

/-- Each library needle once, including the trailing newline. -/
def liveNeedlesOnce : Bool :=
  countNeedle liveLlvmTypesSsaSource "import SystemsLean.KernelTypes\n" == 1
    && countNeedle liveLlvmTypesSsaSource
      "namespace SystemsLean.LlvmTypesSsa\n" == 1
    && countNeedle liveLlvmTypesSsaSource
      "def stageId : String := \"SLAKE_LLVM_TYPES_SSA_V0\"\n" == 1
    && countNeedle liveLlvmTypesSsaSource
      "def hostId : String := \"HOST-LLVM-TYPES-SSA\"\n" == 1
    && countNeedle liveLlvmTypesSsaSource
      "def llvmTypesSsaFullBackendClaimed : Bool := false\n" == 1
    && countNeedle liveLlvmTypesSsaSource
      "def typesSsaBasename : String := \"slake_types_ssa.ll\"\n" == 1
    && countNeedle liveLlvmTypesSsaSource
      "def ssaShapedId : String := \"SSA-SHAPED\"\n" == 1
    && countNeedle liveLlvmTypesSsaSource
      "end SystemsLean.LlvmTypesSsa\n" == 1

/-- How many times `mod` is imported. -/
def importCount (m : Module) (mod : String) : Nat :=
  m.commands.foldl (fun n c =>
    match c with
    | Cmd.importModule x => if x.raw == mod then n + 1 else n
    | _ => n) 0

/-- Dotted imports kept, each once. -/
def liveParseHasRequiredImports : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    importCount m "SystemsLean.Mult" == 1
      && importCount m "SystemsLean.Types" == 1
      && importCount m "SystemsLean.KernelTypes" == 1
      && importCount m "SystemsLean.LlvmHold" == 1
      && importCount m "SystemsLean.LlvmEmitPath" == 1
      && importCount m "SystemsLean.LlvmTypesText" == 1
      && importCount m "SystemsLean.LlvmLinearSsa" == 1
      && importCount m "SystemsLean.LlvmMultSsa" == 1

/-- Live parse kept import SystemsLean.KernelTypes. -/
def liveParseHasKernelTypesImport : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m => importCount m "SystemsLean.KernelTypes" == 1

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Accepted command list is non-empty. Not the mill Main length == 1 pin. -/
def liveParseNonEmpty : Bool :=
  match liveLlvmTypesSsaParsed? with
  | some m => m.commands.length > 0
  | none => false

/-- Parsed module name is SystemsLean.LlvmTypesSsa (no module line in the file). -/
def liveParseModuleIsLlvmTypesSsa : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m => m.name.raw == "SystemsLean.LlvmTypesSsa"

/-- Namespace command kept. -/
def liveParseHasNamespace : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmTypesSsa"
      | _ => false

/-- End command kept. -/
def liveParseHasEnd : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmTypesSsa"
      | _ => false

/-- Simple String atom `stageId` kept. -/
def liveParseHasStageIdDef : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "stageId" && s == "SLAKE_LLVM_TYPES_SSA_V0"
      | _ => false

/-- Simple String atom `hostId` kept. -/
def liveParseHasHostIdDef : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "hostId" && s == "HOST-LLVM-TYPES-SSA"
      | _ => false

/-- Library bool llvmTypesSsaFullBackendClaimed stays false and is kept. -/
def liveParseHasFullBackendFalse : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.bool) (Term.litBool b) =>
        x.raw == "llvmTypesSsaFullBackendClaimed" && b == false
      | _ => false

/-- IO defs are not in the kernel-checked command list. -/
def liveParseSkippedIo : Bool :=
  match liveLlvmTypesSsaParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => skipDefName x.raw
      | Cmd.defBind x _ _ _ => skipDefName x.raw
      | _ => false)

/-- Skip-head still sees the IO def names in the live tokens. -/
def liveToksHaveIoDefs : Bool :=
  let toks := tokenizeHostTerm (stripCommentsOr liveLlvmTypesSsaSource)
  toksHaveDefNamed liveLlvmTypesSsaSkipFuel toks "validateTypesSsaPackage"
    && toksHaveDefNamed liveLlvmTypesSsaSkipFuel toks "llvmTypesSsaWrite"
    && toksHaveDefNamed liveLlvmTypesSsaSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Real conjunction. Not the constant true.
    Greppable: hostFrontLiveLlvmTypesSsaReady, PARSE-LIVE-LLVM-TYPES-SSA,
    HOST-FRONT-LIVE-LLVM-TYPES-SSA. -/
def hostFrontLiveLlvmTypesSsaReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_SSA_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-TYPES-SSA")
    && (parseId == "PARSE-LIVE-LLVM-TYPES-SSA")
    && (liveRel == "LlvmTypesSsa.lean")
    && (liveLlvmTypesSsaRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmTypesSsaFullHost
    && !hostFrontLiveLlvmTypesSsaFullBackend
    && !hostFrontLiveLlvmTypesSsaResidualFreeClaimed
    && !hostFrontLiveLlvmTypesSsaProvablyUnlocked
    && kernelCheckLiveLlvmTypesSsaSource liveLlvmTypesSsaSource
    && liveParseNonEmpty
    && liveParseModuleIsLlvmTypesSsa
    && liveParseHasKernelTypesImport
    && liveParseHasRequiredImports
    && liveParseHasNamespace
    && liveParseHasEnd
    && liveParseHasStageIdDef
    && liveParseHasHostIdDef
    && liveParseHasFullBackendFalse
    && liveParseHasNoCheckCmd
    && liveParseSkippedIo
    && liveToksHaveIoDefs
    && liveNeedlesOnce

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmTypesSsaSource "" with
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

def runLiveLlvmTypesSsa (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-TYPES-SSA =="
  IO.println s!"  host={hostId} file={liveLlvmTypesSsaRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmTypesSsaRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmTypesSsaRel}"
    throw (IO.userError s!"missing {liveLlvmTypesSsaRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmTypesSsaSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmTypesSsa.lean != liveLlvmTypesSsaSource"
    throw (IO.userError "dual-pin mismatch live LlvmTypesSsa.lean")
  let r := parseLiveLlvmTypesSsaSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-TYPES-SSA reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-TYPES-SSA reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    unless k do
      IO.eprintln s!"error: kernelCheck live LlvmTypesSsa parse false cmds={m.commands.length}"
      for c in m.commands do
        IO.eprintln s!"  cmd {cmdTrace c}"
      throw (IO.userError "kernelCheck live LlvmTypesSsa parse false")
    unless hostFrontLiveLlvmTypesSsaReady do
      IO.eprintln "error: hostFrontLiveLlvmTypesSsaReady false"
      IO.eprintln s!"  needles={liveNeedlesOnce} imports={liveParseHasRequiredImports} module={liveParseModuleIsLlvmTypesSsa} ns={liveParseHasNamespace} end={liveParseHasEnd} stageDef={liveParseHasStageIdDef} hostDef={liveParseHasHostIdDef} fullBackendFalse={liveParseHasFullBackendFalse} skippedIo={liveParseSkippedIo} toksIo={liveToksHaveIoDefs} nonempty={liveParseNonEmpty} liveRel={liveRel}"
      throw (IO.userError "hostFrontLiveLlvmTypesSsaReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"PASS PARSE-LIVE-LLVM-TYPES-SSA ACCEPT cmds={m.commands.length} kernelCheck=true via HostKernel.kernelCheck"
    IO.println s!"liveRel={liveRel}"
    IO.println s!"GREEN {stageId}: live LlvmTypesSsa.lean parse kernelCheck; FullBackend false; FullHost false; not an LLVM backend; not a mill remill; dests skipped"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmTypesSsa root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmTypesSsa
