/-
  SYSTEMS_LEAN_HOST partial -- parse live HostModuleCheck.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheck. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses HostModuleCheck.lean only.
  liveRel lives in HostFrontLiveHostModuleCheckSource. Do not redefine it.
  The bare name is HostModuleCheck.lean.
  Imports, namespace, and end stay. The live file is an import hub.
  Do not import HostModuleCheck. Do not import HostModuleCheckMain.
  Do not elaborate the package walk.
  kernelCheck calls HostKernel.kernelCheck. A constant true is wrong.
  Kept commands stay under HostKernel.kernelFuel (64).
  Not FullHost. Not a full LLVM backend. FullBackend stays false.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckSource,
  kernelCheckLiveHostModuleCheckSource,
  hostFrontLiveHostModuleCheckReady, liveHostModuleCheckSource,
  liveRel, liveHostModuleCheckRel, UNIT_SURFACE host surface,
  PARSE-LIVE-HOST-MODULE-CHECK,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_V0.
  Module: SystemsLean.HostFrontLiveHostModuleCheck
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheck

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-MODULE-CHECK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-MODULE-CHECK"

/-- Same bare name as liveRel. The Source def. Do not redefine liveRel.
    The value must not contain a slash. -/
def liveHostModuleCheckRel : String := liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostModuleCheckParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostModuleCheckSkipFuel : Nat := 8192

/-- Keep at most this many ordinary commands so HostKernel.kernelCheck
    (kernelFuel 64) can finish. Namespace and end always stay. -/
def liveHostModuleCheckKeepCap : Nat := 60

/-- Strip comments; keep dash-dash and block-open inside string payloads.
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

/-- String-safe comment strip for live HostModuleCheck.lean bytes. -/
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
def cmdAddsHostModuleCheck (c : Cmd) : List String :=
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
def cmdBodyKnownHostModuleCheck (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckParseFuel body
        && termNoAppN liveHostModuleCheckParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckParseFuel body
        && termNoAppN liveHostModuleCheckParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostModuleCheck (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostModuleCheckSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostModuleCheck (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostModuleCheck fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsHostModuleCheck : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostModuleCheck liveHostModuleCheckParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostModuleCheckSkipFuel rest
      let keepAlways : Bool :=
        match c with
        | Cmd.namespace _ => true
        | Cmd.endNamespace _ => true
        | _ => false
      if cmdBodyKnownHostModuleCheck kn c then
        if !keepAlways && acc.length >= liveHostModuleCheckKeepCap then
          parseCmdsHostModuleCheck n rest2 kn acc
        else
          parseCmdsHostModuleCheck n rest2
            (kn ++ cmdAddsHostModuleCheck c) (acc ++ [c])
      else
        parseCmdsHostModuleCheck n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostModuleCheckSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostModuleCheck n rest2 kn acc
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

/-- Tail count of an exact token. -/
def countExactN : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | _, [], _, acc => acc
  | Nat.succ n, t :: rest, w, acc =>
    countExactN n rest w (if t == w then acc + 1 else acc)

/-- Parse live HostModuleCheck.lean text.
    Greppable: parseLiveHostModuleCheckSource,
    PARSE-LIVE-HOST-MODULE-CHECK. -/
def parseLiveHostModuleCheckSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostModuleCheck liveHostModuleCheckParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheck"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheck parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveHostModuleCheckSource,
    PARSE-LIVE-HOST-MODULE-CHECK. -/
def kernelCheckLiveHostModuleCheckSource (src : String) : Bool :=
  match parseLiveHostModuleCheckSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostModuleCheckParsed? : Option Module :=
  match parseLiveHostModuleCheckSource liveHostModuleCheckSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostModuleCheckParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- True when the command is an import. -/
def cmdIsImport : Cmd -> Bool
  | Cmd.importModule _ => true
  | _ => false

/-- Import hub: kept imports, then namespace and end. No def is kept.
    Kept commands stay at or under HostKernel.kernelFuel (64). -/
def liveParseShapeOk : Bool :=
  match liveHostModuleCheckParsed? with
  | some m =>
    match m.commands.reverse with
    | Cmd.endNamespace c :: Cmd.namespace b :: rest =>
      b.raw == "SystemsLean.HostModuleCheck"
        && c.raw == "SystemsLean.HostModuleCheck"
        && !rest.isEmpty
        && rest.all cmdIsImport
        && m.commands.length <= 64
    | _ => false
  | none => false

/-- Wrap module lastSeg is HostModuleCheck (no module line in the live file). -/
def liveParseHasHostModuleCheckModule : Bool :=
  match liveHostModuleCheckParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostModuleCheck"

/-- Import hub: namespace and end, and no def token after the comment strip. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostModuleCheckParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveHostModuleCheckSource)
    countExactN (toks.length + 1) toks "def" 0 == 0
      && countExactN (toks.length + 1) toks "namespace" 0 == 1
      && countExactN (toks.length + 1) toks "end" 0 == 1

/-- Exact `import` tokens after the comment strip. One hundred fifteen. -/
def liveImportTokCountOk : Bool :=
  let toks := tokenizeHostTerm (stripCommentsOr liveHostModuleCheckSource)
  countExactN (toks.length + 1) toks "import" 0 == 115

/-- First import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckFixtures\n"

/-- Namespace needle. Trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Last import needle. Trailing newline. -/
def needleLastImport : String := "import SystemsLean.HostModuleCheckDriver\n"

/-- End needle. Trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Hub comment needle. Trailing newline. -/
def needleHub : String :=
  "-- Import hub only (defs live in companions listed above).\n"

/-- Module cite needle. Trailing newline. -/
def needleModuleCite : String := "  Module: SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleLastImport).length > 1
    && (src.splitOn needleEnd).length > 1
    && (src.splitOn needleHub).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckReady,
    PARSE-LIVE-HOST-MODULE-CHECK,
    HOST-FRONT-LIVE-HOST-MODULE-CHECK.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty pins.
    Not a hardcoded true.
    Not a full LLVM backend. Does not own package typechecking. -/
def hostFrontLiveHostModuleCheckReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-MODULE-CHECK")
    && (parseId == "PARSE-LIVE-HOST-MODULE-CHECK")
    && (liveRel == "HostModuleCheck.lean")
    && (liveHostModuleCheckRel == "HostModuleCheck.lean")
    && (liveRel.splitOn "/").length == 1
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckFullHost
    && !hostFrontLiveHostModuleCheckFullBackend
    && !hostFrontLiveHostModuleCheckResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckProvablyUnlocked
    && kernelCheckLiveHostModuleCheckSource liveHostModuleCheckSource
    && liveParseHasNoCheckCmd
    && liveParseShapeOk
    && liveParseHasHostModuleCheckModule
    && liveParseHasCoreDefs
    && liveImportTokCountOk
    && liveNeedlesOk
    && liveParseRejectsEmpty

/-- One-line command list for a failed run. -/
def cmdTag (c : Cmd) : String :=
  match c with
  | Cmd.importModule x => "import " ++ x.raw
  | Cmd.namespace x => "namespace " ++ x.raw
  | Cmd.endNamespace x => "end " ++ x.raw
  | Cmd.def_ x _ _ => "def " ++ x.raw
  | Cmd.defBind x _ _ _ => "def " ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive " ++ x.raw
  | Cmd.structure_ x _ _ => "structure " ++ x.raw
  | Cmd.check _ _ => "check"

/-- Tail join of command tags. -/
def cmdsBriefN : Nat -> List Cmd -> String -> String
  | 0, _, acc => acc
  | _, [], acc => acc
  | Nat.succ n, c :: rest, acc =>
    let piece := cmdTag c
    let acc2 := if acc.isEmpty then piece else acc ++ " | " ++ piece
    cmdsBriefN n rest acc2

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveHostModuleCheck (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-MODULE-CHECK =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckRel}")
  let disk <- IO.FS.readFile path
  -- Source raw string keeps one leading newline ahead of the product bytes.
  if liveHostModuleCheckSource != "\n" ++ disk then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheck.lean != liveHostModuleCheckSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheck.lean")
  let r := parseLiveHostModuleCheckSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-MODULE-CHECK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-MODULE-CHECK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-MODULE-CHECK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln s!"error: kernelCheck false cmds={cmdsBriefN 80 m.commands ""}"
      throw (IO.userError "kernelCheck live HostModuleCheck parse false")
    unless hostFrontLiveHostModuleCheckReady do
      IO.eprintln s!"error: hostFrontLiveHostModuleCheckReady false shape={liveParseShapeOk} core={liveParseHasCoreDefs} imports={liveImportTokCountOk} needles={liveNeedlesOk} empty={liveParseRejectsEmpty} cmds={cmdsBriefN 80 m.commands ""}"
      throw (IO.userError "hostFrontLiveHostModuleCheckReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheck source was accepted"
      throw (IO.userError "empty HostModuleCheck source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheck
