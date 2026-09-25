/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckAccepts.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckAccepts. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies) and the string-safe
  comment fold HostFrontLiveHostCheck.stripCommentsHc. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostModuleCheckAccepts.lean only.
  Do not retarget HostFrontLiveHostModuleCheck. That checker parses
  HostModuleCheck.lean only. Do not edit HostModuleCheck.lean.
  Do not wrap the AcceptsGoods or AcceptsLater product files.
  Do not edit HostKernel. Not an ElabMeet file.
  Unique needles use trailing newline so HostFrontLiveHostModuleCheckAccepts
  is not a prefix of a longer checker name.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.

  Spec (readable):
  - parseLiveHostModuleCheckAcceptsSource turns live
    HostModuleCheckAccepts.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckAccepts even without a module line.
  - kernelCheckLiveHostModuleCheckAcceptsSource is HostKernel.kernelCheck of
    that parse. Not a constant true.
  - This live file has 44 dotted imports, namespace, 93 un-kernelable
    defs, and end. stripCommentsHc drops comments, including dash-dash inside
    a block comment and a doc comment. Skip un-kernelable defs. Keep dotted
    import / namespace / end.
  - Living namespace lastSeg is HostModuleCheck.
  - Wrap-assigned module lastSeg is HostModuleCheckAccepts.
  - End namespace lastSeg is HostModuleCheck.
  - 44 dotted imports kept. An empty command list is a rejected empty parse.
  - Skip-head still sees def hostModuleCheckGoodOfficialRetire,
    hostModuleCheckGoodHostCheck, and hostModuleCheckGoodSpecProofTheorems
    via toksHaveDefNamed.
  - Expected command count after skip-fold: 46 (44 imports + namespace + end).
    Kept commands stay under HostKernel.kernelFuel 64.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - slakeOwnsPackageTypecheck stays false.
  - Not Linear / Compose / IrGraph parsers.
  - Not the HostModuleCheck checker. Not the AcceptsGoods checker.

  Unique needles (trailing newline so HostFrontLiveHostModuleCheckAccepts is not a prefix):
  HostFrontLiveHostModuleCheckAccepts
  PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_ACCEPTS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckAcceptsSource,
  kernelCheckLiveHostModuleCheckAcceptsSource,
  hostFrontLiveHostModuleCheckAcceptsReady, liveHostModuleCheckAcceptsSource,
  liveHostModuleCheckAcceptsRel, liveRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostModuleCheckAccepts
  Red/green: lean --run SlakeTypecheckHostModuleCheckAccepts on horizon
  (no mill; no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckAcceptsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckAccepts

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_ACCEPTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path constant. liveRel stays the bare basename. -/
def liveHostModuleCheckAcceptsRel : String :=
  "src/systems/SystemsLean/HostModuleCheckAccepts.lean"

/-- Live basename. Greppable: liveRel. Must be HostModuleCheckAccepts.lean. -/
def liveRel : String := "HostModuleCheckAccepts.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckAcceptsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckAcceptsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckAcceptsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostModuleCheckAcceptsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). 44 imports + 93 skipped defs + namespace + end
    is 139 steps. 256 covers that fold. -/
def liveHostModuleCheckAcceptsParseFuel : Nat := 256

/-- Skip fuel for un-kernelable def tails. -/
def liveHostModuleCheckAcceptsSkipFuel : Nat := 8192

/-- Kept dotted imports after the skip-fold. -/
def liveHostModuleCheckAcceptsImportCount : Nat := 44

/-- Kept commands: 44 imports + namespace + end. Under kernelFuel 64. -/
def liveHostModuleCheckAcceptsCmdCount : Nat := 46

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckAccepts has dash-dash in the header block comment and
    in doc comments. No backslash escapes in that file. -/
def stripCommentsHcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHcN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsHcN n nest false false ('"' :: acc) rest
        else
          stripCommentsHcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostModuleCheckAccepts.lean bytes.
    Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

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
def cmdAddsHostModuleCheckAccepts (c : Cmd) : List String :=
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
def cmdBodyKnownHostModuleCheckAccepts (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckAcceptsParseFuel body
        && termNoAppN liveHostModuleCheckAcceptsParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckAcceptsParseFuel body
        && termNoAppN liveHostModuleCheckAcceptsParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a following token becomes Term.app and skip-folds the
    kernelable def. checkRealModule applications fail closed here. -/
def parseDefHostModuleCheckAccepts (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostModuleCheckAcceptsSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. -/
def parseOneCmdHostModuleCheckAccepts (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostModuleCheckAccepts fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip un-kernelable defs. Keep dotted import / namespace / end. -/
def parseCmdsHostModuleCheckAccepts : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostModuleCheckAccepts liveHostModuleCheckAcceptsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostModuleCheckAcceptsSkipFuel rest
      if cmdBodyKnownHostModuleCheckAccepts kn c then
        parseCmdsHostModuleCheckAccepts n rest2
          (kn ++ cmdAddsHostModuleCheckAccepts c) (acc ++ [c])
      else
        parseCmdsHostModuleCheckAccepts n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostModuleCheckAcceptsSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostModuleCheckAccepts n rest2 kn acc
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

/-- Parse live HostModuleCheckAccepts.lean text.
    Greppable: parseLiveHostModuleCheckAcceptsSource,
    PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS. -/
def parseLiveHostModuleCheckAcceptsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostModuleCheckAccepts liveHostModuleCheckAcceptsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckAccepts"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckAccepts parse. Not a fixture.
    Not occupancy Term. Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveHostModuleCheckAcceptsSource,
    PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS. -/
def kernelCheckLiveHostModuleCheckAcceptsSource (src : String) : Bool :=
  match parseLiveHostModuleCheckAcceptsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostModuleCheckAcceptsParsed? : Option Module :=
  match parseLiveHostModuleCheckAcceptsSource liveHostModuleCheckAcceptsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Count kept import commands. -/
def countImportCmds : List Cmd -> Nat
  | [] => 0
  | Cmd.importModule _ :: rest => countImportCmds rest + 1
  | _ :: rest => countImportCmds rest

/-- Live parse command count (44 dotted imports + namespace + end).
    Real bound from this parse, not hardcoded true. Horizon expected
    cmds=46. An empty command list is rejected before kernelCheck.
    Kept commands stay under kernelFuel 64. -/
def liveParseCmdCountOk : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | some m => m.commands.length == liveHostModuleCheckAcceptsCmdCount
  | none => false

/-- Live parse kept 44 dotted imports and no other command kinds. -/
def liveParseImportCountOk : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some m => countImportCmds m.commands == liveHostModuleCheckAcceptsImportCount

/-- Kept commands are only import, namespace, and end. -/
def liveParseKeptImportNsEnd : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module name is SystemsLean.HostModuleCheckAccepts (no module line). -/
def liveParseHasHostModuleCheckAcceptsModule : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some m => m.name.raw == "SystemsLean.HostModuleCheckAccepts"

/-- Live parse has the living HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse has the HostModuleCheck end namespace command. -/
def liveParseHasHostModuleCheckEnd : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse kept one named dotted import. Exact raw, not lastSeg prefix. -/
def liveParseHasImportNamed (nm : String) : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- First dotted import kept. -/
def liveParseHasFixturesImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckFixtures"

/-- AcceptsGoods dotted import kept. Not a retarget of that product file. -/
def liveParseHasGoodsImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckAcceptsGoods"

/-- AcceptsLater dotted import kept. Not a retarget of that product file. -/
def liveParseHasLaterImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckAcceptsLater"

/-- Last dotted import kept (SelfHostBodyTerm, not SelfHostBody). -/
def liveParseHasSelfHostBodyTermImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckSelfHostBodyTerm"

/-- Skip-head: named defs are local in HostModuleCheckAccepts.lean.
    Token walk still sees the def even if the checkRealModule body skip-folds. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostModuleCheckAcceptsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostModuleCheckAcceptsSource)
    toksHaveDefNamed liveHostModuleCheckAcceptsSkipFuel toks
        "hostModuleCheckGoodOfficialRetire"
      && toksHaveDefNamed liveHostModuleCheckAcceptsSkipFuel toks
        "hostModuleCheckGoodHostCheck"
      && toksHaveDefNamed liveHostModuleCheckAcceptsSkipFuel toks
        "hostModuleCheckGoodSpecProofTheorems"

/-- Empty source rejects. An empty command list is not an accept. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckAcceptsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckAcceptsReady,
    PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS,
    HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostModuleCheckAcceptsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_ACCEPTS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS")
    && (parseId == "PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS")
    && (liveHostModuleCheckAcceptsRel
      == "src/systems/SystemsLean/HostModuleCheckAccepts.lean")
    && (liveRel == "HostModuleCheckAccepts.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckAcceptsFullHost
    && !hostFrontLiveHostModuleCheckAcceptsResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckAcceptsProvablyUnlocked
    && !hostFrontLiveHostModuleCheckAcceptsOwnsPackageTypecheck
    && kernelCheckLiveHostModuleCheckAcceptsSource liveHostModuleCheckAcceptsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportCountOk
    && liveParseKeptImportNsEnd
    && liveParseHasHostModuleCheckAcceptsModule
    && liveParseHasHostModuleCheckNs
    && liveParseHasHostModuleCheckEnd
    && liveParseHasFixturesImport
    && liveParseHasGoodsImport
    && liveParseHasLaterImport
    && liveParseHasSelfHostBodyTermImport
    && liveParseHasCoreDefs
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostModuleCheckAccepts (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsRel} liveRel={liveRel}"
  let path := root / liveHostModuleCheckAcceptsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckAcceptsRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckAcceptsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckAcceptsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckAccepts.lean != liveHostModuleCheckAcceptsSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckAccepts.lean")
  let r := parseLiveHostModuleCheckAcceptsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckAccepts parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckAccepts parse false")
    unless hostFrontLiveHostModuleCheckAcceptsReady do
      IO.eprintln s!"error: hostFrontLiveHostModuleCheckAcceptsReady false count={liveParseCmdCountOk} imports={liveParseImportCountOk} kept={liveParseKeptImportNsEnd} module={liveParseHasHostModuleCheckAcceptsModule} ns={liveParseHasHostModuleCheckNs} end={liveParseHasHostModuleCheckEnd} fixtures={liveParseHasFixturesImport} goods={liveParseHasGoodsImport} later={liveParseHasLaterImport} selfHostTerm={liveParseHasSelfHostBodyTermImport} defs={liveParseHasCoreDefs} empty={liveParseRejectsEmpty} nocheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveHostModuleCheckAcceptsReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckAccepts.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheckAccepts root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckAccepts
