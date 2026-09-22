/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SelfApplyFsClose.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfApplyFsClose. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses SelfApplyFsClose.lean only.
  Do not edit SelfApplyFsClose.lean. Do not wrap another SelfApplyFs file.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.

  Spec (readable):
  - parseLiveSelfApplyFsCloseSource turns live SelfApplyFsClose.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.SelfApplyFsClose even without a module line.
  - kernelCheckLiveSelfApplyFsCloseSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, boolean && chains, Term.app) are skip-folded. Kernelable
    string/Bool atom defs plus import / namespace / end remain.
  - Imports kept (dotted). Open skipped. parseOneCmd none => skipUntilCmd.
    Drop defs whose body fails termKnownN / termNoBadProjN / termNoAppN /
    termIsKernelAtom.
  - Living namespace lastSeg is SelfApplyFs.
  - Wrap-assigned module lastSeg is SelfApplyFsClose.
  - liveRel is SelfApplyFsClose.lean.
  - Hyphenated stage id: SELF-APPLY-FS-CLOSE.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.

  Unique needles from SelfApplyFsClose.lean only (each Lean string ends
  with a newline):
  Module: SystemsLean.SelfApplyFsClose
  Long-file peel companion of SelfApplyFs. Namespace SystemsLean.SelfApplyFs.
  def productPathDualEqualityWriteClosePathNotGapClosed : Bool := false
  def freestandingDualEqualityWriteCloseStepFull : String :=

  Wrap identity needles (trailing newline so HostFrontLiveSelfApplyFsClose is
  not a prefix):
  HostFrontLiveSelfApplyFsClose
  PARSE-LIVE-SELF-APPLY-FS-CLOSE
  HOST-FRONT-LIVE-SELF-APPLY-FS-CLOSE
  SELF-APPLY-FS-CLOSE

  Greppable: SYSTEMS_LEAN_HOST, SELF-APPLY-FS-CLOSE,
  parseLiveSelfApplyFsCloseSource,
  kernelCheckLiveSelfApplyFsCloseSource,
  hostFrontLiveSelfApplyFsCloseReady, liveSelfApplyFsCloseSource,
  liveSelfApplyFsCloseRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveSelfApplyFsClose
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveSelfApplyFsClose on surmount-1 (queued, not run).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfApplyFsCloseSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfApplyFsClose

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Hyphenated: SELF-APPLY-FS-CLOSE. -/
def stageId : String := "SELF-APPLY-FS-CLOSE"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELF-APPLY-FS-CLOSE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELF-APPLY-FS-CLOSE"

/-- Live basename. Greppable: liveRel. Must be SelfApplyFsClose.lean. -/
def liveRel : String := "SelfApplyFsClose.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfApplyFsCloseRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfApplyFsCloseFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSelfApplyFsCloseResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSelfApplyFsCloseProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveSelfApplyFsCloseOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveSelfApplyFsCloseParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveSelfApplyFsCloseSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    SelfApplyFsClose has hyphenated strings and block comments.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsSafcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsSafcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsSafcN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsSafcN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsSafcN n nest false false ('"' :: acc) rest
        else
          stripCommentsSafcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsSafcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsSafcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsSafcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsSafcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsSafcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsSafcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsSafcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsSafcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live SelfApplyFsClose.lean bytes. -/
def stripCommentsSafc (src : String) : String :=
  String.ofList (stripCommentsSafcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . SelfApplyFs`. -/
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
def cmdAddsSelfApplyFsClose (c : Cmd) : List String :=
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
def cmdBodyKnownSelfApplyFsClose (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfApplyFsCloseParseFuel body
        && termNoAppN liveSelfApplyFsCloseParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfApplyFsCloseParseFuel body
        && termNoAppN liveSelfApplyFsCloseParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefSelfApplyFsClose (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveSelfApplyFsCloseSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdSelfApplyFsClose (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSelfApplyFsClose fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsSelfApplyFsClose : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSelfApplyFsClose liveSelfApplyFsCloseParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSelfApplyFsCloseSkipFuel rest
      if cmdBodyKnownSelfApplyFsClose kn c then
        parseCmdsSelfApplyFsClose n rest2
          (kn ++ cmdAddsSelfApplyFsClose c) (acc ++ [c])
      else
        parseCmdsSelfApplyFsClose n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSelfApplyFsCloseSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSelfApplyFsClose n rest2 kn acc
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

/-- Empty needle is not a pin. Needle strings end with a newline. -/
def sourceHasNeedle (src needle : String) : Bool :=
  if needle.isEmpty then false
  else (src.splitOn needle).length > 1

def needleEndsWithNewline (needle : String) : Bool :=
  match needle.toList.getLast? with
  | some c => c == '\n'
  | none => false

/-- Unique line from SelfApplyFsClose.lean. Ends with newline. -/
def needleModuleClose : String :=
  "  Module: SystemsLean.SelfApplyFsClose\n"

/-- Unique line from SelfApplyFsClose.lean. Ends with newline. -/
def needlePeelCompanion : String :=
  "  Long-file peel companion of SelfApplyFs. Namespace SystemsLean.SelfApplyFs.\n"

/-- Unique line from SelfApplyFsClose.lean. Ends with newline.
    Sibling DualEqWriteClosePath pins this name `:= true`, not `:= false`. -/
def needleNotGapClosedFalse : String :=
  "def productPathDualEqualityWriteClosePathNotGapClosed : Bool := false\n"

/-- Unique line from SelfApplyFsClose.lean. Ends with newline. -/
def needleCloseStepFull : String :=
  "def freestandingDualEqualityWriteCloseStepFull : String :=\n"

/-- All four source needles are present and newline-terminated. -/
def liveNeedlesOk : Bool :=
  needleEndsWithNewline needleModuleClose
    && needleEndsWithNewline needlePeelCompanion
    && needleEndsWithNewline needleNotGapClosedFalse
    && needleEndsWithNewline needleCloseStepFull
    && sourceHasNeedle liveSelfApplyFsCloseSource needleModuleClose
    && sourceHasNeedle liveSelfApplyFsCloseSource needlePeelCompanion
    && sourceHasNeedle liveSelfApplyFsCloseSource needleNotGapClosedFalse
    && sourceHasNeedle liveSelfApplyFsCloseSource needleCloseStepFull

/-- Parse live SelfApplyFsClose.lean text.
    Greppable: parseLiveSelfApplyFsCloseSource,
    PARSE-LIVE-SELF-APPLY-FS-CLOSE. -/
def parseLiveSelfApplyFsCloseSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsSafc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfApplyFsClose liveSelfApplyFsCloseParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfApplyFsClose"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfApplyFsClose parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveSelfApplyFsCloseSource,
    PARSE-LIVE-SELF-APPLY-FS-CLOSE. -/
def kernelCheckLiveSelfApplyFsCloseSource (src : String) : Bool :=
  match parseLiveSelfApplyFsCloseSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfApplyFsCloseParsed? : Option Module :=
  match parseLiveSelfApplyFsCloseSource liveSelfApplyFsCloseSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfApplyFsCloseParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true.
    Ten imports, namespace, thirty-three kernelable String/Bool atoms, end.
    Nine compound && PartialReady defs skip-fold. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfApplyFsCloseParsed? with
  | some m => m.commands.length >= 45
  | none => false

/-- Wrap module lastSeg is SelfApplyFsClose (no module line in the live file). -/
def liveParseHasSelfApplyFsCloseModule : Bool :=
  match liveSelfApplyFsCloseParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "SelfApplyFsClose"

/-- Live parse has the living SelfApplyFs namespace command. -/
def liveParseHasSelfApplyFsNs : Bool :=
  match liveSelfApplyFsCloseParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SelfApplyFs"
      | _ => false

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  match liveSelfApplyFsCloseParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "SelfApplyFs"
      | _ => false

/-- Skip-head: atom def and the close-step string def are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveSelfApplyFsCloseParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsSafc liveSelfApplyFsCloseSource)
    toksHaveDefNamed liveSelfApplyFsCloseSkipFuel toks
        "productPathFreestandingPerformDualEqualityWriteParityMeasured"
      && toksHaveDefNamed liveSelfApplyFsCloseSkipFuel toks
        "freestandingDualEqualityWriteCloseStepFull"
      && toksHaveDefNamed liveSelfApplyFsCloseSkipFuel toks
        "freestandingProductSelfHostCompleteMeasured"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSelfApplyFsCloseReady,
    PARSE-LIVE-SELF-APPLY-FS-CLOSE,
    HOST-FRONT-LIVE-SELF-APPLY-FS-CLOSE, SELF-APPLY-FS-CLOSE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSelfApplyFsCloseReady : Bool :=
  (stageId == "SELF-APPLY-FS-CLOSE")
    && (hostId == "HOST-FRONT-LIVE-SELF-APPLY-FS-CLOSE")
    && (parseId == "PARSE-LIVE-SELF-APPLY-FS-CLOSE")
    && (liveRel == "SelfApplyFsClose.lean")
    && (liveSelfApplyFsCloseRel
      == "src/systems/SystemsLean/SelfApplyFsClose.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSelfApplyFsCloseFullHost
    && !hostFrontLiveSelfApplyFsCloseResidualFreeClaimed
    && !hostFrontLiveSelfApplyFsCloseProvablyUnlocked
    && !hostFrontLiveSelfApplyFsCloseOwnsPackageTypecheck
    && liveNeedlesOk
    && kernelCheckLiveSelfApplyFsCloseSource liveSelfApplyFsCloseSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSelfApplyFsCloseModule
    && liveParseHasSelfApplyFsNs
    && liveParseHasSelfApplyFsImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfApplyFsCloseSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveSelfApplyFsClose (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELF-APPLY-FS-CLOSE =="
  IO.println s!"  host={hostId} file={liveSelfApplyFsCloseRel} liveRel={liveRel}"
  let path := root / liveSelfApplyFsCloseRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSelfApplyFsCloseRel}"
    throw (IO.userError s!"missing {liveSelfApplyFsCloseRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSelfApplyFsCloseSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfApplyFsClose.lean != liveSelfApplyFsCloseSource"
    throw (IO.userError "dual-pin mismatch live SelfApplyFsClose.lean")
  let r := parseLiveSelfApplyFsCloseSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELF-APPLY-FS-CLOSE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELF-APPLY-FS-CLOSE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELF-APPLY-FS-CLOSE ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfApplyFsClose parse false"
      throw (IO.userError "kernelCheck live SelfApplyFsClose parse false")
    unless hostFrontLiveSelfApplyFsCloseReady do
      IO.eprintln "error: hostFrontLiveSelfApplyFsCloseReady false"
      throw (IO.userError "hostFrontLiveSelfApplyFsCloseReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"GREEN {stageId}: live SelfApplyFsClose.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfApplyFsClose root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfApplyFsClose
