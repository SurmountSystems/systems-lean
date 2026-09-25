/-
  SYSTEMS_LEAN_HOST partial -- parse live LlvmLinearTextMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmLinearTextMainSource. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses LlvmLinearTextMain.lean only.
  It is not LlvmLinearText.lean. Do not retarget the neighbor.
  liveRel is defined once in this file. The bare name is LlvmLinearTextMain.lean.
  This live mill Main has no namespace, no end, and no String/Nat/Bool atom
  defs. The one dotted import is kept. The IO main skip-folds.
  Skip-head still sees def main via toksHaveDefNamed on stripped tokens.
  kernelCheck calls HostKernel.kernelCheck. A constant true is wrong.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLlvmLinearTextMainSource,
  kernelCheckLiveLlvmLinearTextMainSource,
  hostFrontLiveLlvmLinearTextMainReady, liveLlvmLinearTextMainSource,
  liveRel, liveLlvmLinearTextMainRel, UNIT_SURFACE host surface,
  PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN,
  HOST-FRONT-LIVE-LLVM-LINEAR-TEXT-MAIN,
  SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_TEXT_MAIN_V0.
  Module: SystemsLean.HostFrontLiveLlvmLinearTextMainSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmLinearTextMainSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-LINEAR-TEXT-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN"

/-- Live file bare name. Not a path. Greppable: liveRel. -/
def liveRel : String := "LlvmLinearTextMain.lean"

/-- Dual-pinned live LlvmLinearTextMain.lean bytes.
    The checker accepts this Main source. The forwarder only calls
    SystemsLean.LlvmLinearText.main. Do not reimplement the neighbor.
    Greppable: liveLlvmLinearTextMainSource. -/
def liveLlvmLinearTextMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Linear text
  (SKELETON). Root for lake exe slake-llvm-linear-text. Body lives in
  SystemsLean.LlvmLinearText (llvmLinearTextReady / Linear IR write under out/llvm-ir).
  Greppable: SystemsLean.LlvmLinearTextMain, slake-llvm-linear-text,
  LlvmLinearTextMain, HOST-LLVM-LINEAR-TEXT, SLAKE_LLVM_LINEAR_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmLinearTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmLinearText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmLinearText.main args
"#

/-- Same bare name as liveRel. Not a path. The value must not contain a slash. -/
def liveLlvmLinearTextMainRel : String := liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmLinearTextMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmLinearTextMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmLinearTextMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmLinearTextMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLlvmLinearTextMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    LlvmLinearTextMain has no string literals; this strip stays in-string safe.
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

/-- String-safe comment strip for live LlvmLinearTextMain.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . LlvmLinearText`. -/
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
def cmdAddsLlvmLinearTextMain (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmLinearTextMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmLinearTextMainParseFuel body
        && termNoAppN liveLlvmLinearTextMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmLinearTextMainParseFuel body
        && termNoAppN liveLlvmLinearTextMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefLlvmLinearTextMain (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveLlvmLinearTextMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdLlvmLinearTextMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLlvmLinearTextMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsLlvmLinearTextMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmLinearTextMain liveLlvmLinearTextMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmLinearTextMainSkipFuel rest
      if cmdBodyKnownLlvmLinearTextMain kn c then
        parseCmdsLlvmLinearTextMain n rest2
          (kn ++ cmdAddsLlvmLinearTextMain c) (acc ++ [c])
      else
        parseCmdsLlvmLinearTextMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveLlvmLinearTextMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLlvmLinearTextMain n rest2 kn acc
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

/-- Parse live LlvmLinearTextMain.lean text.
    Greppable: parseLiveLlvmLinearTextMainSource,
    PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN. -/
def parseLiveLlvmLinearTextMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmLinearTextMain liveLlvmLinearTextMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmLinearTextMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmLinearTextMain parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveLlvmLinearTextMainSource,
    PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN. -/
def kernelCheckLiveLlvmLinearTextMainSource (src : String) : Bool :=
  match parseLiveLlvmLinearTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmLinearTextMainParsed? : Option Module :=
  match parseLiveLlvmLinearTextMainSource liveLlvmLinearTextMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmLinearTextMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    The one dotted import is SystemsLean.LlvmLinearText.
    Not a LlvmLinearText.lean library wrap. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmLinearTextMainParsed? with
  | some m => m.commands.length == 1
  | none => false

/-- Wrap module lastSeg is LlvmLinearTextMain (no module line in the live file). -/
def liveParseHasLlvmLinearTextMainModule : Bool :=
  match liveLlvmLinearTextMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "LlvmLinearTextMain"

/-- Live parse kept the one dotted import SystemsLean.LlvmLinearText. -/
def liveParseHasLlvmLinearTextImport : Bool :=
  match liveLlvmLinearTextMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmLinearText"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveLlvmLinearTextMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveLlvmLinearTextMainSource)
    toksHaveDefNamed liveLlvmLinearTextMainSkipFuel toks "main"

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.LlvmLinearText\n"

/-- Forward line needle. Trailing newline. -/
def needleForward : String := "  SystemsLean.LlvmLinearText.main args\n"

/-- def main header needle. Trailing newline. -/
def needleDefMain : String := "def main (args : List String) : IO UInt32 :=\n"

/-- Module cite needle. Trailing newline. -/
def needleModuleCite : String := "  Module: SystemsLean.LlvmLinearTextMain\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmLinearTextMainSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleForward).length > 1
    && (src.splitOn needleDefMain).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmLinearTextMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmLinearTextMainReady,
    PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN,
    HOST-FRONT-LIVE-LLVM-LINEAR-TEXT-MAIN.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty pins.
    Not a hardcoded true.
    This mill Main has no namespace command; do not require one. -/
def hostFrontLiveLlvmLinearTextMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_TEXT_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-LINEAR-TEXT-MAIN")
    && (parseId == "PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN")
    && (liveRel == "LlvmLinearTextMain.lean")
    && (liveLlvmLinearTextMainRel == "LlvmLinearTextMain.lean")
    && (liveLlvmLinearTextMainRel.splitOn "/").length == 1
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmLinearTextMainFullHost
    && !hostFrontLiveLlvmLinearTextMainResidualFreeClaimed
    && !hostFrontLiveLlvmLinearTextMainProvablyUnlocked
    && kernelCheckLiveLlvmLinearTextMainSource liveLlvmLinearTextMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLlvmLinearTextMainModule
    && liveParseHasLlvmLinearTextImport
    && liveParseHasCoreDefs
    && liveNeedlesOk
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmLinearTextMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmLinearTextMainRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmLinearTextMainRel}"
    throw (IO.userError s!"missing {liveLlvmLinearTextMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmLinearTextMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmLinearTextMain.lean != liveLlvmLinearTextMainSource"
    throw (IO.userError "dual-pin mismatch live LlvmLinearTextMain.lean")
  let r := parseLiveLlvmLinearTextMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmLinearTextMain parse false"
      throw (IO.userError "kernelCheck live LlvmLinearTextMain parse false")
    unless hostFrontLiveLlvmLinearTextMainReady do
      IO.eprintln "error: hostFrontLiveLlvmLinearTextMainReady false"
      throw (IO.userError "hostFrontLiveLlvmLinearTextMainReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmLinearTextMain source was accepted"
      throw (IO.userError "empty LlvmLinearTextMain source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmLinearTextMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmLinearTextMainSource
