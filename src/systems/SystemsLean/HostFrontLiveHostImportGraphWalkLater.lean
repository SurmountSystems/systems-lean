/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphWalkLater.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphWalkLater. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies) and the string-safe
  comment fold HostFrontLiveHostCheck.stripCommentsHc. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostImportGraphWalkLater.lean only.
  Do not retarget HostFrontLiveHostImportGraphWalk. That checker parses
  HostImportGraphWalk.lean only. Do not edit HostImportGraphWalk.lean.
  Do not steal HostImportGraph, HostImportGraphSeeds, or HostImportGraphMain.
  Unique needles use trailing newline so HostFrontLiveHostImportGraphWalkLater
  is not a prefix hit on HostFrontLiveHostImportGraphWalk.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostKernel. Not HostModuleCheck. Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostImportGraphWalkLaterSource turns live
    HostImportGraphWalkLater.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphWalkLater even without a module line.
  - kernelCheckLiveHostImportGraphWalkLaterSource is HostKernel.kernelCheck of
    that parse. Not a constant true.
  - This live file has one dotted import, namespace, one un-kernelable IO
    def, and end. stripCommentsHc drops comments, including dash-dash inside
    a block comment and a doc comment. Skip open, theorem, example, and
    un-kernelable defs. Keep dotted import / namespace / end.
  - Living namespace lastSeg is HostImportGraph.
  - Wrap-assigned module lastSeg is HostImportGraphWalkLater.
  - End namespace lastSeg is HostImportGraph.
  - One dotted import kept (HostImportGraphModel).
  - Skip-head still sees def checkImportOrderEdgesLater via toksHaveDefNamed.
  - Do not require toksHaveDefNamed stageId or hostId: those defs are not
    local in HostImportGraphWalkLater.lean.
  - Expected command count after skip-fold: 3 (import + namespace + end).
    An empty command list is a rejected empty parse. Do not copy Walk 4.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - slakeOwnsPackageTypecheck stays false.
  - Not Linear / Compose / IrGraph parsers.
  - Not the HostImportGraphWalk checker.

  Unique needles (trailing newline so HostFrontLiveHostImportGraphWalkLater is not a prefix):
  HostFrontLiveHostImportGraphWalkLater
  PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK-LATER
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_WALK_LATER_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostImportGraphWalkLaterSource,
  kernelCheckLiveHostImportGraphWalkLaterSource,
  hostFrontLiveHostImportGraphWalkLaterReady, liveHostImportGraphWalkLaterSource,
  liveHostImportGraphWalkLaterRel, liveRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostImportGraphWalkLater
  Red/green: lean --run SlakeTypecheckHostImportGraphWalkLater on horizon
  (no mill; no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostImportGraphWalkLaterSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostImportGraphWalkLater

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_WALK_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK-LATER"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path constant. liveRel stays the bare basename. -/
def liveHostImportGraphWalkLaterRel : String :=
  "src/systems/SystemsLean/HostImportGraphWalkLater.lean"

/-- Live basename. Greppable: liveRel. Must be HostImportGraphWalkLater.lean. -/
def liveRel : String := "HostImportGraphWalkLater.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostImportGraphWalkLaterFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostImportGraphWalkLaterResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostImportGraphWalkLaterProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostImportGraphWalkLaterOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveHostImportGraphWalkLaterParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostImportGraphWalkLaterSkipFuel : Nat := 8192

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostImportGraphWalkLater has dash-dash in the header block comment and
    in a doc comment. No backslash escapes in that file. -/
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

/-- String-safe comment strip for live HostImportGraphWalkLater.lean bytes.
    Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostImportGraph`. -/
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
def cmdAddsHostImportGraphWalkLater (c : Cmd) : List String :=
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
def cmdBodyKnownHostImportGraphWalkLater (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphWalkLaterParseFuel body
        && termNoAppN liveHostImportGraphWalkLaterParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphWalkLaterParseFuel body
        && termNoAppN liveHostImportGraphWalkLaterParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostImportGraphWalkLater (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostImportGraphWalkLaterSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostImportGraphWalkLater (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostImportGraphWalkLater fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. Keep dotted import / namespace / end. -/
def parseCmdsHostImportGraphWalkLater : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostImportGraphWalkLater liveHostImportGraphWalkLaterParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostImportGraphWalkLaterSkipFuel rest
      if cmdBodyKnownHostImportGraphWalkLater kn c then
        parseCmdsHostImportGraphWalkLater n rest2
          (kn ++ cmdAddsHostImportGraphWalkLater c) (acc ++ [c])
      else
        parseCmdsHostImportGraphWalkLater n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostImportGraphWalkLaterSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostImportGraphWalkLater n rest2 kn acc
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

/-- Parse live HostImportGraphWalkLater.lean text.
    Greppable: parseLiveHostImportGraphWalkLaterSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER. -/
def parseLiveHostImportGraphWalkLaterSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostImportGraphWalkLater liveHostImportGraphWalkLaterParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphWalkLater"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphWalkLater parse. Not a fixture.
    Not occupancy Term. Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveHostImportGraphWalkLaterSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER. -/
def kernelCheckLiveHostImportGraphWalkLaterSource (src : String) : Bool :=
  match parseLiveHostImportGraphWalkLaterSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostImportGraphWalkLaterParsed? : Option Module :=
  match parseLiveHostImportGraphWalkLaterSource liveHostImportGraphWalkLaterSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostImportGraphWalkLaterParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (1 dotted import + namespace + end).
    Real bound from this parse, not hardcoded true. Horizon expected
    cmds=3. An empty command list is rejected before kernelCheck.
    Do not copy HostImportGraphWalk 4. -/
def liveParseCmdCountOk : Bool :=
  match liveHostImportGraphWalkLaterParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is HostImportGraphWalkLater (no module line in the live file). -/
def liveParseHasHostImportGraphWalkLaterModule : Bool :=
  match liveHostImportGraphWalkLaterParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostImportGraphWalkLater"

/-- Live parse has the living HostImportGraph namespace command. -/
def liveParseHasHostImportGraphNs : Bool :=
  match liveHostImportGraphWalkLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has the HostImportGraph end namespace command. -/
def liveParseHasHostImportGraphEnd : Bool :=
  match liveHostImportGraphWalkLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse kept one named dotted import. Exact raw, not lastSeg prefix. -/
def liveParseHasImportNamed (nm : String) : Bool :=
  match liveHostImportGraphWalkLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- The one dotted import kept. -/
def liveParseHasModelImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostImportGraphModel"

/-- Skip-head: def checkImportOrderEdgesLater is local in
    HostImportGraphWalkLater.lean. Token walk still sees the def even if
    the IO body skip-folds. Do not require stageId or hostId. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostImportGraphWalkLaterParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostImportGraphWalkLaterSource)
    toksHaveDefNamed liveHostImportGraphWalkLaterSkipFuel toks "checkImportOrderEdgesLater"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostImportGraphWalkLaterReady,
    PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER,
    HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK-LATER.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostImportGraphWalkLaterReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_WALK_LATER_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK-LATER")
    && (parseId == "PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER")
    && (liveHostImportGraphWalkLaterRel
      == "src/systems/SystemsLean/HostImportGraphWalkLater.lean")
    && (liveRel == "HostImportGraphWalkLater.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostImportGraphWalkLaterFullHost
    && !hostFrontLiveHostImportGraphWalkLaterResidualFreeClaimed
    && !hostFrontLiveHostImportGraphWalkLaterProvablyUnlocked
    && !hostFrontLiveHostImportGraphWalkLaterOwnsPackageTypecheck
    && kernelCheckLiveHostImportGraphWalkLaterSource liveHostImportGraphWalkLaterSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostImportGraphWalkLaterModule
    && liveParseHasHostImportGraphNs
    && liveParseHasHostImportGraphEnd
    && liveParseHasModelImport
    && liveParseHasCoreDefs

/-- Empty source rejects. An empty command list is not an accept. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostImportGraphWalkLaterSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostImportGraphWalkLater (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER =="
  IO.println s!"  host={hostId} file={liveHostImportGraphWalkLaterRel} liveRel={liveRel}"
  let path := root / liveHostImportGraphWalkLaterRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostImportGraphWalkLaterRel}"
    throw (IO.userError s!"missing {liveHostImportGraphWalkLaterRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostImportGraphWalkLaterSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphWalkLater.lean != liveHostImportGraphWalkLaterSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphWalkLater.lean")
  let r := parseLiveHostImportGraphWalkLaterSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphWalkLater parse false"
      throw (IO.userError "kernelCheck live HostImportGraphWalkLater parse false")
    unless hostFrontLiveHostImportGraphWalkLaterReady do
      IO.eprintln "error: hostFrontLiveHostImportGraphWalkLaterReady false"
      throw (IO.userError "hostFrontLiveHostImportGraphWalkLaterReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphWalkLater.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostImportGraphWalkLater root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostImportGraphWalkLater
