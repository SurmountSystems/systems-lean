/-
  SYSTEMS_LEAN_HOST partial -- parse live PackageTypecheck.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePackageTypecheck. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses PackageTypecheck.lean only.
  liveRel lives in HostFrontLivePackageTypecheckSource. Do not redefine it.
  The bare name is PackageTypecheck.lean.
  Imports, namespace, and end stay. IO and compound defs skip-fold.
  Do not call runPackageTypecheckIOSafe. Do not elaborate the package walk.
  kernelCheck calls HostKernel.kernelCheck. A constant true is wrong.
  Kept commands stay under HostKernel.kernelFuel (64).
  Not FullHost. Not a full LLVM backend. FullBackend stays false.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  Greppable: SYSTEMS_LEAN_HOST,
  parseLivePackageTypecheckSource,
  kernelCheckLivePackageTypecheckSource,
  hostFrontLivePackageTypecheckReady, livePackageTypecheckSource,
  liveRel, livePackageTypecheckRel, UNIT_SURFACE host surface,
  PARSE-LIVE-PACKAGE-TYPECHECK,
  HOST-FRONT-LIVE-PACKAGE-TYPECHECK,
  SLAKE_HOST_FRONT_LIVE_PACKAGE_TYPECHECK_V0.
  Module: SystemsLean.HostFrontLivePackageTypecheck
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLivePackageTypecheckSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLivePackageTypecheck

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PACKAGE_TYPECHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PACKAGE-TYPECHECK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PACKAGE-TYPECHECK"

/-- Same bare name as liveRel. The Source def. Do not redefine liveRel.
    The value must not contain a slash. -/
def livePackageTypecheckRel : String := liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLivePackageTypecheckFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLivePackageTypecheckFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLivePackageTypecheckResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLivePackageTypecheckProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def livePackageTypecheckParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def livePackageTypecheckSkipFuel : Nat := 8192

/-- Keep at most this many ordinary commands so HostKernel.kernelCheck
    (kernelFuel 64) can finish. Namespace and end always stay. -/
def livePackageTypecheckKeepCap : Nat := 60

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

/-- String-safe comment strip for live PackageTypecheck.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . PackageTypecheck`. -/
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
def cmdAddsPackageTypecheck (c : Cmd) : List String :=
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
def cmdBodyKnownPackageTypecheck (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePackageTypecheckParseFuel body
        && termNoAppN livePackageTypecheckParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePackageTypecheckParseFuel body
        && termNoAppN livePackageTypecheckParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefPackageTypecheck (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd livePackageTypecheckSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdPackageTypecheck (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefPackageTypecheck fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsPackageTypecheck : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPackageTypecheck livePackageTypecheckParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd livePackageTypecheckSkipFuel rest
      let keepAlways : Bool :=
        match c with
        | Cmd.namespace _ => true
        | Cmd.endNamespace _ => true
        | _ => false
      if cmdBodyKnownPackageTypecheck kn c then
        if !keepAlways && acc.length >= livePackageTypecheckKeepCap then
          parseCmdsPackageTypecheck n rest2 kn acc
        else
          parseCmdsPackageTypecheck n rest2
            (kn ++ cmdAddsPackageTypecheck c) (acc ++ [c])
      else
        parseCmdsPackageTypecheck n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd livePackageTypecheckSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsPackageTypecheck n rest2 kn acc
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

/-- Parse live PackageTypecheck.lean text.
    Greppable: parseLivePackageTypecheckSource,
    PARSE-LIVE-PACKAGE-TYPECHECK. -/
def parseLivePackageTypecheckSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPackageTypecheck livePackageTypecheckParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.PackageTypecheck"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live PackageTypecheck parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLivePackageTypecheckSource,
    PARSE-LIVE-PACKAGE-TYPECHECK. -/
def kernelCheckLivePackageTypecheckSource (src : String) : Bool :=
  match parseLivePackageTypecheckSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def livePackageTypecheckParsed? : Option Module :=
  match parseLivePackageTypecheckSource livePackageTypecheckSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match livePackageTypecheckParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import Lean, namespace, end. IO main and compound defs are not kept. -/
def liveParseShapeOk : Bool :=
  match livePackageTypecheckParsed? with
  | some m =>
    match m.commands with
    | [Cmd.importModule a, Cmd.namespace b, Cmd.endNamespace c] =>
      a.raw == "Lean"
        && b.raw == "SystemsLean.PackageTypecheck"
        && c.raw == "SystemsLean.PackageTypecheck"
    | _ => false
  | none => false

/-- Wrap module lastSeg is PackageTypecheck (no module line in the live file). -/
def liveParseHasPackageTypecheckModule : Bool :=
  match livePackageTypecheckParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "PackageTypecheck"

/-- Skip-head: live file still has these defs even though bodies skip-fold. -/
def liveParseHasCoreDefs : Bool :=
  match livePackageTypecheckParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr livePackageTypecheckSource)
    toksHaveDefNamed livePackageTypecheckSkipFuel toks "isOccupancyLiving"
      && toksHaveDefNamed livePackageTypecheckSkipFuel toks "main"

/-- Exact `import` tokens after the comment strip. One real import. -/
def liveImportTokCountOk : Bool :=
  let toks := tokenizeHostTerm (stripCommentsOr livePackageTypecheckSource)
  countExactN (toks.length + 1) toks "import" 0 == 1

/-- Import needle. Trailing newline. -/
def needleImport : String := "import Lean\n"

/-- Namespace needle. Trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.PackageTypecheck\n"

/-- Occupancy-omit def needle. Trailing newline. -/
def needleOccupancy : String := "def isOccupancyLiving (n : String) : Bool :=\n"

/-- Opaque entry needle. Not a call. Trailing newline. -/
def needleOpaque : String :=
  "opaque runPackageTypecheckIOSafe (args : List String) : IO UInt32\n"

/-- def main header needle. Trailing newline. -/
def needleDefMain : String := "def main (args : List String) : IO UInt32 :=\n"

/-- Module cite needle. Trailing newline. -/
def needleModuleCite : String := "  Module: SystemsLean.PackageTypecheck\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := livePackageTypecheckSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleOccupancy).length > 1
    && (src.splitOn needleOpaque).length > 1
    && (src.splitOn needleDefMain).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLivePackageTypecheckSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLivePackageTypecheckReady,
    PARSE-LIVE-PACKAGE-TYPECHECK,
    HOST-FRONT-LIVE-PACKAGE-TYPECHECK.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty pins.
    Not a hardcoded true.
    Not a full LLVM backend. Does not own package typechecking. -/
def hostFrontLivePackageTypecheckReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PACKAGE_TYPECHECK_V0")
    && (hostId == "HOST-FRONT-LIVE-PACKAGE-TYPECHECK")
    && (parseId == "PARSE-LIVE-PACKAGE-TYPECHECK")
    && (liveRel == "PackageTypecheck.lean")
    && (livePackageTypecheckRel == "PackageTypecheck.lean")
    && (liveRel.splitOn "/").length == 1
    && liveParseDoesNotUseMultFixture
    && !hostFrontLivePackageTypecheckFullHost
    && !hostFrontLivePackageTypecheckFullBackend
    && !hostFrontLivePackageTypecheckResidualFreeClaimed
    && !hostFrontLivePackageTypecheckProvablyUnlocked
    && kernelCheckLivePackageTypecheckSource livePackageTypecheckSource
    && liveParseHasNoCheckCmd
    && liveParseShapeOk
    && liveParseHasPackageTypecheckModule
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

def runLivePackageTypecheck (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PACKAGE-TYPECHECK =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={livePackageTypecheckRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {livePackageTypecheckRel}"
    throw (IO.userError s!"missing {livePackageTypecheckRel}")
  let disk <- IO.FS.readFile path
  -- Source raw string keeps one leading newline ahead of the product bytes.
  if livePackageTypecheckSource != "\n" ++ disk then
    IO.eprintln "error: dual-pin mismatch: on-disk PackageTypecheck.lean != livePackageTypecheckSource"
    throw (IO.userError "dual-pin mismatch live PackageTypecheck.lean")
  let r := parseLivePackageTypecheckSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PACKAGE-TYPECHECK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PACKAGE-TYPECHECK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PACKAGE-TYPECHECK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln s!"error: kernelCheck false cmds={cmdsBriefN 80 m.commands ""}"
      throw (IO.userError "kernelCheck live PackageTypecheck parse false")
    unless hostFrontLivePackageTypecheckReady do
      IO.eprintln s!"error: hostFrontLivePackageTypecheckReady false shape={liveParseShapeOk} core={liveParseHasCoreDefs} imports={liveImportTokCountOk} needles={liveNeedlesOk} empty={liveParseRejectsEmpty} cmds={cmdsBriefN 80 m.commands ""}"
      throw (IO.userError "hostFrontLivePackageTypecheckReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty PackageTypecheck source was accepted"
      throw (IO.userError "empty PackageTypecheck source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLivePackageTypecheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLivePackageTypecheck
