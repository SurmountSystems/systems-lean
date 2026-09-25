/-
  SYSTEMS_LEAN_HOST partial -- parse live HostModuleCheckMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckMain. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses HostModuleCheckMain.lean only. Do not wrap HostModuleCheck.lean.
  Do not wrap HostModuleCheckTheorems.lean.
  liveRel lives in HostFrontLiveHostModuleCheckMainSource. Do not redefine it.
  The bare name is HostModuleCheckMain.lean.
  This live mill Main has no namespace, no end, and no String/Nat/Bool atom
  defs. The one dotted import is kept. The IO main skip-folds.
  Skip-head still sees def main via toksHaveDefNamed on stripped tokens.
  kernelCheck calls HostKernel.kernelCheck. A constant true is wrong.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckMainSource,
  kernelCheckLiveHostModuleCheckMainSource,
  hostFrontLiveHostModuleCheckMainReady, liveHostModuleCheckMainSource,
  liveRel, liveHostModuleCheckMainRel, UNIT_SURFACE host surface,
  PARSE-LIVE-HOST-MODULE-CHECK-MAIN,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-MAIN,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_MAIN_V0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckMain
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-MODULE-CHECK-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-MODULE-CHECK-MAIN"

/-- Same bare name as liveRel. The Source def. Do not redefine liveRel.
    The value must not contain a slash. -/
def liveHostModuleCheckMainRel : String := liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostModuleCheckMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostModuleCheckMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostModuleCheckMain has no string literals; this strip stays in-string safe.
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

/-- String-safe comment strip for live HostModuleCheckMain.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostModuleCheck`. -/
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
def cmdAddsHostModuleCheckMain (c : Cmd) : List String :=
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
def cmdBodyKnownHostModuleCheckMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckMainParseFuel body
        && termNoAppN liveHostModuleCheckMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckMainParseFuel body
        && termNoAppN liveHostModuleCheckMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostModuleCheckMain (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostModuleCheckMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostModuleCheckMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostModuleCheckMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsHostModuleCheckMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostModuleCheckMain liveHostModuleCheckMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostModuleCheckMainSkipFuel rest
      if cmdBodyKnownHostModuleCheckMain kn c then
        parseCmdsHostModuleCheckMain n rest2
          (kn ++ cmdAddsHostModuleCheckMain c) (acc ++ [c])
      else
        parseCmdsHostModuleCheckMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostModuleCheckMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostModuleCheckMain n rest2 kn acc
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

/-- Parse live HostModuleCheckMain.lean text.
    Greppable: parseLiveHostModuleCheckMainSource,
    PARSE-LIVE-HOST-MODULE-CHECK-MAIN. -/
def parseLiveHostModuleCheckMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostModuleCheckMain liveHostModuleCheckMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckMain parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveHostModuleCheckMainSource,
    PARSE-LIVE-HOST-MODULE-CHECK-MAIN. -/
def kernelCheckLiveHostModuleCheckMainSource (src : String) : Bool :=
  match parseLiveHostModuleCheckMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostModuleCheckMainParsed? : Option Module :=
  match parseLiveHostModuleCheckMainSource liveHostModuleCheckMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostModuleCheckMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    The one dotted import is SystemsLean.HostModuleCheck.
    Not a HostModuleCheck.lean library wrap. -/
def liveParseCmdCountOk : Bool :=
  match liveHostModuleCheckMainParsed? with
  | some m => m.commands.length == 1
  | none => false

/-- Wrap module lastSeg is HostModuleCheckMain (no module line in the live file). -/
def liveParseHasHostModuleCheckMainModule : Bool :=
  match liveHostModuleCheckMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostModuleCheckMain"

/-- Live parse kept the one dotted import SystemsLean.HostModuleCheck. -/
def liveParseHasHostModuleCheckImport : Bool :=
  match liveHostModuleCheckMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostModuleCheckMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveHostModuleCheckMainSource)
    toksHaveDefNamed liveHostModuleCheckMainSkipFuel toks "main"

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheck\n"

/-- Forward line needle. Trailing newline. -/
def needleForward : String := "  SystemsLean.HostModuleCheck.main args\n"

/-- def main header needle. Trailing newline. -/
def needleDefMain : String := "def main (args : List String) : IO UInt32 :=\n"

/-- Module cite needle. Trailing newline. -/
def needleModuleCite : String := "  Module: SystemsLean.HostModuleCheckMain\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckMainSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleForward).length > 1
    && (src.splitOn needleDefMain).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckMainReady,
    PARSE-LIVE-HOST-MODULE-CHECK-MAIN,
    HOST-FRONT-LIVE-HOST-MODULE-CHECK-MAIN.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty pins.
    Not a hardcoded true.
    This mill Main has no namespace command; do not require one. -/
def hostFrontLiveHostModuleCheckMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-MODULE-CHECK-MAIN")
    && (parseId == "PARSE-LIVE-HOST-MODULE-CHECK-MAIN")
    && (liveRel == "HostModuleCheckMain.lean")
    && (liveHostModuleCheckMainRel == "HostModuleCheckMain.lean")
    && (liveHostModuleCheckMainRel.splitOn "/").length == 1
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckMainFullHost
    && !hostFrontLiveHostModuleCheckMainResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckMainProvablyUnlocked
    && kernelCheckLiveHostModuleCheckMainSource liveHostModuleCheckMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckMainModule
    && liveParseHasHostModuleCheckImport
    && liveParseHasCoreDefs
    && liveNeedlesOk
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveHostModuleCheckMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-MODULE-CHECK-MAIN =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMainRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckMainRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckMain.lean != liveHostModuleCheckMainSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckMain.lean")
  let r := parseLiveHostModuleCheckMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-MODULE-CHECK-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-MODULE-CHECK-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-MODULE-CHECK-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckMain parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckMain parse false")
    unless hostFrontLiveHostModuleCheckMainReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckMainReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckMainReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckMain source was accepted"
      throw (IO.userError "empty HostModuleCheckMain source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheckMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckMain
