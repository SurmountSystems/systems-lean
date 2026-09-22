/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/PerformClaimed.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePerformClaimed. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses PerformClaimed.lean only.
  Unique needles use trailing newline so HostFrontLivePerformClaimed is not a
  prefix hit on HostFrontLivePerformClaimedSource or a Theorems peel.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not PerformClaimedTheorems wrap. Not CapableWrite.lean. Not DualEqWrite.lean.
  Not OfficialRetire wrap. Not HostResidualShrink wrap. Not HostCost wrap.

  Spec (readable):
  - parseLivePerformClaimedSource turns live PerformClaimed.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.PerformClaimed even without a module line.
  - kernelCheckLivePerformClaimedSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app) are
    skip-folded. Kernelable string/Nat/Bool atom defs plus namespace / end
    remain. This live file has no dotted import lines. Skip-head still
    sees def stageId and def hostId.
  - Skip-fold ALL theorems and examples. Compound && ready pins skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is PerformClaimed.
  - Wrap-assigned module lastSeg is PerformClaimed.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not the PerformClaimedTheorems peel.

  Unique needles (trailing newline so HostFrontLivePerformClaimed is not a prefix):
  HostFrontLivePerformClaimed
  PARSE-LIVE-PERFORM-CLAIMED
  HOST-FRONT-LIVE-PERFORM-CLAIMED
  SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLivePerformClaimedSource,
  kernelCheckLivePerformClaimedSource,
  hostFrontLivePerformClaimedReady, livePerformClaimedSource,
  livePerformClaimedRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLivePerformClaimed
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLivePerformClaimed on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLivePerformClaimedSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLivePerformClaimed

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PERFORM-CLAIMED"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PERFORM-CLAIMED"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformClaimedRel : String :=
  "src/systems/SystemsLean/PerformClaimed.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLivePerformClaimedFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLivePerformClaimedResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLivePerformClaimedProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def livePerformClaimedParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def livePerformClaimedSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    PerformClaimed has quoted phrases in comments and IO print strings.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsPcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPcN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPcN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPcN n nest false false ('"' :: acc) rest
        else
          stripCommentsPcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live PerformClaimed.lean bytes. -/
def stripCommentsPc (src : String) : String :=
  String.ofList (stripCommentsPcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . PerformClaimed`. -/
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
def cmdAddsPerformClaimed (c : Cmd) : List String :=
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
def cmdBodyKnownPerformClaimed (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformClaimedParseFuel body
        && termNoAppN livePerformClaimedParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformClaimedParseFuel body
        && termNoAppN livePerformClaimedParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefPerformClaimed (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd livePerformClaimedSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdPerformClaimed (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefPerformClaimed fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsPerformClaimed : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPerformClaimed livePerformClaimedParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd livePerformClaimedSkipFuel rest
      if cmdBodyKnownPerformClaimed kn c then
        parseCmdsPerformClaimed n rest2
          (kn ++ cmdAddsPerformClaimed c) (acc ++ [c])
      else
        parseCmdsPerformClaimed n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd livePerformClaimedSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsPerformClaimed n rest2 kn acc
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

/-- Parse live PerformClaimed.lean text.
    Greppable: parseLivePerformClaimedSource,
    PARSE-LIVE-PERFORM-CLAIMED. -/
def parseLivePerformClaimedSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPerformClaimed livePerformClaimedParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.PerformClaimed"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live PerformClaimed parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLivePerformClaimedSource,
    PARSE-LIVE-PERFORM-CLAIMED. -/
def kernelCheckLivePerformClaimedSource (src : String) : Bool :=
  match parseLivePerformClaimedSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def livePerformClaimedParsed? : Option Module :=
  match parseLivePerformClaimedSource livePerformClaimedSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match livePerformClaimedParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=42: namespace, forty kernelable String/Bool
    atoms, end. PerformClaimed has no import lines. Do not copy a
    HostCost bound of 16. -/
def liveParseCmdCountOk : Bool :=
  match livePerformClaimedParsed? with
  | some m => m.commands.length >= 42
  | none => false

/-- Wrap module lastSeg is PerformClaimed (no module line in the live file). -/
def liveParseHasPerformClaimedModule : Bool :=
  match livePerformClaimedParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "PerformClaimed"

/-- Live parse has the living PerformClaimed namespace command. -/
def liveParseHasPerformClaimedNs : Bool :=
  match livePerformClaimedParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "PerformClaimed"
      | _ => false

/-- Honesty: live product has no import line, so the parse must not
    keep an import command. -/
def liveParseHasNoImport : Bool :=
  match livePerformClaimedParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Skip-head: def stageId and def hostId are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match livePerformClaimedParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsPc livePerformClaimedSource)
    toksHaveDefNamed livePerformClaimedSkipFuel toks "stageId"
      && toksHaveDefNamed livePerformClaimedSkipFuel toks "hostId"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLivePerformClaimedReady,
    PARSE-LIVE-PERFORM-CLAIMED,
    HOST-FRONT-LIVE-PERFORM-CLAIMED.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLivePerformClaimedReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_V0")
    && (hostId == "HOST-FRONT-LIVE-PERFORM-CLAIMED")
    && (parseId == "PARSE-LIVE-PERFORM-CLAIMED")
    && (livePerformClaimedRel
      == "src/systems/SystemsLean/PerformClaimed.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLivePerformClaimedFullHost
    && !hostFrontLivePerformClaimedResidualFreeClaimed
    && !hostFrontLivePerformClaimedProvablyUnlocked
    && kernelCheckLivePerformClaimedSource livePerformClaimedSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasPerformClaimedModule
    && liveParseHasPerformClaimedNs
    && liveParseHasNoImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLivePerformClaimedSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLivePerformClaimed (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PERFORM-CLAIMED =="
  IO.println s!"  host={hostId} file={livePerformClaimedRel}"
  let path := root / livePerformClaimedRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {livePerformClaimedRel}"
    throw (IO.userError s!"missing {livePerformClaimedRel}")
  let disk <- IO.FS.readFile path
  if disk != livePerformClaimedSource then
    IO.eprintln "error: dual-pin mismatch: on-disk PerformClaimed.lean != livePerformClaimedSource"
    throw (IO.userError "dual-pin mismatch live PerformClaimed.lean")
  let r := parseLivePerformClaimedSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PERFORM-CLAIMED reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PERFORM-CLAIMED reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PERFORM-CLAIMED ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live PerformClaimed parse false"
      throw (IO.userError "kernelCheck live PerformClaimed parse false")
    unless hostFrontLivePerformClaimedReady do
      IO.eprintln "error: hostFrontLivePerformClaimedReady false"
      throw (IO.userError "hostFrontLivePerformClaimedReady false")
    IO.println s!"GREEN {stageId}: live PerformClaimed.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLivePerformClaimed root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLivePerformClaimed
