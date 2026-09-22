/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitApplyScaffold.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitApplyScaffold. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses EmitApplyScaffold.lean.
  HostFrontLiveEmitApply does not exist; needles use trailing newline
  so that name is not a prefix hit.
  Occupancy leftover HostModuleCheckEmitApplyScaffoldTerm is not this wrap.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not EmitTypesScaffold wrap. Not HostFrontLiveEmitApply.

  Spec (readable):
  - parseLiveEmitApplyScaffoldSource turns live EmitApplyScaffold.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.EmitApplyScaffold even without a module line.
  - kernelCheckLiveEmitApplyScaffoldSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app) are
    skip-folded. Kernelable string/Nat/Bool atom defs plus namespace / end
    remain. This live file has no import line. Skip-head still sees def
    productStageId and def emitApplyReady.
  - Skip-fold ALL theorems and examples.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is EmitApply (not EmitApplyScaffold).
  - Wrap-assigned module lastSeg is EmitApplyScaffold.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.

  Unique needles (trailing newline so HostFrontLiveEmitApply is not a prefix):
  HostFrontLiveEmitApplyScaffold
  PARSE-LIVE-EMIT-APPLY-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-APPLY-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_SCAFFOLD_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitApplyScaffoldSource,
  kernelCheckLiveEmitApplyScaffoldSource,
  hostFrontLiveEmitApplyScaffoldReady, liveEmitApplyScaffoldSource,
  liveEmitApplyScaffoldRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveEmitApplyScaffold
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveEmitApplyScaffold on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitApplyScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitApplyScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-APPLY-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-APPLY-SCAFFOLD"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitApplyScaffoldRel : String :=
  "src/systems/SystemsLean/EmitApplyScaffold.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitApplyScaffoldFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitApplyScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitApplyScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitApplyScaffoldParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitApplyScaffoldSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    EmitApplyScaffold has path cites and C string payloads with quotes
    and slash-star. HostFrontLiveMult.stripComments is not in-string
    safe. Backslash keeps the next char inside a string (C `\"`). -/
def stripCommentsEasN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsEasN n nest false false ('\n' :: acc) rest
        else
          stripCommentsEasN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsEasN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsEasN n nest false false ('"' :: acc) rest
        else
          stripCommentsEasN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsEasN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsEasN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsEasN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsEasN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsEasN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsEasN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsEasN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsEasN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live EmitApplyScaffold.lean bytes. -/
def stripCommentsEas (src : String) : String :=
  String.ofList (stripCommentsEasN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . EmitApply`. -/
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
def cmdAddsEmitApplyScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitApplyScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitApplyScaffoldParseFuel body
        && termNoAppN liveEmitApplyScaffoldParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitApplyScaffoldParseFuel body
        && termNoAppN liveEmitApplyScaffoldParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefEmitApplyScaffold (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveEmitApplyScaffoldSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdEmitApplyScaffold (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefEmitApplyScaffold fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsEmitApplyScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitApplyScaffold liveEmitApplyScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitApplyScaffoldSkipFuel rest
      if cmdBodyKnownEmitApplyScaffold kn c then
        parseCmdsEmitApplyScaffold n rest2
          (kn ++ cmdAddsEmitApplyScaffold c) (acc ++ [c])
      else
        parseCmdsEmitApplyScaffold n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveEmitApplyScaffoldSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsEmitApplyScaffold n rest2 kn acc
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

/-- Parse live EmitApplyScaffold.lean text.
    Greppable: parseLiveEmitApplyScaffoldSource,
    PARSE-LIVE-EMIT-APPLY-SCAFFOLD. -/
def parseLiveEmitApplyScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsEas src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitApplyScaffold liveEmitApplyScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitApplyScaffold"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitApplyScaffold parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveEmitApplyScaffoldSource,
    PARSE-LIVE-EMIT-APPLY-SCAFFOLD. -/
def kernelCheckLiveEmitApplyScaffoldSource (src : String) : Bool :=
  match parseLiveEmitApplyScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitApplyScaffoldParsed? : Option Module :=
  match parseLiveEmitApplyScaffoldSource liveEmitApplyScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitApplyScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / atom defs / end). Real lower
    bound, not hardcoded true. This live file has no import line; do
    not copy a >= 10 import-heavy bound. Namespace plus six string
    atoms plus end is 8 when those defs kernel. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitApplyScaffoldParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Wrap module lastSeg is EmitApplyScaffold (no module line in the live file). -/
def liveParseHasEmitApplyScaffoldModule : Bool :=
  match liveEmitApplyScaffoldParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitApplyScaffold"

/-- Live parse has the living EmitApply namespace command. -/
def liveParseHasEmitApplyNs : Bool :=
  match liveEmitApplyScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "EmitApply"
      | _ => false

/-- Honesty: live product has no import line, so the parse must not
    keep an import command. -/
def liveParseHasNoImport : Bool :=
  match liveEmitApplyScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Skip-head: def productStageId and def emitApplyReady are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveEmitApplyScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsEas liveEmitApplyScaffoldSource)
    toksHaveDefNamed liveEmitApplyScaffoldSkipFuel toks "productStageId"
      && toksHaveDefNamed liveEmitApplyScaffoldSkipFuel toks "emitApplyReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitApplyScaffoldReady,
    PARSE-LIVE-EMIT-APPLY-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-APPLY-SCAFFOLD.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveEmitApplyScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-APPLY-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-APPLY-SCAFFOLD")
    && (liveEmitApplyScaffoldRel
      == "src/systems/SystemsLean/EmitApplyScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitApplyScaffoldFullHost
    && !hostFrontLiveEmitApplyScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitApplyScaffoldProvablyUnlocked
    && kernelCheckLiveEmitApplyScaffoldSource liveEmitApplyScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitApplyScaffoldModule
    && liveParseHasEmitApplyNs
    && liveParseHasNoImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitApplyScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitApplyScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-APPLY-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitApplyScaffoldRel}"
  let path := root / liveEmitApplyScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitApplyScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitApplyScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitApplyScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitApplyScaffold.lean != liveEmitApplyScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitApplyScaffold.lean")
  let r := parseLiveEmitApplyScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-APPLY-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-APPLY-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-APPLY-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitApplyScaffold parse false"
      throw (IO.userError "kernelCheck live EmitApplyScaffold parse false")
    unless hostFrontLiveEmitApplyScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitApplyScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitApplyScaffoldReady false")
    IO.println s!"GREEN {stageId}: live EmitApplyScaffold.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitApplyScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitApplyScaffold
