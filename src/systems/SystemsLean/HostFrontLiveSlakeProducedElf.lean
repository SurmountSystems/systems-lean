/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SlakeProducedElf.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeProducedElf. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses SlakeProducedElf.lean only.
  Unique needles use trailing newline so HostFrontLiveSlakeProducedElf is not a
  prefix hit on HostFrontLiveSlakeProducedElfSource or a Theorems peel.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Dest ELF out/slake-produced-elf/slake-hello is a different artifact.
  Not mill remill. Mill stays 69 of 69.

  Spec (readable):
  - parseLiveSlakeProducedElfSource turns live SlakeProducedElf.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.SlakeProducedElf even without a module line.
  - kernelCheckLiveSlakeProducedElfSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. Kernelable string/Nat/Bool atom defs plus namespace /
    end remain. This live file has no import lines. Skip-head still sees
    def slakeProducedElfWrapIr and def slakeProducedElfWrite.
  - Skip-fold ALL theorems and examples. Compound && ready pins skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is SlakeProducedElf.
  - Wrap-assigned module lastSeg is SlakeProducedElf.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not occupancy leftover Term wrap.

  Unique needles (trailing newline so HostFrontLiveSlakeProducedElf is not a prefix):
  HostFrontLiveSlakeProducedElf
  PARSE-LIVE-SLAKE-PRODUCED-ELF
  HOST-FRONT-LIVE-SLAKE-PRODUCED-ELF
  SLAKE_HOST_FRONT_LIVE_SLAKE_PRODUCED_ELF_V0
  SLAKE-PRODUCED-ELF

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveSlakeProducedElfSource,
  kernelCheckLiveSlakeProducedElfSource,
  hostFrontLiveSlakeProducedElfReady, liveSlakeProducedElfSource,
  liveSlakeProducedElfRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveSlakeProducedElf
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveSlakeProducedElf on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeProducedElfSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeProducedElf

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SLAKE_PRODUCED_ELF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SLAKE-PRODUCED-ELF"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SLAKE-PRODUCED-ELF"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeProducedElfRel : String :=
  "src/systems/SystemsLean/SlakeProducedElf.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "SlakeProducedElf.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeProducedElfFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeProducedElfResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSlakeProducedElfProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeProducedElfParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveSlakeProducedElfSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsSpeN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsSpeN n nest false false ('\n' :: acc) rest
        else
          stripCommentsSpeN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsSpeN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsSpeN n nest false false ('"' :: acc) rest
        else
          stripCommentsSpeN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsSpeN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsSpeN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsSpeN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsSpeN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsSpeN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsSpeN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsSpeN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsSpeN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live SlakeProducedElf.lean bytes. -/
def stripCommentsSpe (src : String) : String :=
  String.ofList (stripCommentsSpeN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . SlakeProducedElf`. -/
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
def cmdAddsSlakeProducedElf (c : Cmd) : List String :=
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
def cmdBodyKnownSlakeProducedElf (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeProducedElfParseFuel body
        && termNoAppN liveSlakeProducedElfParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeProducedElfParseFuel body
        && termNoAppN liveSlakeProducedElfParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefSlakeProducedElf (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveSlakeProducedElfSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdSlakeProducedElf (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSlakeProducedElf fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsSlakeProducedElf : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeProducedElf liveSlakeProducedElfParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeProducedElfSkipFuel rest
      if cmdBodyKnownSlakeProducedElf kn c then
        parseCmdsSlakeProducedElf n rest2
          (kn ++ cmdAddsSlakeProducedElf c) (acc ++ [c])
      else
        parseCmdsSlakeProducedElf n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSlakeProducedElfSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSlakeProducedElf n rest2 kn acc
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

/-- Parse live SlakeProducedElf.lean text.
    Greppable: parseLiveSlakeProducedElfSource,
    PARSE-LIVE-SLAKE-PRODUCED-ELF. -/
def parseLiveSlakeProducedElfSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsSpe src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeProducedElf liveSlakeProducedElfParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SlakeProducedElf"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeProducedElf parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveSlakeProducedElfSource,
    PARSE-LIVE-SLAKE-PRODUCED-ELF. -/
def kernelCheckLiveSlakeProducedElfSource (src : String) : Bool :=
  match parseLiveSlakeProducedElfSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeProducedElfParsed? : Option Module :=
  match parseLiveSlakeProducedElfSource liveSlakeProducedElfSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeProducedElfParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    expected cmds=9: namespace, seven kernelable String atoms, end.
    This live file has no import lines. Do not copy a DualEqWriteApi
    bound of 59. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeProducedElfParsed? with
  | some m => m.commands.length >= 9
  | none => false

/-- Wrap module lastSeg is SlakeProducedElf (no module line in the live file). -/
def liveParseHasSlakeProducedElfModule : Bool :=
  match liveSlakeProducedElfParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "SlakeProducedElf"

/-- Live parse has the living SlakeProducedElf namespace command. -/
def liveParseHasSlakeProducedElfNs : Bool :=
  match liveSlakeProducedElfParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SlakeProducedElf"
      | _ => false

/-- Skip-head: defs unique to SlakeProducedElf.lean (not occupancy Term
    string payloads). Greppable: slakeProducedElfWrapIr,
    slakeProducedElfWrite. -/
def liveParseHasCoreDefs : Bool :=
  match liveSlakeProducedElfParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsSpe liveSlakeProducedElfSource)
    toksHaveDefNamed liveSlakeProducedElfSkipFuel toks
      "slakeProducedElfWrapIr"
      && toksHaveDefNamed liveSlakeProducedElfSkipFuel toks
        "slakeProducedElfWrite"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeProducedElfReady,
    PARSE-LIVE-SLAKE-PRODUCED-ELF,
    HOST-FRONT-LIVE-SLAKE-PRODUCED-ELF.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSlakeProducedElfReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SLAKE_PRODUCED_ELF_V0")
    && (hostId == "HOST-FRONT-LIVE-SLAKE-PRODUCED-ELF")
    && (parseId == "PARSE-LIVE-SLAKE-PRODUCED-ELF")
    && (liveSlakeProducedElfRel
      == "src/systems/SystemsLean/SlakeProducedElf.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeProducedElfFullHost
    && !hostFrontLiveSlakeProducedElfResidualFreeClaimed
    && !hostFrontLiveSlakeProducedElfProvablyUnlocked
    && kernelCheckLiveSlakeProducedElfSource liveSlakeProducedElfSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSlakeProducedElfModule
    && liveParseHasSlakeProducedElfNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeProducedElfSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveSlakeProducedElf (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-PRODUCED-ELF =="
  IO.println s!"  host={hostId} file={liveSlakeProducedElfRel}"
  let path := root / liveSlakeProducedElfRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeProducedElfRel}"
    throw (IO.userError s!"missing {liveSlakeProducedElfRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeProducedElfSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeProducedElf.lean != liveSlakeProducedElfSource"
    throw (IO.userError "dual-pin mismatch live SlakeProducedElf.lean")
  let r := parseLiveSlakeProducedElfSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-PRODUCED-ELF reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-PRODUCED-ELF reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-PRODUCED-ELF ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeProducedElf parse false"
      throw (IO.userError "kernelCheck live SlakeProducedElf parse false")
    unless hostFrontLiveSlakeProducedElfReady do
      IO.eprintln "error: hostFrontLiveSlakeProducedElfReady false"
      throw (IO.userError "hostFrontLiveSlakeProducedElfReady false")
    IO.println s!"GREEN {stageId}: live SlakeProducedElf.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeProducedElf root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeProducedElf
