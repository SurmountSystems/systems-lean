/-
  SYSTEMS_LEAN_HOST partial -- parse live LlvmTypesTextMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmTypesTextMainParse. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses LlvmTypesTextMain.lean only. Do not wrap LlvmTypesText.lean.
  Do not retarget HostFrontLiveLlvmHold.lean.
  liveRel lives in HostFrontLiveLlvmTypesTextMainSource. Do not redefine it.
  The bare name is LlvmTypesTextMain.lean.
  This live mill Main has no namespace, no end, and no String/Nat/Bool atom
  defs. The one dotted import is kept. The IO main skip-folds.
  Skip-head still sees def main via toksHaveDefNamed on stripped tokens.
  kernelCheck calls HostKernel.kernelCheck. A constant true is wrong.
  Not FullHost. Not a full LLVM backend. FullBackend stays false.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLlvmTypesTextMainSource,
  kernelCheckLiveLlvmTypesTextMainSource,
  hostFrontLiveLlvmTypesTextMainReady, liveLlvmTypesTextMainSource,
  liveRel, liveLlvmTypesTextMainRel, UNIT_SURFACE host surface,
  PARSE-LIVE-LLVM-TYPES-TEXT-MAIN,
  HOST-FRONT-LIVE-LLVM-TYPES-TEXT-MAIN,
  SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_TEXT_MAIN_V0.
  Module: SystemsLean.HostFrontLiveLlvmTypesTextMainParse
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmTypesTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmTypesTextMainParse

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostFrontLiveLlvmTypesTextMain

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-TYPES-TEXT-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-TYPES-TEXT-MAIN"

/-- Same bare name as liveRel. The Source def. Do not redefine liveRel.
    The value must not contain a slash. -/
def liveLlvmTypesTextMainRel : String := liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmTypesTextMainFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLlvmTypesTextMainFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmTypesTextMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmTypesTextMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmTypesTextMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLlvmTypesTextMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    LlvmTypesTextMain has no string literals; this strip stays in-string safe.
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

/-- String-safe comment strip for live LlvmTypesTextMain.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . LlvmTypesText`. -/
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
def cmdAddsLlvmTypesTextMain (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmTypesTextMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmTypesTextMainParseFuel body
        && termNoAppN liveLlvmTypesTextMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmTypesTextMainParseFuel body
        && termNoAppN liveLlvmTypesTextMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefLlvmTypesTextMain (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveLlvmTypesTextMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdLlvmTypesTextMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLlvmTypesTextMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsLlvmTypesTextMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmTypesTextMain liveLlvmTypesTextMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmTypesTextMainSkipFuel rest
      if cmdBodyKnownLlvmTypesTextMain kn c then
        parseCmdsLlvmTypesTextMain n rest2
          (kn ++ cmdAddsLlvmTypesTextMain c) (acc ++ [c])
      else
        parseCmdsLlvmTypesTextMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveLlvmTypesTextMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLlvmTypesTextMain n rest2 kn acc
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

/-- Parse live LlvmTypesTextMain.lean text.
    Greppable: parseLiveLlvmTypesTextMainSource,
    PARSE-LIVE-LLVM-TYPES-TEXT-MAIN. -/
def parseLiveLlvmTypesTextMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmTypesTextMain liveLlvmTypesTextMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmTypesTextMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmTypesTextMain parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveLlvmTypesTextMainSource,
    PARSE-LIVE-LLVM-TYPES-TEXT-MAIN. -/
def kernelCheckLiveLlvmTypesTextMainSource (src : String) : Bool :=
  match parseLiveLlvmTypesTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmTypesTextMainParsed? : Option Module :=
  match parseLiveLlvmTypesTextMainSource liveLlvmTypesTextMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmTypesTextMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    The one dotted import is SystemsLean.LlvmTypesText.
    Not a LlvmTypesText.lean library wrap. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmTypesTextMainParsed? with
  | some m => m.commands.length == 1
  | none => false

/-- Wrap module lastSeg is LlvmTypesTextMain (no module line in the live file). -/
def liveParseHasLlvmTypesTextMainModule : Bool :=
  match liveLlvmTypesTextMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "LlvmTypesTextMain"

/-- Live parse kept the one dotted import SystemsLean.LlvmTypesText. -/
def liveParseHasLlvmTypesTextImport : Bool :=
  match liveLlvmTypesTextMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmTypesText"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveLlvmTypesTextMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveLlvmTypesTextMainSource)
    toksHaveDefNamed liveLlvmTypesTextMainSkipFuel toks "main"

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.LlvmTypesText\n"

/-- Forward line needle. Trailing newline. -/
def needleForward : String := "  SystemsLean.LlvmTypesText.main args\n"

/-- def main header needle. Trailing newline. -/
def needleDefMain : String := "def main (args : List String) : IO UInt32 :=\n"

/-- Module cite needle. Trailing newline. -/
def needleModuleCite : String := "  Module: SystemsLean.LlvmTypesTextMain\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmTypesTextMainSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleForward).length > 1
    && (src.splitOn needleDefMain).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmTypesTextMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmTypesTextMainReady,
    PARSE-LIVE-LLVM-TYPES-TEXT-MAIN,
    HOST-FRONT-LIVE-LLVM-TYPES-TEXT-MAIN.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty pins.
    Not a hardcoded true.
    This mill Main has no namespace command; do not require one.
    Not a full LLVM backend. -/
def hostFrontLiveLlvmTypesTextMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_TEXT_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-TYPES-TEXT-MAIN")
    && (parseId == "PARSE-LIVE-LLVM-TYPES-TEXT-MAIN")
    && (liveRel == "LlvmTypesTextMain.lean")
    && (liveLlvmTypesTextMainRel == "LlvmTypesTextMain.lean")
    && (liveRel.splitOn "/").length == 1
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmTypesTextMainFullHost
    && !hostFrontLiveLlvmTypesTextMainFullBackend
    && !hostFrontLiveLlvmTypesTextMainResidualFreeClaimed
    && !hostFrontLiveLlvmTypesTextMainProvablyUnlocked
    && kernelCheckLiveLlvmTypesTextMainSource liveLlvmTypesTextMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLlvmTypesTextMainModule
    && liveParseHasLlvmTypesTextImport
    && liveParseHasCoreDefs
    && liveNeedlesOk
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmTypesTextMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-TYPES-TEXT-MAIN =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmTypesTextMainRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmTypesTextMainRel}"
    throw (IO.userError s!"missing {liveLlvmTypesTextMainRel}")
  let disk <- IO.FS.readFile path
  -- Source raw string keeps one leading newline ahead of the product bytes.
  if liveLlvmTypesTextMainSource != "\n" ++ disk then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmTypesTextMain.lean != liveLlvmTypesTextMainSource"
    throw (IO.userError "dual-pin mismatch live LlvmTypesTextMain.lean")
  let r := parseLiveLlvmTypesTextMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-TYPES-TEXT-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-TYPES-TEXT-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-TYPES-TEXT-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmTypesTextMain parse false"
      throw (IO.userError "kernelCheck live LlvmTypesTextMain parse false")
    unless hostFrontLiveLlvmTypesTextMainReady do
      IO.eprintln "error: hostFrontLiveLlvmTypesTextMainReady false"
      throw (IO.userError "hostFrontLiveLlvmTypesTextMainReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmTypesTextMain source was accepted"
      throw (IO.userError "empty LlvmTypesTextMain source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmTypesTextMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmTypesTextMainParse
