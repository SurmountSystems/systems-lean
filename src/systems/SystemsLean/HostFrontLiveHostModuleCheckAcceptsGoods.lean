/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckAcceptsGoods.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckAcceptsGoods. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies) and the string-safe
  comment fold HostFrontLiveHostCheck.stripCommentsHc. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostModuleCheckAcceptsGoods.lean only.
  Do not retarget HostFrontLiveHostModuleCheckAccepts. That checker parses
  HostModuleCheckAccepts.lean only. Do not edit HostModuleCheckAccepts.lean.
  Do not edit HostModuleCheckAcceptsGoods.lean.
  Do not wrap HostModuleCheckAcceptsGoodsTerm or any later file.
  Do not edit HostKernel. Not an ElabMeet file.
  Unique needles use trailing newline so HostFrontLiveHostModuleCheckAcceptsGoods
  is not a prefix of a longer checker name.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.

  Spec (readable):
  - parseLiveHostModuleCheckAcceptsGoodsSource turns live
    HostModuleCheckAcceptsGoods.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckAcceptsGoods even without a module line.
  - kernelCheckLiveHostModuleCheckAcceptsGoodsSource is HostKernel.kernelCheck of
    that parse. Not a constant true.
  - This live file has 19 dotted imports, namespace, 113 un-kernelable
    defs, one String cite def, and end. stripCommentsHc drops comments,
    including dash-dash inside a block comment and a doc comment. Skip
    un-kernelable defs. Keep dotted import / namespace / the String cite
    def / end.
  - Living namespace lastSeg is HostModuleCheck.
  - Wrap-assigned module lastSeg is HostModuleCheckAcceptsGoods.
  - End namespace lastSeg is HostModuleCheck.
  - 19 dotted imports kept. An empty command list is a rejected empty parse.
  - Skip-head still sees def hostModuleCheckGoodMult,
    hostModuleCheckGoodDualEqWriteParityTheorems, and
    hostModuleCheckAcceptsGoodsTermModuleCite
    via toksHaveDefNamed.
  - The String cite def is kernelable (HostType.string, litString) and is kept.
  - Expected command count after skip-fold: 22
    (19 imports + namespace + cite def + end).
    Kept commands stay under HostKernel.kernelFuel 64.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - slakeOwnsPackageTypecheck stays false.
  - Not Linear / Compose / IrGraph parsers.
  - Not the HostModuleCheck checker. Not the HostModuleCheckAccepts checker.
  - Not HostModuleCheckAcceptsGoodsTerm.

  Unique needles (trailing newline so HostFrontLiveHostModuleCheckAcceptsGoods is not a prefix):
  HostFrontLiveHostModuleCheckAcceptsGoods
  PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_ACCEPTS_GOODS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckAcceptsGoodsSource,
  kernelCheckLiveHostModuleCheckAcceptsGoodsSource,
  hostFrontLiveHostModuleCheckAcceptsGoodsReady, liveHostModuleCheckAcceptsGoodsSource,
  liveHostModuleCheckAcceptsGoodsRel, liveRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods
  Red/green: lean --run SlakeTypecheckHostModuleCheckAcceptsGoods on horizon
  (no mill; no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_ACCEPTS_GOODS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path constant. liveRel stays the bare basename. -/
def liveHostModuleCheckAcceptsGoodsRel : String :=
  "src/systems/SystemsLean/HostModuleCheckAcceptsGoods.lean"

/-- Live basename. Greppable: liveRel. Must be HostModuleCheckAcceptsGoods.lean. -/
def liveRel : String := "HostModuleCheckAcceptsGoods.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). 19 imports + 114 defs + namespace + end
    is 135 steps. 256 covers that fold. -/
def liveHostModuleCheckAcceptsGoodsParseFuel : Nat := 256

/-- Skip fuel for un-kernelable def tails. -/
def liveHostModuleCheckAcceptsGoodsSkipFuel : Nat := 8192

/-- Kept dotted imports after the skip-fold. -/
def liveHostModuleCheckAcceptsGoodsImportCount : Nat := 19

/-- Kept commands: 19 imports + namespace + String cite def + end.
    Under kernelFuel 64. -/
def liveHostModuleCheckAcceptsGoodsCmdCount : Nat := 22

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckAcceptsGoods has dash-dash in the header block comment and
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

/-- String-safe comment strip for live HostModuleCheckAcceptsGoods.lean bytes.
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
def cmdAddsHostModuleCheckAcceptsGoods (c : Cmd) : List String :=
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
def cmdBodyKnownHostModuleCheckAcceptsGoods (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckAcceptsGoodsParseFuel body
        && termNoAppN liveHostModuleCheckAcceptsGoodsParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckAcceptsGoodsParseFuel body
        && termNoAppN liveHostModuleCheckAcceptsGoodsParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a following token becomes Term.app and skip-folds the
    kernelable def. checkRealModule applications fail closed here. -/
def parseDefHostModuleCheckAcceptsGoods (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostModuleCheckAcceptsGoodsSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. -/
def parseOneCmdHostModuleCheckAcceptsGoods (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostModuleCheckAcceptsGoods fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip un-kernelable defs. Keep dotted import / namespace / end. -/
def parseCmdsHostModuleCheckAcceptsGoods : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostModuleCheckAcceptsGoods liveHostModuleCheckAcceptsGoodsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostModuleCheckAcceptsGoodsSkipFuel rest
      if cmdBodyKnownHostModuleCheckAcceptsGoods kn c then
        parseCmdsHostModuleCheckAcceptsGoods n rest2
          (kn ++ cmdAddsHostModuleCheckAcceptsGoods c) (acc ++ [c])
      else
        parseCmdsHostModuleCheckAcceptsGoods n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostModuleCheckAcceptsGoodsSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostModuleCheckAcceptsGoods n rest2 kn acc
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

/-- Parse live HostModuleCheckAcceptsGoods.lean text.
    Greppable: parseLiveHostModuleCheckAcceptsGoodsSource,
    PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS. -/
def parseLiveHostModuleCheckAcceptsGoodsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostModuleCheckAcceptsGoods liveHostModuleCheckAcceptsGoodsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckAcceptsGoods"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckAcceptsGoods parse. Not a fixture.
    Not occupancy Term. Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveHostModuleCheckAcceptsGoodsSource,
    PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS. -/
def kernelCheckLiveHostModuleCheckAcceptsGoodsSource (src : String) : Bool :=
  match parseLiveHostModuleCheckAcceptsGoodsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostModuleCheckAcceptsGoodsParsed? : Option Module :=
  match parseLiveHostModuleCheckAcceptsGoodsSource liveHostModuleCheckAcceptsGoodsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
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

/-- Live parse command count (19 dotted imports + namespace + cite def + end).
    Real bound from this parse, not hardcoded true. Horizon expected
    cmds=22. An empty command list is rejected before kernelCheck.
    Kept commands stay under kernelFuel 64. -/
def liveParseCmdCountOk : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | some m => m.commands.length == liveHostModuleCheckAcceptsGoodsCmdCount
  | none => false

/-- Live parse kept 19 dotted imports. -/
def liveParseImportCountOk : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | none => false
  | some m => countImportCmds m.commands == liveHostModuleCheckAcceptsGoodsImportCount

/-- Kept commands are import, namespace, end, or the String cite def. -/
def liveParseKeptImportNsEnd : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | Cmd.def_ x _ _ =>
        x.raw == "hostModuleCheckAcceptsGoodsTermModuleCite"
      | _ => false

/-- Wrap module name is SystemsLean.HostModuleCheckAcceptsGoods (no module line). -/
def liveParseHasHostModuleCheckAcceptsGoodsModule : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | none => false
  | some m => m.name.raw == "SystemsLean.HostModuleCheckAcceptsGoods"

/-- Live parse has the living HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse has the HostModuleCheck end namespace command. -/
def liveParseHasHostModuleCheckEnd : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse kept one named dotted import. Exact raw, not lastSeg prefix. -/
def liveParseHasImportNamed (nm : String) : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- First dotted import kept. -/
def liveParseHasFixturesImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckFixtures"

/-- Surface dotted import kept. -/
def liveParseHasSurfaceImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckSurface"

/-- RealModule dotted import kept. -/
def liveParseHasRealModuleImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckRealModule"

/-- Last dotted import kept (AcceptsGoodsTerm, not this product file). -/
def liveParseHasAcceptsGoodsTermImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostModuleCheckAcceptsGoodsTerm"

/-- Skip-head: named defs are local in HostModuleCheckAcceptsGoods.lean.
    Token walk still sees the def even if the checkRealModule body skip-folds. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostModuleCheckAcceptsGoodsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostModuleCheckAcceptsGoodsSource)
    toksHaveDefNamed liveHostModuleCheckAcceptsGoodsSkipFuel toks
        "hostModuleCheckGoodMult"
      && toksHaveDefNamed liveHostModuleCheckAcceptsGoodsSkipFuel toks
        "hostModuleCheckGoodDualEqWriteParityTheorems"
      && toksHaveDefNamed liveHostModuleCheckAcceptsGoodsSkipFuel toks
        "hostModuleCheckAcceptsGoodsTermModuleCite"

/-- Empty source rejects. An empty command list is not an accept. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckAcceptsGoodsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckAcceptsGoodsReady,
    PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS,
    HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_ACCEPTS_GOODS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS")
    && (parseId == "PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS")
    && (liveHostModuleCheckAcceptsGoodsRel
      == "src/systems/SystemsLean/HostModuleCheckAcceptsGoods.lean")
    && (liveRel == "HostModuleCheckAcceptsGoods.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckAcceptsGoodsFullHost
    && !hostFrontLiveHostModuleCheckAcceptsGoodsResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckAcceptsGoodsProvablyUnlocked
    && !hostFrontLiveHostModuleCheckAcceptsGoodsOwnsPackageTypecheck
    && kernelCheckLiveHostModuleCheckAcceptsGoodsSource liveHostModuleCheckAcceptsGoodsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportCountOk
    && liveParseKeptImportNsEnd
    && liveParseHasHostModuleCheckAcceptsGoodsModule
    && liveParseHasHostModuleCheckNs
    && liveParseHasHostModuleCheckEnd
    && liveParseHasFixturesImport
    && liveParseHasSurfaceImport
    && liveParseHasRealModuleImport
    && liveParseHasAcceptsGoodsTermImport
    && liveParseHasCoreDefs
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostModuleCheckAcceptsGoods (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsGoodsRel} liveRel={liveRel}"
  let path := root / liveHostModuleCheckAcceptsGoodsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckAcceptsGoodsRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckAcceptsGoodsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckAcceptsGoodsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckAcceptsGoods.lean != liveHostModuleCheckAcceptsGoodsSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckAcceptsGoods.lean")
  let r := parseLiveHostModuleCheckAcceptsGoodsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckAcceptsGoods parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckAcceptsGoods parse false")
    unless hostFrontLiveHostModuleCheckAcceptsGoodsReady do
      IO.eprintln s!"error: hostFrontLiveHostModuleCheckAcceptsGoodsReady false count={liveParseCmdCountOk} imports={liveParseImportCountOk} kept={liveParseKeptImportNsEnd} module={liveParseHasHostModuleCheckAcceptsGoodsModule} ns={liveParseHasHostModuleCheckNs} end={liveParseHasHostModuleCheckEnd} fixtures={liveParseHasFixturesImport} surface={liveParseHasSurfaceImport} realModule={liveParseHasRealModuleImport} goodsTerm={liveParseHasAcceptsGoodsTermImport} defs={liveParseHasCoreDefs} empty={liveParseRejectsEmpty} nocheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveHostModuleCheckAcceptsGoodsReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckAcceptsGoods.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheckAcceptsGoods root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods
