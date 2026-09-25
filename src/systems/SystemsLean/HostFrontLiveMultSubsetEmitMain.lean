/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/MultSubsetEmitMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultSubsetEmitMain. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses MultSubsetEmitMain.lean only. Do not wrap MultSubsetEmit.lean.
  Do not invent HostFrontLiveMultSubsetEmit (library wrap).
  Unique needles use trailing newline so HostFrontLiveMultSubsetEmitMain is not a
  prefix hit on HostFrontLiveMultSubsetEmitMainSource or
  HostFrontLiveMultSubsetEmitMainMain.
  Occupancy leftover HostModuleCheckMultSubsetEmitTerm is not this wrap.
  Do not edit Term files.
  Not Linear.lean. Not ComposeSubsetEmit. Not IrGraph.
  Not HostModuleCheckMain. Not MultMain. Not HostFrontLiveMultMain.
  Not GraphSubsetEmitMain. Not ComposeSubsetEmitMain.
  Not mill remill. Not mill 69 remill.
  DualEqWrite.lean does not exist. Do not invent it.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.

  Spec (readable):
  - parseLiveMultSubsetEmitMainSource turns live MultSubsetEmitMain.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.MultSubsetEmitMain even without a module line.
  - kernelCheckLiveMultSubsetEmitMainSource is HostKernel.kernelCheck of
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
    MultSubsetEmitMain namespace pin as true.
  - Wrap-assigned module lastSeg is MultSubsetEmitMain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - Not Linear / ComposeSubsetEmit / IrGraph parsers.
  - Not MultSubsetEmit.lean wrap. DualEqWrite.lean does not exist.

  Unique needles (trailing newline so HostFrontLiveMultSubsetEmitMain is not a prefix):
  HostFrontLiveMultSubsetEmitMain
  PARSE-LIVE-MULT-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-MULT-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_EMIT_MAIN_V0
  MULT-SUBSET-EMIT-MAIN
  HOST-MULT-SUBSET-EMIT-MAIN

  Live product needles:
  MultSubsetEmitMain
  slake-mult-subset-emit
  import SystemsLean.MultSubsetEmit
  MULT-SUBSET-EMIT
  SLAKE_MULT_SUBSET_EMIT
  multSubsetEmitReady

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveMultSubsetEmitMainSource,
  kernelCheckLiveMultSubsetEmitMainSource,
  hostFrontLiveMultSubsetEmitMainReady, liveMultSubsetEmitMainSource,
  liveMultSubsetEmitMainRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveMultSubsetEmitMain
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveMultSubsetEmitMain on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultSubsetEmitMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultSubsetEmitMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-SUBSET-EMIT-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-SUBSET-EMIT-MAIN"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultSubsetEmitMainRel : String :=
  "src/systems/SystemsLean/MultSubsetEmitMain.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "MultSubsetEmitMain.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultSubsetEmitMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultSubsetEmitMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveMultSubsetEmitMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveMultSubsetEmitMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveMultSubsetEmitMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    MultSubsetEmitMain has no string literals; this strip stays in-string safe.
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

/-- String-safe comment strip for live MultSubsetEmitMain.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . MultSubsetEmit`. -/
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
def cmdAddsMultSubsetEmitMain (c : Cmd) : List String :=
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
def cmdBodyKnownMultSubsetEmitMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultSubsetEmitMainParseFuel body
        && termNoAppN liveMultSubsetEmitMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultSubsetEmitMainParseFuel body
        && termNoAppN liveMultSubsetEmitMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefMultSubsetEmitMain (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveMultSubsetEmitMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdMultSubsetEmitMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefMultSubsetEmitMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsMultSubsetEmitMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMultSubsetEmitMain liveMultSubsetEmitMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveMultSubsetEmitMainSkipFuel rest
      if cmdBodyKnownMultSubsetEmitMain kn c then
        parseCmdsMultSubsetEmitMain n rest2
          (kn ++ cmdAddsMultSubsetEmitMain c) (acc ++ [c])
      else
        parseCmdsMultSubsetEmitMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveMultSubsetEmitMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsMultSubsetEmitMain n rest2 kn acc
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

/-- Parse live MultSubsetEmitMain.lean text.
    Greppable: parseLiveMultSubsetEmitMainSource,
    PARSE-LIVE-MULT-SUBSET-EMIT-MAIN. -/
def parseLiveMultSubsetEmitMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultSubsetEmitMain liveMultSubsetEmitMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultSubsetEmitMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultSubsetEmitMain parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveMultSubsetEmitMainSource,
    PARSE-LIVE-MULT-SUBSET-EMIT-MAIN. -/
def kernelCheckLiveMultSubsetEmitMainSource (src : String) : Bool :=
  match parseLiveMultSubsetEmitMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultSubsetEmitMainParsed? : Option Module :=
  match parseLiveMultSubsetEmitMainSource liveMultSubsetEmitMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultSubsetEmitMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    Horizon measured bound cmds=1: the one dotted import
    SystemsLean.MultSubsetEmit. Not a MultSubsetEmit.lean library wrap. -/
def liveParseCmdCountOk : Bool :=
  match liveMultSubsetEmitMainParsed? with
  | some m => m.commands.length == 1
  | none => false

/-- Wrap module lastSeg is MultSubsetEmitMain (no module line in the live file). -/
def liveParseHasMultSubsetEmitMainModule : Bool :=
  match liveMultSubsetEmitMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "MultSubsetEmitMain"

/-- Live parse kept the one dotted import SystemsLean.MultSubsetEmit. -/
def liveParseHasMultSubsetEmitImport : Bool :=
  match liveMultSubsetEmitMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.MultSubsetEmit"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveMultSubsetEmitMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveMultSubsetEmitMainSource)
    toksHaveDefNamed liveMultSubsetEmitMainSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveMultSubsetEmitMainReady,
    PARSE-LIVE-MULT-SUBSET-EMIT-MAIN,
    HOST-FRONT-LIVE-MULT-SUBSET-EMIT-MAIN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true.
    This mill Main has no namespace command; do not require one. -/
def hostFrontLiveMultSubsetEmitMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_EMIT_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT-SUBSET-EMIT-MAIN")
    && (parseId == "PARSE-LIVE-MULT-SUBSET-EMIT-MAIN")
    && (liveMultSubsetEmitMainRel
      == "src/systems/SystemsLean/MultSubsetEmitMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultSubsetEmitMainFullHost
    && !hostFrontLiveMultSubsetEmitMainResidualFreeClaimed
    && !hostFrontLiveMultSubsetEmitMainProvablyUnlocked
    && kernelCheckLiveMultSubsetEmitMainSource liveMultSubsetEmitMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasMultSubsetEmitMainModule
    && liveParseHasMultSubsetEmitImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultSubsetEmitMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveMultSubsetEmitMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-SUBSET-EMIT-MAIN =="
  IO.println s!"  host={hostId} file={liveMultSubsetEmitMainRel}"
  let path := root / liveMultSubsetEmitMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultSubsetEmitMainRel}"
    throw (IO.userError s!"missing {liveMultSubsetEmitMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultSubsetEmitMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultSubsetEmitMain.lean != liveMultSubsetEmitMainSource"
    throw (IO.userError "dual-pin mismatch live MultSubsetEmitMain.lean")
  let r := parseLiveMultSubsetEmitMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-SUBSET-EMIT-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-SUBSET-EMIT-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-SUBSET-EMIT-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultSubsetEmitMain parse false"
      throw (IO.userError "kernelCheck live MultSubsetEmitMain parse false")
    unless hostFrontLiveMultSubsetEmitMainReady do
      IO.eprintln "error: hostFrontLiveMultSubsetEmitMainReady false"
      throw (IO.userError "hostFrontLiveMultSubsetEmitMainReady false")
    IO.println s!"GREEN {stageId}: live MultSubsetEmitMain.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultSubsetEmitMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultSubsetEmitMain
