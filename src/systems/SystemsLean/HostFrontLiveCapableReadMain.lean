/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableReadMain.lean.
  Side: classic Lean elaborator under src/systems (not freestanding C).
  Short role: HostFrontLiveCapableReadMain. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses CapableReadMain.lean only. Do not wrap Capable.lean.
  Do not wrap CapableMain.lean.
  Unique needles use trailing newline so HostFrontLiveCapableReadMain is not a
  prefix hit on HostFrontLiveCapableReadMainSource or HostFrontLiveCapableReadMainMain.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not mill remill. Not mill 69 remill.
  CapableWrite.lean does not exist. Do not invent it.

  Spec (readable):
  - parseLiveCapableReadMainSource turns live CapableReadMain.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.CapableReadMain even without a module line.
  - kernelCheckLiveCapableReadMainSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. This live mill Main has no namespace, no end, and no
    String/Nat/Bool atom defs. The one dotted import is kept. Skip-head
    still sees def main via toksHaveDefNamed on stripped tokens.
  - Skip-fold ALL theorems and examples. Compound && ready pins skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
    cmdBodyKnown rejects typeHasUInt32OrIo so this live
    def main (args : List String) : IO UInt32 skip-folds.
  - This live file has no living namespace command. Do not require a
    CapableReadMain namespace pin as true.
  - Wrap-assigned module lastSeg is CapableReadMain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not Capable.lean wrap. Not CapableMain.lean wrap.
    CapableWrite.lean does not exist.

  Unique needles (trailing newline so HostFrontLiveCapableReadMain is not a prefix):
  HostFrontLiveCapableReadMain
  PARSE-LIVE-CAPABLE-READ-MAIN
  HOST-FRONT-LIVE-CAPABLE-READ-MAIN
  SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_MAIN_V0
  CAPABLE-READ-MAIN

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveCapableReadMainSource,
  kernelCheckLiveCapableReadMainSource,
  hostFrontLiveCapableReadMainReady, liveCapableReadMainSource,
  liveCapableReadMainRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveCapableReadMain
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveCapableReadMain on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableReadMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableReadMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-READ-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-READ-MAIN"

/-- Live file basename. Not a path. -/
def liveRel : String := "CapableReadMain.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableReadMainRel : String :=
  "src/systems/SystemsLean/CapableReadMain.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableReadMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableReadMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCapableReadMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableReadMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveCapableReadMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    CapableReadMain has no string literals; this strip stays in-string safe.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsCrmN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsCrmN n nest false false ('\n' :: acc) rest
        else
          stripCommentsCrmN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsCrmN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsCrmN n nest false false ('"' :: acc) rest
        else
          stripCommentsCrmN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsCrmN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsCrmN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsCrmN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsCrmN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsCrmN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsCrmN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsCrmN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsCrmN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live CapableReadMain.lean bytes. -/
def stripCommentsCrm (src : String) : String :=
  String.ofList (stripCommentsCrmN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . CapableRead`. -/
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
def cmdAddsCapableReadMain (c : Cmd) : List String :=
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
def cmdBodyKnownCapableReadMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableReadMainParseFuel body
        && termNoAppN liveCapableReadMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableReadMainParseFuel body
        && termNoAppN liveCapableReadMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefCapableReadMain (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveCapableReadMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdCapableReadMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefCapableReadMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsCapableReadMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableReadMain liveCapableReadMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableReadMainSkipFuel rest
      if cmdBodyKnownCapableReadMain kn c then
        parseCmdsCapableReadMain n rest2
          (kn ++ cmdAddsCapableReadMain c) (acc ++ [c])
      else
        parseCmdsCapableReadMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveCapableReadMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsCapableReadMain n rest2 kn acc
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

/-- Parse live CapableReadMain.lean text.
    Greppable: parseLiveCapableReadMainSource,
    PARSE-LIVE-CAPABLE-READ-MAIN. -/
def parseLiveCapableReadMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsCrm src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableReadMain liveCapableReadMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableReadMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableReadMain parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveCapableReadMainSource,
    PARSE-LIVE-CAPABLE-READ-MAIN. -/
def kernelCheckLiveCapableReadMainSource (src : String) : Bool :=
  match parseLiveCapableReadMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableReadMainParsed? : Option Module :=
  match parseLiveCapableReadMainSource liveCapableReadMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableReadMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=1: the one dotted import SystemsLean.CapableRead.
    Do not copy DualEq bound 59 or CapableMain import of Capable. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableReadMainParsed? with
  | some m => m.commands.length >= 1
  | none => false

/-- Wrap module lastSeg is CapableReadMain (no module line in the live file). -/
def liveParseHasCapableReadMainModule : Bool :=
  match liveCapableReadMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CapableReadMain"

/-- Live parse kept the one dotted import SystemsLean.CapableRead. -/
def liveParseHasCapableReadImport : Bool :=
  match liveCapableReadMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CapableRead"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveCapableReadMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsCrm liveCapableReadMainSource)
    toksHaveDefNamed liveCapableReadMainSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableReadMainReady,
    PARSE-LIVE-CAPABLE-READ-MAIN,
    HOST-FRONT-LIVE-CAPABLE-READ-MAIN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true.
    This mill Main has no namespace command; do not require one. -/
def hostFrontLiveCapableReadMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-READ-MAIN")
    && (parseId == "PARSE-LIVE-CAPABLE-READ-MAIN")
    && (liveCapableReadMainRel
      == "src/systems/SystemsLean/CapableReadMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableReadMainFullHost
    && !hostFrontLiveCapableReadMainResidualFreeClaimed
    && !hostFrontLiveCapableReadMainProvablyUnlocked
    && kernelCheckLiveCapableReadMainSource liveCapableReadMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCapableReadMainModule
    && liveParseHasCapableReadImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableReadMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveCapableReadMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-READ-MAIN =="
  IO.println s!"  host={hostId} file={liveCapableReadMainRel}"
  let path := root / liveCapableReadMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableReadMainRel}"
    throw (IO.userError s!"missing {liveCapableReadMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableReadMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableReadMain.lean != liveCapableReadMainSource"
    throw (IO.userError "dual-pin mismatch live CapableReadMain.lean")
  let r := parseLiveCapableReadMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-READ-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-READ-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-READ-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableReadMain parse false"
      throw (IO.userError "kernelCheck live CapableReadMain parse false")
    unless hostFrontLiveCapableReadMainReady do
      IO.eprintln "error: hostFrontLiveCapableReadMainReady false"
      throw (IO.userError "hostFrontLiveCapableReadMainReady false")
    IO.println s!"GREEN {stageId}: live CapableReadMain.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableReadMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableReadMain
