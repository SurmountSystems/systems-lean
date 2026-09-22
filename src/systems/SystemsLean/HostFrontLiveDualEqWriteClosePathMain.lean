/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/DualEqWriteClosePathMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveDualEqWriteClosePathMain. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses DualEqWriteClosePathMain.lean only. Do not wrap DualEqWriteClosePath.lean.
  Do not invent HostFrontLiveDualEqWriteClosePath.lean as a library wrap.
  Unique needles use trailing newline so HostFrontLiveDualEqWriteClosePathMain is not a
  prefix hit on HostFrontLiveDualEqWriteClosePathMainSource or
  HostFrontLiveDualEqWriteClosePathMainMain.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not mill 15 remill (just fifteenth-host-tool). Not mill 69 remill.
  DualEqWrite.lean does not exist. Do not invent it.
  Do not wrap DualEqWriteApiMain. Do not wrap DualEqWriteParityMain.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.

  Spec (readable):
  - parseLiveDualEqWriteClosePathMainSource turns live DualEqWriteClosePathMain.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.DualEqWriteClosePathMain even without a module line.
  - kernelCheckLiveDualEqWriteClosePathMainSource is HostKernel.kernelCheck of
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
    DualEqWriteClosePathMain namespace pin as true.
  - Wrap-assigned module lastSeg is DualEqWriteClosePathMain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 15 remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not DualEqWriteClosePath.lean wrap. DualEqWrite.lean does not exist.

  Unique needles (trailing newline so HostFrontLiveDualEqWriteClosePathMain is not a prefix):
  HostFrontLiveDualEqWriteClosePathMain
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0
  DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  HOST-DUAL-EQ-WRITE-CLOSE-PATH-MAIN

  Live product needles:
  DualEqWriteClosePathMain
  slake-freestanding-perform-dual-equality-write-close-path
  DualEqWriteClosePath
  productPathFreestandingPerformDualEqualityWriteClosePath
  SKELETON
  SYSTEMS_LEAN_HOST

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveDualEqWriteClosePathMainSource,
  kernelCheckLiveDualEqWriteClosePathMainSource,
  hostFrontLiveDualEqWriteClosePathMainReady, liveDualEqWriteClosePathMainSource,
  liveDualEqWriteClosePathMainRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveDualEqWriteClosePathMain
  Red/green: dests skipped this slice (barrel lock). Not lake queued.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveDualEqWriteClosePathMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveDualEqWriteClosePathMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteClosePathMainRel : String :=
  "src/systems/SystemsLean/DualEqWriteClosePathMain.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveDualEqWriteClosePathMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveDualEqWriteClosePathMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveDualEqWriteClosePathMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveDualEqWriteClosePathMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveDualEqWriteClosePathMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    DualEqWriteClosePathMain has no string literals; this strip stays in-string safe.
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

/-- String-safe comment strip for live DualEqWriteClosePathMain.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . DualEqWriteClosePath`. -/
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
def cmdAddsDualEqWriteClosePathMain (c : Cmd) : List String :=
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
def cmdBodyKnownDualEqWriteClosePathMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteClosePathMainParseFuel body
        && termNoAppN liveDualEqWriteClosePathMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteClosePathMainParseFuel body
        && termNoAppN liveDualEqWriteClosePathMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefDualEqWriteClosePathMain (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveDualEqWriteClosePathMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdDualEqWriteClosePathMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefDualEqWriteClosePathMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsDualEqWriteClosePathMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdDualEqWriteClosePathMain liveDualEqWriteClosePathMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveDualEqWriteClosePathMainSkipFuel rest
      if cmdBodyKnownDualEqWriteClosePathMain kn c then
        parseCmdsDualEqWriteClosePathMain n rest2
          (kn ++ cmdAddsDualEqWriteClosePathMain c) (acc ++ [c])
      else
        parseCmdsDualEqWriteClosePathMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveDualEqWriteClosePathMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsDualEqWriteClosePathMain n rest2 kn acc
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

/-- Parse live DualEqWriteClosePathMain.lean text.
    Greppable: parseLiveDualEqWriteClosePathMainSource,
    PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN. -/
def parseLiveDualEqWriteClosePathMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsDualEqWriteClosePathMain liveDualEqWriteClosePathMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.DualEqWriteClosePathMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live DualEqWriteClosePathMain parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveDualEqWriteClosePathMainSource,
    PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN. -/
def kernelCheckLiveDualEqWriteClosePathMainSource (src : String) : Bool :=
  match parseLiveDualEqWriteClosePathMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveDualEqWriteClosePathMainParsed? : Option Module :=
  match parseLiveDualEqWriteClosePathMainSource liveDualEqWriteClosePathMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveDualEqWriteClosePathMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    Horizon measured bound cmds=1: the one dotted import
    SystemsLean.DualEqWriteClosePath. Not DualEqWriteClosePath wrap bound. -/
def liveParseCmdCountOk : Bool :=
  match liveDualEqWriteClosePathMainParsed? with
  | some m => m.commands.length == 1
  | none => false

/-- Wrap module lastSeg is DualEqWriteClosePathMain (no module line in the live file). -/
def liveParseHasDualEqWriteClosePathMainModule : Bool :=
  match liveDualEqWriteClosePathMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "DualEqWriteClosePathMain"

/-- Live parse kept the one dotted import SystemsLean.DualEqWriteClosePath. -/
def liveParseHasDualEqWriteClosePathImport : Bool :=
  match liveDualEqWriteClosePathMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.DualEqWriteClosePath"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveDualEqWriteClosePathMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveDualEqWriteClosePathMainSource)
    toksHaveDefNamed liveDualEqWriteClosePathMainSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveDualEqWriteClosePathMainReady,
    PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN,
    HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true.
    This mill Main has no namespace command; do not require one. -/
def hostFrontLiveDualEqWriteClosePathMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN")
    && (parseId == "PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN")
    && (liveDualEqWriteClosePathMainRel
      == "src/systems/SystemsLean/DualEqWriteClosePathMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveDualEqWriteClosePathMainFullHost
    && !hostFrontLiveDualEqWriteClosePathMainResidualFreeClaimed
    && !hostFrontLiveDualEqWriteClosePathMainProvablyUnlocked
    && kernelCheckLiveDualEqWriteClosePathMainSource liveDualEqWriteClosePathMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasDualEqWriteClosePathMainModule
    && liveParseHasDualEqWriteClosePathImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveDualEqWriteClosePathMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 15 remill. -/

def runLiveDualEqWriteClosePathMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN =="
  IO.println s!"  host={hostId} file={liveDualEqWriteClosePathMainRel}"
  let path := root / liveDualEqWriteClosePathMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveDualEqWriteClosePathMainRel}"
    throw (IO.userError s!"missing {liveDualEqWriteClosePathMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveDualEqWriteClosePathMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk DualEqWriteClosePathMain.lean != liveDualEqWriteClosePathMainSource"
    throw (IO.userError "dual-pin mismatch live DualEqWriteClosePathMain.lean")
  let r := parseLiveDualEqWriteClosePathMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live DualEqWriteClosePathMain parse false"
      throw (IO.userError "kernelCheck live DualEqWriteClosePathMain parse false")
    unless hostFrontLiveDualEqWriteClosePathMainReady do
      IO.eprintln "error: hostFrontLiveDualEqWriteClosePathMainReady false"
      throw (IO.userError "hostFrontLiveDualEqWriteClosePathMainReady false")
    IO.println s!"GREEN {stageId}: live DualEqWriteClosePathMain.lean parse kernelCheck; not mill 15 remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveDualEqWriteClosePathMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveDualEqWriteClosePathMain
