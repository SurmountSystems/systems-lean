/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SurfaceMatrix.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSurfaceMatrix. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses SurfaceMatrix.lean.
  HostFrontLiveSurface wraps occupancy Surface leftover, not this file.
  Occupancy leftover HostModuleCheckSurfaceMatrixTerm is not this wrap.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not SurfaceMatrixTheorems wrap. Not HostFrontLiveSurfaceMatrixTheorems.

  Spec (readable):
  - parseLiveSurfaceMatrixSource turns live SurfaceMatrix.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.SurfaceMatrix even without a module line.
  - kernelCheckLiveSurfaceMatrixSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app) are
    skip-folded. Kernelable string/Nat/Bool atom defs plus import /
    namespace / end remain. Skip-head still sees def stageId and
    def matrixSurfaceOk.
  - Skip-fold ALL theorems (theorems live in SurfaceMatrixTheorems).
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is SurfaceMatrix.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.

  Unique needles (trailing newline so HostFrontLiveSurface is not a prefix):
  HostFrontLiveSurfaceMatrix
  PARSE-LIVE-SURFACE-MATRIX
  HOST-FRONT-LIVE-SURFACE-MATRIX
  SLAKE_HOST_FRONT_LIVE_SURFACE_MATRIX_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveSurfaceMatrixSource,
  kernelCheckLiveSurfaceMatrixSource,
  hostFrontLiveSurfaceMatrixReady, liveSurfaceMatrixSource,
  liveSurfaceMatrixRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveSurfaceMatrix
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveSurfaceMatrix on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSurfaceMatrixSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSurfaceMatrix

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SURFACE_MATRIX_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SURFACE-MATRIX"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SURFACE-MATRIX"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSurfaceMatrixRel : String :=
  "src/systems/SystemsLean/SurfaceMatrix.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "SurfaceMatrix.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSurfaceMatrixFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSurfaceMatrixResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSurfaceMatrixProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSurfaceMatrixParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveSurfaceMatrixSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    SurfaceMatrix path cites contain /; HostFrontLiveMult.stripComments is
    not in-string safe. -/
def stripCommentsSmN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsSmN n nest false false ('\n' :: acc) rest
        else
          stripCommentsSmN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsSmN n nest false false ('"' :: acc) rest
        else
          stripCommentsSmN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsSmN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsSmN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsSmN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsSmN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsSmN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsSmN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsSmN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsSmN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live SurfaceMatrix.lean bytes. -/
def stripCommentsSm (src : String) : String :=
  String.ofList (stripCommentsSmN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . SurfaceMatrix`. -/
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
def cmdAddsSurfaceMatrix (c : Cmd) : List String :=
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
def cmdBodyKnownSurfaceMatrix (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSurfaceMatrixParseFuel body
        && termNoAppN liveSurfaceMatrixParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSurfaceMatrixParseFuel body
        && termNoAppN liveSurfaceMatrixParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefSurfaceMatrix (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveSurfaceMatrixSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdSurfaceMatrix (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSurfaceMatrix fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsSurfaceMatrix : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSurfaceMatrix liveSurfaceMatrixParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSurfaceMatrixSkipFuel rest
      if cmdBodyKnownSurfaceMatrix kn c then
        parseCmdsSurfaceMatrix n rest2
          (kn ++ cmdAddsSurfaceMatrix c) (acc ++ [c])
      else
        parseCmdsSurfaceMatrix n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSurfaceMatrixSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSurfaceMatrix n rest2 kn acc
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

/-- Parse live SurfaceMatrix.lean text.
    Greppable: parseLiveSurfaceMatrixSource,
    PARSE-LIVE-SURFACE-MATRIX. -/
def parseLiveSurfaceMatrixSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsSm src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSurfaceMatrix liveSurfaceMatrixParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SurfaceMatrix"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SurfaceMatrix parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveSurfaceMatrixSource,
    PARSE-LIVE-SURFACE-MATRIX. -/
def kernelCheckLiveSurfaceMatrixSource (src : String) : Bool :=
  match parseLiveSurfaceMatrixSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSurfaceMatrixParsed? : Option Module :=
  match parseLiveSurfaceMatrixSource liveSurfaceMatrixSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSurfaceMatrixParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / atom defs / end).
    Real lower bound, not hardcoded true. Eight dotted imports plus
    namespace plus end is already >= 10 if end exists. -/
def liveParseCmdCountOk : Bool :=
  match liveSurfaceMatrixParsed? with
  | some m => m.commands.length >= 10
  | none => false

/-- Wrap module lastSeg is SurfaceMatrix (no module line in the live file). -/
def liveParseHasSurfaceMatrixModule : Bool :=
  match liveSurfaceMatrixParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "SurfaceMatrix"

/-- Live parse has the living SurfaceMatrix namespace command. -/
def liveParseHasSurfaceMatrixNs : Bool :=
  match liveSurfaceMatrixParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SurfaceMatrix"
      | _ => false

/-- Live parse imports SystemsLean.Mult (first dotted import). -/
def liveParseHasMultImport : Bool :=
  match liveSurfaceMatrixParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse imports SystemsLean.SelfHost (last dotted import). -/
def liveParseHasSelfHostImport : Bool :=
  match liveSurfaceMatrixParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "SelfHost"
      | _ => false

/-- Skip-head: def stageId and def matrixSurfaceOk are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveSurfaceMatrixParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsSm liveSurfaceMatrixSource)
    toksHaveDefNamed liveSurfaceMatrixSkipFuel toks "stageId"
      && toksHaveDefNamed liveSurfaceMatrixSkipFuel toks "matrixSurfaceOk"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSurfaceMatrixReady,
    PARSE-LIVE-SURFACE-MATRIX,
    HOST-FRONT-LIVE-SURFACE-MATRIX.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSurfaceMatrixReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SURFACE_MATRIX_V0")
    && (hostId == "HOST-FRONT-LIVE-SURFACE-MATRIX")
    && (parseId == "PARSE-LIVE-SURFACE-MATRIX")
    && (liveSurfaceMatrixRel
      == "src/systems/SystemsLean/SurfaceMatrix.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSurfaceMatrixFullHost
    && !hostFrontLiveSurfaceMatrixResidualFreeClaimed
    && !hostFrontLiveSurfaceMatrixProvablyUnlocked
    && kernelCheckLiveSurfaceMatrixSource liveSurfaceMatrixSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSurfaceMatrixModule
    && liveParseHasSurfaceMatrixNs
    && liveParseHasMultImport
    && liveParseHasSelfHostImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSurfaceMatrixSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSurfaceMatrix (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SURFACE-MATRIX =="
  IO.println s!"  host={hostId} file={liveSurfaceMatrixRel}"
  let path := root / liveSurfaceMatrixRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSurfaceMatrixRel}"
    throw (IO.userError s!"missing {liveSurfaceMatrixRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSurfaceMatrixSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SurfaceMatrix.lean != liveSurfaceMatrixSource"
    throw (IO.userError "dual-pin mismatch live SurfaceMatrix.lean")
  let r := parseLiveSurfaceMatrixSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SURFACE-MATRIX reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SURFACE-MATRIX reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SURFACE-MATRIX ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SurfaceMatrix parse false"
      throw (IO.userError "kernelCheck live SurfaceMatrix parse false")
    unless hostFrontLiveSurfaceMatrixReady do
      IO.eprintln "error: hostFrontLiveSurfaceMatrixReady false"
      throw (IO.userError "hostFrontLiveSurfaceMatrixReady false")
    IO.println s!"GREEN {stageId}: live SurfaceMatrix.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSurfaceMatrix root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSurfaceMatrix
