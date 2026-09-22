/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostImportGraphTheorems.lean only.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap
  (liveRel is HostImportGraph.lean). Do not steal HostImportGraphSeeds wrap.
  Unique needles use trailing newline so HostFrontLiveHostImportGraphTheorems
  is not a prefix of mill wrap HostFrontLiveHostImportGraphMain, and so
  HostFrontLiveHostImportGraph extra wrap is not a prefix of this parser.
  THEOREMS is on every wrap id.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostImportGraphWalk wrap. Not HostPackageWriteTheorems wrap.

  Spec (readable):
  - parseLiveHostImportGraphTheoremsSource turns live
    HostImportGraphTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphTheorems even without a
    module line.
  - kernelCheckLiveHostImportGraphTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - This live file has no kernelable String/Bool atom defs. Skip-fold
    comments, open, theorem, example, un-kernelable defs. Keep dotted
    import / namespace / end. Types-style atom bodies if any appear
    (none expected).
  - Living namespace lastSeg is HostImportGraph.
  - Wrap-assigned module lastSeg is HostImportGraphTheorems.
  - End namespace lastSeg is HostImportGraph.
  - One dotted import kept (SystemsLean.HostImportGraphLoadOk).
  - Skip-head via toksHaveTheoremNamed: hostImportGraphLoadOk_true and
    hostImportGraphReady_true (both local theorems).
  - Do not copy ClosePath skip-head toksHaveDefNamed stageId/hostId.
  - Expected command count after skip-fold: 3 (1 import + namespace + end).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not mill HostImportGraphMain wrap. Not HostImportGraph extra wrap.
  - Not HostImportGraphSeeds wrap. Not HostImportGraphWalk wrap.

  Unique needles (trailing newline so HostFrontLiveHostImportGraphTheorems is not a prefix):
  HostFrontLiveHostImportGraphTheorems
  PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostImportGraphTheoremsSource,
  kernelCheckLiveHostImportGraphTheoremsSource,
  hostFrontLiveHostImportGraphTheoremsReady, liveHostImportGraphTheoremsSource,
  liveHostImportGraphTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostImportGraphTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveHostImportGraphTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostImportGraphTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostImportGraphTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphTheoremsRel : String :=
  "src/systems/SystemsLean/HostImportGraphTheorems.lean"

/-- Live basename. Greppable: liveRel. Must be HostImportGraphTheorems.lean. -/
def liveRel : String := "HostImportGraphTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostImportGraphTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostImportGraphTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostImportGraphTheoremsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostImportGraphTheoremsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveHostImportGraphTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostImportGraphTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostImportGraphTheorems comments mention DualResidual and quoted ids.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash keeps
    the next char inside a string. -/
def stripCommentsHigtN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHigtN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHigtN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsHigtN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsHigtN n nest false false ('"' :: acc) rest
        else
          stripCommentsHigtN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHigtN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHigtN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHigtN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHigtN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHigtN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHigtN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHigtN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHigtN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostImportGraphTheorems.lean bytes. -/
def stripCommentsHigt (src : String) : String :=
  String.ofList (stripCommentsHigtN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostImportGraphTheorems`. -/
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
def cmdAddsHostImportGraphTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownHostImportGraphTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphTheoremsParseFuel body
        && termNoAppN liveHostImportGraphTheoremsParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphTheoremsParseFuel body
        && termNoAppN liveHostImportGraphTheoremsParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostImportGraphTheorems (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostImportGraphTheoremsSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostImportGraphTheorems (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostImportGraphTheorems fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. Keep dotted import / namespace / end. -/
def parseCmdsHostImportGraphTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostImportGraphTheorems liveHostImportGraphTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostImportGraphTheoremsSkipFuel rest
      if cmdBodyKnownHostImportGraphTheorems kn c then
        parseCmdsHostImportGraphTheorems n rest2
          (kn ++ cmdAddsHostImportGraphTheorems c) (acc ++ [c])
      else
        parseCmdsHostImportGraphTheorems n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostImportGraphTheoremsSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostImportGraphTheorems n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live HostImportGraphTheorems.lean text.
    Greppable: parseLiveHostImportGraphTheoremsSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS. -/
def parseLiveHostImportGraphTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHigt src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostImportGraphTheorems liveHostImportGraphTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostImportGraphTheoremsSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS. -/
def kernelCheckLiveHostImportGraphTheoremsSource (src : String) : Bool :=
  match parseLiveHostImportGraphTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostImportGraphTheoremsParsed? : Option Module :=
  match parseLiveHostImportGraphTheoremsSource liveHostImportGraphTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostImportGraphTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (1 dotted import + namespace + end).
    Real bound from this parse, not hardcoded true. Horizon expected
    cmds=3. Do not copy HostImportGraph cmds=11, Seeds cmds=32,
    mill-Main cmds=1, or JoinMapTheorems >=13. -/
def liveParseCmdCountOk : Bool :=
  match liveHostImportGraphTheoremsParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is HostImportGraphTheorems (no module line in the live file). -/
def liveParseHasHostImportGraphTheoremsModule : Bool :=
  match liveHostImportGraphTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostImportGraphTheorems"

/-- Live parse has the living HostImportGraph namespace command. -/
def liveParseHasHostImportGraphNs : Bool :=
  match liveHostImportGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has the HostImportGraph end namespace command. -/
def liveParseHasHostImportGraphEnd : Bool :=
  match liveHostImportGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse kept one named dotted import. Exact raw, not lastSeg prefix. -/
def liveParseHasImportNamed (nm : String) : Bool :=
  match liveHostImportGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- One dotted import kept. -/
def liveParseHasLoadOkImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostImportGraphLoadOk"

/-- Skip-head: theorems unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match liveHostImportGraphTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHigt liveHostImportGraphTheoremsSource)
    toksHaveTheoremNamed liveHostImportGraphTheoremsSkipFuel toks
      "hostImportGraphLoadOk_true"
      && toksHaveTheoremNamed liveHostImportGraphTheoremsSkipFuel toks
        "hostImportGraphReady_true"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostImportGraphTheoremsReady,
    PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS,
    HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostImportGraphTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS")
    && (liveHostImportGraphTheoremsRel
      == "src/systems/SystemsLean/HostImportGraphTheorems.lean")
    && (liveRel == "HostImportGraphTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostImportGraphTheoremsFullHost
    && !hostFrontLiveHostImportGraphTheoremsResidualFreeClaimed
    && !hostFrontLiveHostImportGraphTheoremsProvablyUnlocked
    && !hostFrontLiveHostImportGraphTheoremsOwnsPackageTypecheck
    && kernelCheckLiveHostImportGraphTheoremsSource liveHostImportGraphTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostImportGraphTheoremsModule
    && liveParseHasHostImportGraphNs
    && liveParseHasHostImportGraphEnd
    && liveParseHasLoadOkImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostImportGraphTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostImportGraphTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostImportGraphTheoremsRel} liveRel={liveRel}"
  let path := root / liveHostImportGraphTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostImportGraphTheoremsRel}"
    throw (IO.userError s!"missing {liveHostImportGraphTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostImportGraphTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphTheorems.lean != liveHostImportGraphTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphTheorems.lean")
  let r := parseLiveHostImportGraphTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphTheorems parse false"
      throw (IO.userError "kernelCheck live HostImportGraphTheorems parse false")
    unless hostFrontLiveHostImportGraphTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostImportGraphTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostImportGraphTheoremsReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphTheorems.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostImportGraphTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostImportGraphTheorems
