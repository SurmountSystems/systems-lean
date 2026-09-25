/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/MultFsWrite.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultFsWrite. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses MultFsWrite.lean only.
  Unique needles use trailing newline so HostFrontLiveMultFsWrite is not a
  prefix hit on HostFrontLiveMultFsWriteSource or a Theorems peel.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not a MultFsWriteTheorems peel wrap (do not invent that peel wrap).
  Not CapableWrite.lean. Not DualEqWrite.lean (those files do not exist).
  Not DualEqWriteApi wrap. Not ProductPathWriteHc wrap. Not mill 68 remill.
  Not SelfHostComplete wrap. Not CompilePathProgram wrap.

  Spec (readable):
  - parseLiveMultFsWriteSource turns live MultFsWrite.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.MultFsWrite even without a module line.
  - kernelCheckLiveMultFsWriteSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. Kernelable string/Nat/Bool atom defs plus namespace /
    end remain. This live file has one dotted import, kept. Skip-head still
    sees def lakeExeFsWrite and def surfaceId.
  - Skip-fold ALL theorems and examples. Compound && Ok / PartialReady skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is MultFsWrite.
  - Wrap-assigned module lastSeg is MultFsWrite.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 68 remill. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not a MultFsWriteTheorems peel wrap.

  Unique needles (trailing newline so HostFrontLiveMultFsWrite is not a prefix):
  HostFrontLiveMultFsWrite
  PARSE-LIVE-MULT-FS-WRITE
  HOST-FRONT-LIVE-MULT-FS-WRITE
  SLAKE_HOST_FRONT_LIVE_MULT_FS_WRITE_V0
  MULT-FS-WRITE

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveMultFsWriteSource,
  kernelCheckLiveMultFsWriteSource,
  hostFrontLiveMultFsWriteReady, liveMultFsWriteSource,
  liveMultFsWriteRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveMultFsWrite
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveMultFsWrite on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultFsWriteSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultFsWrite

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_FS_WRITE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-FS-WRITE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-FS-WRITE"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsWriteRel : String :=
  "src/systems/SystemsLean/MultFsWrite.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "MultFsWrite.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultFsWriteFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultFsWriteResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveMultFsWriteProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveMultFsWriteParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveMultFsWriteSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    MultFsWrite has quoted phrases in comments.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsMfwN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsMfwN n nest false false ('\n' :: acc) rest
        else
          stripCommentsMfwN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsMfwN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsMfwN n nest false false ('"' :: acc) rest
        else
          stripCommentsMfwN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsMfwN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsMfwN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsMfwN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsMfwN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsMfwN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsMfwN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsMfwN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsMfwN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live MultFsWrite.lean bytes. -/
def stripCommentsMfw (src : String) : String :=
  String.ofList (stripCommentsMfwN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . MultFsWrite`. -/
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
def cmdAddsMultFsWrite (c : Cmd) : List String :=
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
def cmdBodyKnownMultFsWrite (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultFsWriteParseFuel body
        && termNoAppN liveMultFsWriteParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultFsWriteParseFuel body
        && termNoAppN liveMultFsWriteParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefMultFsWrite (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveMultFsWriteSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdMultFsWrite (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefMultFsWrite fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsMultFsWrite : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMultFsWrite liveMultFsWriteParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveMultFsWriteSkipFuel rest
      if cmdBodyKnownMultFsWrite kn c then
        parseCmdsMultFsWrite n rest2
          (kn ++ cmdAddsMultFsWrite c) (acc ++ [c])
      else
        parseCmdsMultFsWrite n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveMultFsWriteSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsMultFsWrite n rest2 kn acc
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

/-- Parse live MultFsWrite.lean text.
    Greppable: parseLiveMultFsWriteSource,
    PARSE-LIVE-MULT-FS-WRITE. -/
def parseLiveMultFsWriteSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsMfw src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultFsWrite liveMultFsWriteParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultFsWrite"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultFsWrite parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveMultFsWriteSource,
    PARSE-LIVE-MULT-FS-WRITE. -/
def kernelCheckLiveMultFsWriteSource (src : String) : Bool :=
  match parseLiveMultFsWriteSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultFsWriteParsed? : Option Module :=
  match parseLiveMultFsWriteSource liveMultFsWriteSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultFsWriteParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=6: import, namespace, three kernelable String
    atoms, end. Dotted MultFsDeepen bodies and IO mains skip-folded.
    Do not copy ProductPathWriteHc 16. -/
def liveParseCmdCountOk : Bool :=
  match liveMultFsWriteParsed? with
  | some m => m.commands.length >= 6
  | none => false

/-- Wrap module lastSeg is MultFsWrite (no module line in the live file). -/
def liveParseHasMultFsWriteModule : Bool :=
  match liveMultFsWriteParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "MultFsWrite"

/-- Live parse has the living MultFsWrite namespace command. -/
def liveParseHasMultFsWriteNs : Bool :=
  match liveMultFsWriteParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "MultFsWrite"
      | _ => false

/-- Live product starts with import SystemsLean.MultFsDeepen.
    Types-style: dotted import kept. -/
def liveParseHasMultFsDeepenImport : Bool :=
  match liveMultFsWriteParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.MultFsDeepen"
      | _ => false

/-- Skip-head: defs unique to MultFsWrite.lean (not a Theorems peel).
    Greppable: lakeExeFsWrite, surfaceId. -/
def liveParseHasCoreDefs : Bool :=
  match liveMultFsWriteParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsMfw liveMultFsWriteSource)
    toksHaveDefNamed liveMultFsWriteSkipFuel toks
      "lakeExeFsWrite"
      && toksHaveDefNamed liveMultFsWriteSkipFuel toks
        "surfaceId"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveMultFsWriteReady,
    PARSE-LIVE-MULT-FS-WRITE,
    HOST-FRONT-LIVE-MULT-FS-WRITE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveMultFsWriteReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_FS_WRITE_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT-FS-WRITE")
    && (parseId == "PARSE-LIVE-MULT-FS-WRITE")
    && (liveMultFsWriteRel
      == "src/systems/SystemsLean/MultFsWrite.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultFsWriteFullHost
    && !hostFrontLiveMultFsWriteResidualFreeClaimed
    && !hostFrontLiveMultFsWriteProvablyUnlocked
    && kernelCheckLiveMultFsWriteSource liveMultFsWriteSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasMultFsWriteModule
    && liveParseHasMultFsWriteNs
    && liveParseHasMultFsDeepenImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultFsWriteSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 68 remill. -/

def runLiveMultFsWrite (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-FS-WRITE =="
  IO.println s!"  host={hostId} file={liveMultFsWriteRel}"
  let path := root / liveMultFsWriteRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultFsWriteRel}"
    throw (IO.userError s!"missing {liveMultFsWriteRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultFsWriteSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultFsWrite.lean != liveMultFsWriteSource"
    throw (IO.userError "dual-pin mismatch live MultFsWrite.lean")
  let r := parseLiveMultFsWriteSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-FS-WRITE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-FS-WRITE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-FS-WRITE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultFsWrite parse false"
      throw (IO.userError "kernelCheck live MultFsWrite parse false")
    unless hostFrontLiveMultFsWriteReady do
      IO.eprintln "error: hostFrontLiveMultFsWriteReady false"
      throw (IO.userError "hostFrontLiveMultFsWriteReady false")
    IO.println s!"GREEN {stageId}: live MultFsWrite.lean parse kernelCheck; not mill 68 remill"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultFsWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultFsWrite
