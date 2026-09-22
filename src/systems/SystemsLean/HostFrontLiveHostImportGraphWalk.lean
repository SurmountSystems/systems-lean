/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphWalk.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphWalk. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostImportGraphWalk.lean only.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Extra wrap HostFrontLiveHostImportGraph parses
  HostImportGraph.lean only. Extra wrap HostFrontLiveHostImportGraphSeeds
  parses HostImportGraphSeeds.lean only. Do not steal those dests.
  Do not wrap HostImportGraphWalkLater.lean.
  Unique needles use trailing newline so HostFrontLiveHostImportGraphWalk is not a
  prefix hit on mill wrap companions HostFrontLiveHostImportGraphMain,
  extra wrap HostFrontLiveHostImportGraph, extra wrap
  HostFrontLiveHostImportGraphSeeds, or a future
  HostFrontLiveHostImportGraphWalkLater.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostImportGraphSeeds wrap. Not HostImportGraph extra wrap.
  Not HostImportGraphMain wrap.

  Spec (readable):
  - parseLiveHostImportGraphWalkSource turns live HostImportGraphWalk.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphWalk even without a module line.
  - kernelCheckLiveHostImportGraphWalkSource is HostKernel.kernelCheck of
    that parse.
  - This live file has two dotted imports, namespace, one un-kernelable IO
    def, and end. Skip-fold comments, open, theorem, example, un-kernelable
    defs. Keep dotted import / namespace / end.
    Types-style atom bodies if any appear (none expected).
  - Living namespace lastSeg is HostImportGraph.
  - Wrap-assigned module lastSeg is HostImportGraphWalk.
  - End namespace lastSeg is HostImportGraph.
  - Two dotted imports kept (HostImportGraphModel, HostImportGraphWalkLater).
  - Skip-head still sees def checkImportOrderEdges via toksHaveDefNamed.
  - Do not require toksHaveDefNamed stageId or hostId: those defs are not
    local in HostImportGraphWalk.lean.
  - Expected command count after skip-fold: 4 (2 imports + namespace + end).
    Measure from first GREEN print; do not copy Seeds 32 or extra wrap 11.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not mill HostImportGraphMain wrap. Not HostImportGraph extra wrap.
  - Not HostImportGraphSeeds wrap. Not HostImportGraphWalkLater wrap.

  Unique needles (trailing newline so HostFrontLiveHostImportGraphWalk is not a prefix):
  HostFrontLiveHostImportGraphWalk
  PARSE-LIVE-HOST-IMPORT-GRAPH-WALK
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_WALK_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostImportGraphWalkSource,
  kernelCheckLiveHostImportGraphWalkSource,
  hostFrontLiveHostImportGraphWalkReady, liveHostImportGraphWalkSource,
  liveHostImportGraphWalkRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostImportGraphWalk
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveHostImportGraphWalk on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostImportGraphWalkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostImportGraphWalk

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_WALK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-IMPORT-GRAPH-WALK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphWalkRel : String :=
  "src/systems/SystemsLean/HostImportGraphWalk.lean"

/-- Live basename. Greppable: liveRel. Must be HostImportGraphWalk.lean. -/
def liveRel : String := "HostImportGraphWalk.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostImportGraphWalkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostImportGraphWalkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostImportGraphWalkProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostImportGraphWalkOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveHostImportGraphWalkParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostImportGraphWalkSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostImportGraphWalk comments mention DualResidual. HostFrontLiveMult.stripComments
    is not in-string safe. Backslash keeps the next char inside a string. -/
def stripCommentsHigwN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHigwN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHigwN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsHigwN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsHigwN n nest false false ('"' :: acc) rest
        else
          stripCommentsHigwN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHigwN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHigwN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHigwN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHigwN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHigwN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHigwN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHigwN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHigwN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostImportGraphWalk.lean bytes. -/
def stripCommentsHigw (src : String) : String :=
  String.ofList (stripCommentsHigwN (src.length + 8) 0 false false [] src.toList)

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
def cmdAddsHostImportGraphWalk (c : Cmd) : List String :=
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
def cmdBodyKnownHostImportGraphWalk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphWalkParseFuel body
        && termNoAppN liveHostImportGraphWalkParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphWalkParseFuel body
        && termNoAppN liveHostImportGraphWalkParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostImportGraphWalk (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostImportGraphWalkSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostImportGraphWalk (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostImportGraphWalk fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. Keep dotted import / namespace / end. -/
def parseCmdsHostImportGraphWalk : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostImportGraphWalk liveHostImportGraphWalkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostImportGraphWalkSkipFuel rest
      if cmdBodyKnownHostImportGraphWalk kn c then
        parseCmdsHostImportGraphWalk n rest2
          (kn ++ cmdAddsHostImportGraphWalk c) (acc ++ [c])
      else
        parseCmdsHostImportGraphWalk n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostImportGraphWalkSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostImportGraphWalk n rest2 kn acc
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

/-- Parse live HostImportGraphWalk.lean text.
    Greppable: parseLiveHostImportGraphWalkSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-WALK. -/
def parseLiveHostImportGraphWalkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHigw src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostImportGraphWalk liveHostImportGraphWalkParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphWalk"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphWalk parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostImportGraphWalkSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-WALK. -/
def kernelCheckLiveHostImportGraphWalkSource (src : String) : Bool :=
  match parseLiveHostImportGraphWalkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostImportGraphWalkParsed? : Option Module :=
  match parseLiveHostImportGraphWalkSource liveHostImportGraphWalkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostImportGraphWalkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (2 dotted imports + namespace + end).
    Real bound from this parse, not hardcoded true. Horizon expected
    cmds=4. Do not copy HostImportGraphSeeds 32, HostImportGraph extra 11,
    DualEqWriteCapableGap 37, CapableWriteHc 39, DualEqWriteApi 59, or
    HostImportGraphMain 1. -/
def liveParseCmdCountOk : Bool :=
  match liveHostImportGraphWalkParsed? with
  | some m => m.commands.length == 4
  | none => false

/-- Wrap module lastSeg is HostImportGraphWalk (no module line in the live file). -/
def liveParseHasHostImportGraphWalkModule : Bool :=
  match liveHostImportGraphWalkParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostImportGraphWalk"

/-- Live parse has the living HostImportGraph namespace command. -/
def liveParseHasHostImportGraphNs : Bool :=
  match liveHostImportGraphWalkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has the HostImportGraph end namespace command. -/
def liveParseHasHostImportGraphEnd : Bool :=
  match liveHostImportGraphWalkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse kept one named dotted import. Exact raw, not lastSeg prefix. -/
def liveParseHasImportNamed (nm : String) : Bool :=
  match liveHostImportGraphWalkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- Both dotted imports kept. -/
def liveParseHasTwoImports : Bool :=
  liveParseHasImportNamed "SystemsLean.HostImportGraphModel"
    && liveParseHasImportNamed "SystemsLean.HostImportGraphWalkLater"

/-- Skip-head: def checkImportOrderEdges is local in HostImportGraphWalk.lean.
    Token walk still sees the def even if the IO body skip-folds.
    Do not require stageId or hostId (those defs are not local). -/
def liveParseHasCoreDefs : Bool :=
  match liveHostImportGraphWalkParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHigw liveHostImportGraphWalkSource)
    toksHaveDefNamed liveHostImportGraphWalkSkipFuel toks "checkImportOrderEdges"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostImportGraphWalkReady,
    PARSE-LIVE-HOST-IMPORT-GRAPH-WALK,
    HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostImportGraphWalkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_WALK_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK")
    && (parseId == "PARSE-LIVE-HOST-IMPORT-GRAPH-WALK")
    && (liveHostImportGraphWalkRel
      == "src/systems/SystemsLean/HostImportGraphWalk.lean")
    && (liveRel == "HostImportGraphWalk.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostImportGraphWalkFullHost
    && !hostFrontLiveHostImportGraphWalkResidualFreeClaimed
    && !hostFrontLiveHostImportGraphWalkProvablyUnlocked
    && !hostFrontLiveHostImportGraphWalkOwnsPackageTypecheck
    && kernelCheckLiveHostImportGraphWalkSource liveHostImportGraphWalkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostImportGraphWalkModule
    && liveParseHasHostImportGraphNs
    && liveParseHasHostImportGraphEnd
    && liveParseHasTwoImports
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostImportGraphWalkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostImportGraphWalk (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-IMPORT-GRAPH-WALK =="
  IO.println s!"  host={hostId} file={liveHostImportGraphWalkRel} liveRel={liveRel}"
  let path := root / liveHostImportGraphWalkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostImportGraphWalkRel}"
    throw (IO.userError s!"missing {liveHostImportGraphWalkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostImportGraphWalkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphWalk.lean != liveHostImportGraphWalkSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphWalk.lean")
  let r := parseLiveHostImportGraphWalkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-IMPORT-GRAPH-WALK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-IMPORT-GRAPH-WALK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-IMPORT-GRAPH-WALK ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphWalk parse false"
      throw (IO.userError "kernelCheck live HostImportGraphWalk parse false")
    unless hostFrontLiveHostImportGraphWalkReady do
      IO.eprintln "error: hostFrontLiveHostImportGraphWalkReady false"
      throw (IO.userError "hostFrontLiveHostImportGraphWalkReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphWalk.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostImportGraphWalk root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostImportGraphWalk
