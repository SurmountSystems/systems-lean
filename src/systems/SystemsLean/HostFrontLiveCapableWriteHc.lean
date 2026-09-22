/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableWriteHc.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCapableWriteHc. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses CapableWriteHc.lean only.
  Unique needles use trailing newline so HostFrontLiveCapableWriteHc is not a
  prefix hit on HostFrontLiveCapableWriteHcSource,
  HostFrontLiveCapableWriteHcParserMain, or mill wrap
  HostFrontLiveCapableWriteHcMain.
  Mill wrap HostFrontLiveCapableWriteHcMain parses CapableWriteHcMain.lean
  only. Do not steal it. Do not wrap CapableWriteHcLoad.lean.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  CapableWrite.lean does not exist. Do not invent it.
  Not HostResidualShrinkTermOk wrap. Not CompilePathLinear wrap.

  Spec (readable):
  - parseLiveCapableWriteHcSource turns live CapableWriteHc.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.CapableWriteHc even without a module line.
  - kernelCheckLiveCapableWriteHcSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. Kernelable string/Nat/Bool atom defs plus namespace / end
    remain. Dotted import kept; open skipped. Compound && ready pins skip.
  - Skip-fold ALL theorems and examples. Compound && ready pins skip
    (productPathFreestandingCapableWriteHcOk,
    productPathFreestandingCapableWriteHcPartialReady).
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
    cmdBodyKnown rejects typeHasUInt32OrIo so
    def main (args : List String) : IO UInt32 and
    freestandingCapableWriteFreestandingHc skip-fold.
  - Living namespace lastSeg is CapableWriteHc.
  - Wrap-assigned module lastSeg is CapableWriteHc.
  - Skip-head via toksHaveDefNamed: hostId and
    freestandingCapableWriteFreestandingHc. Do not require def stageId
    (that pin lives on CapableWriteHcLoad).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - CapableWrite.lean does not exist and is not invented.
  - Not mill CapableWriteHcMain wrap. Not CapableWriteHcLoad wrap.

  Unique needles (trailing newline so HostFrontLiveCapableWriteHc is not a prefix):
  HostFrontLiveCapableWriteHc
  PARSE-LIVE-CAPABLE-WRITE-HC
  HOST-FRONT-LIVE-CAPABLE-WRITE-HC
  SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveCapableWriteHcSource,
  kernelCheckLiveCapableWriteHcSource,
  hostFrontLiveCapableWriteHcReady, liveCapableWriteHcSource,
  liveCapableWriteHcRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveCapableWriteHc
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveCapableWriteHc on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableWriteHcSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableWriteHc

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-WRITE-HC"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-WRITE-HC"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableWriteHcRel : String :=
  "src/systems/SystemsLean/CapableWriteHc.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableWriteHcFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableWriteHcResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCapableWriteHcProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableWriteHcParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveCapableWriteHcSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    CapableWriteHc has quoted phrases in comments and IO print strings.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsCwhN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsCwhN n nest false false ('\n' :: acc) rest
        else
          stripCommentsCwhN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsCwhN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsCwhN n nest false false ('"' :: acc) rest
        else
          stripCommentsCwhN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsCwhN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsCwhN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsCwhN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsCwhN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsCwhN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsCwhN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsCwhN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsCwhN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live CapableWriteHc.lean bytes. -/
def stripCommentsCwh (src : String) : String :=
  String.ofList (stripCommentsCwhN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . CapableWriteHc`. -/
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
def cmdAddsCapableWriteHc (c : Cmd) : List String :=
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
def cmdBodyKnownCapableWriteHc (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableWriteHcParseFuel body
        && termNoAppN liveCapableWriteHcParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableWriteHcParseFuel body
        && termNoAppN liveCapableWriteHcParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefCapableWriteHc (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveCapableWriteHcSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdCapableWriteHc (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefCapableWriteHc fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsCapableWriteHc : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableWriteHc liveCapableWriteHcParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableWriteHcSkipFuel rest
      if cmdBodyKnownCapableWriteHc kn c then
        parseCmdsCapableWriteHc n rest2
          (kn ++ cmdAddsCapableWriteHc c) (acc ++ [c])
      else
        parseCmdsCapableWriteHc n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveCapableWriteHcSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsCapableWriteHc n rest2 kn acc
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

/-- Parse live CapableWriteHc.lean text.
    Greppable: parseLiveCapableWriteHcSource,
    PARSE-LIVE-CAPABLE-WRITE-HC. -/
def parseLiveCapableWriteHcSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsCwh src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableWriteHc liveCapableWriteHcParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableWriteHc"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableWriteHc parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveCapableWriteHcSource,
    PARSE-LIVE-CAPABLE-WRITE-HC. -/
def kernelCheckLiveCapableWriteHcSource (src : String) : Bool :=
  match parseLiveCapableWriteHcSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableWriteHcParsed? : Option Module :=
  match parseLiveCapableWriteHcSource liveCapableWriteHcSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableWriteHcParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=39: twenty-one dotted imports, namespace,
    sixteen kernelable String/Bool atoms, end. CapableWriteHc
    has import lines. Do not copy a DualEqWriteApi bound of 59. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableWriteHcParsed? with
  | some m => m.commands.length >= 39
  | none => false

/-- Wrap module lastSeg is CapableWriteHc (no module line in the live file). -/
def liveParseHasCapableWriteHcModule : Bool :=
  match liveCapableWriteHcParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CapableWriteHc"

/-- Live parse has the living CapableWriteHc namespace command. -/
def liveParseHasCapableWriteHcNs : Bool :=
  match liveCapableWriteHcParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CapableWriteHc"
      | _ => false

/-- Live product starts with import SystemsLean.CapableWriteHcLoad.
    Types-style: dotted import kept. Pin lastSeg CapableWriteHcLoad. -/
def liveParseHasCapableWriteHcLoadImport : Bool :=
  match liveCapableWriteHcParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "CapableWriteHcLoad"
      | _ => false

/-- Skip-head: def hostId and def freestandingCapableWriteFreestandingHc
    are in the live text. CapableWriteHc.lean has no local def stageId
    (that pin lives on CapableWriteHcLoad). IO body skip-folds; token
    walk still sees the def. -/
def liveParseHasCoreDefs : Bool :=
  match liveCapableWriteHcParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsCwh liveCapableWriteHcSource)
    toksHaveDefNamed liveCapableWriteHcSkipFuel toks "hostId"
      && toksHaveDefNamed liveCapableWriteHcSkipFuel toks
        "freestandingCapableWriteFreestandingHc"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableWriteHcReady,
    PARSE-LIVE-CAPABLE-WRITE-HC,
    HOST-FRONT-LIVE-CAPABLE-WRITE-HC.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCapableWriteHcReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-WRITE-HC")
    && (parseId == "PARSE-LIVE-CAPABLE-WRITE-HC")
    && (liveCapableWriteHcRel
      == "src/systems/SystemsLean/CapableWriteHc.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableWriteHcFullHost
    && !hostFrontLiveCapableWriteHcResidualFreeClaimed
    && !hostFrontLiveCapableWriteHcProvablyUnlocked
    && kernelCheckLiveCapableWriteHcSource liveCapableWriteHcSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCapableWriteHcModule
    && liveParseHasCapableWriteHcNs
    && liveParseHasCapableWriteHcLoadImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableWriteHcSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveCapableWriteHc (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-WRITE-HC =="
  IO.println s!"  host={hostId} file={liveCapableWriteHcRel}"
  let path := root / liveCapableWriteHcRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableWriteHcRel}"
    throw (IO.userError s!"missing {liveCapableWriteHcRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableWriteHcSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableWriteHc.lean != liveCapableWriteHcSource"
    throw (IO.userError "dual-pin mismatch live CapableWriteHc.lean")
  let r := parseLiveCapableWriteHcSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-WRITE-HC reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-WRITE-HC reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-WRITE-HC ACCEPT liveRel=CapableWriteHc.lean cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableWriteHc parse false"
      throw (IO.userError "kernelCheck live CapableWriteHc parse false")
    unless hostFrontLiveCapableWriteHcReady do
      IO.eprintln "error: hostFrontLiveCapableWriteHcReady false"
      throw (IO.userError "hostFrontLiveCapableWriteHcReady false")
    IO.println s!"GREEN {stageId}: live CapableWriteHc.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableWriteHc root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableWriteHc
