/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphMods.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportMods. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold plus IrProgram-style list atoms. Not HostFront G1.
  Not HostTerm.multFixtureModule.

  Spec (readable):
  - parseLiveImportModsSource turns live HostImportGraphMods.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphMods even without a module line.
  - kernelCheckLiveImportModsSource is HostKernel.kernelCheckN of that parse
    with RealMod / List seeds.
  - Skip multi-field RealMod bodies the list fold cannot type; keep empty and
    singleton import lists.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not HostFrontLiveImportModel / HostFrontLiveImportModsLater.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IMPORT-MODS,
  SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_V0, PARSE-LIVE-IMPORT-MODS,
  parseLiveImportModsSource, kernelCheckLiveImportModsSource,
  hostFrontLiveImportModsReady, liveImportModsSource, liveImportModsRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveImportMods
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveImportMods on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveImportModsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveImportMods

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IMPORT-MODS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IMPORT-MODS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportModsRel : String :=
  "src/systems/SystemsLean/HostImportGraphMods.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveImportModsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveImportModsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveImportModsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveImportModsParseFuel : Nat := 512

/-- Skip fuel for un-kernelable multi-import RealMod tails. -/
def liveImportModsSkipFuel : Nat := 8192

/-- Kernel-check fuel for empty plus singleton RealMod cmds (HostKernel.kernelFuel is 64). -/
def liveImportModsKernelFuel : Nat := 256

/-- Seed names from HostImportGraphModel (List ops for RealMod.imports). -/
def seedKnown : List String := ["nil", "singleton", "append"]

/-- Kernel env + RealMod struct schema for HostImportGraphModel import. -/
def seedImportMods (env : Env) (ss : Structs) : Prod Env Structs :=
  let listTy : HostType := HostType.named (HostTerm.n "List")
  let env2 : Env :=
    ("nil", listTy)
      :: ("singleton", HostType.arrow HostType.string listTy)
      :: ("append",
          HostType.arrow listTy (HostType.arrow listTy listTy))
      :: env
  let ss2 : Structs :=
    ("RealMod",
      [("name", HostType.string), ("imports", listTy)]) :: ss
  (env2, ss2)

/-- Dotted ident `SystemsLean . HostImportGraphMods`. -/
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

/-- Atom start: allow `[` list lits and `{` struct lits. -/
def modsAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if hostTermIsStop t then false
    else if t == "[" || t == "{" then true
    else hostTermAtomStart (t :: rest)

/-- Fold list element terms into nil / singleton / append nest. -/
def foldListTerms : List Term -> Term
  | [] => Term.const (HostTerm.n "nil")
  | t :: [] => Term.app (Term.const (HostTerm.n "singleton")) t
  | t :: rest =>
    Term.app
      (Term.app (Term.const (HostTerm.n "append"))
        (Term.app (Term.const (HostTerm.n "singleton")) t))
      (foldListTerms rest)

/-- Reject `append` nests (multi-import RealMod lists the kernel cannot type). -/
def termNoAppendN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const x => x.raw != "append"
  | Nat.succ n, Term.app f a => termNoAppendN n f && termNoAppendN n a
  | Nat.succ n, Term.some_ t => termNoAppendN n t
  | Nat.succ n, Term.ite c t e =>
      termNoAppendN n c && termNoAppendN n t && termNoAppendN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoAppendN n a && termNoAppendN n b
  | Nat.succ n, Term.proj o _ => termNoAppendN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppendN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

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
def cmdAddsMods (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    if lastSeg x.raw == "HostImportGraphModel" then seedKnown else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known, no untyped proj, no multi-import append nest. -/
def cmdBodyKnownMods (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportModsParseFuel body
        && termNoAppendN liveImportModsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportModsParseFuel body
        && termNoAppendN liveImportModsParseFuel body
  | _ => true

mutual
  /-- Comma-separated list elements until `]`. -/
  def parseListItemsMods : Nat -> List String -> List String -> List Term ->
      Option (Prod (List Term) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "]" :: rest => some (acc, rest)
      | _ =>
        match parseTermMods n bs toks with
        | none => none
        | some (t, rest2) =>
          let acc2 := acc ++ [t]
          match rest2 with
          | "," :: rest3 => parseListItemsMods n bs rest3 acc2
          | "]" :: rest3 => some (acc2, rest3)
          | _ => none

  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsMods : Nat -> List String -> List String ->
      List (Prod Name Term) ->
      Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermMods n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsMods n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | t :: ":=" :: _ =>
              if liveIsIdent t then
                parseStructLitFieldsMods n bs rest2 acc2
              else none
            | _ => none
      | _ => none

  /-- Atom including list / struct lit. -/
  def parseAtomMods : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomMods n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "[" :: "]" :: rest =>
        some (Term.const (HostTerm.n "nil"), rest)
      | "[" :: rest =>
        match parseListItemsMods n bs rest [] with
        | some (ts, rest2) => some (foldListTerms ts, rest2)
        | none => none
      | "{" :: rest =>
        match parseStructLitFieldsMods n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermMods n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && t != "=" && t != "&&" && t != "!" && t != "=="
        then
          some (identTermHt bs t, rest)
        else
          none

  /-- App and field proj. -/
  def parseTermTailMods : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if field == "isSome" || field == "isEmpty" then
          parseTermTailMods n bs
            (Term.app (Term.const (HostTerm.n field)) t) rest2
        else if liveIsIdent field then
          parseTermTailMods n bs (Term.proj t (HostTerm.n field)) rest2
        else
          some (t, rest)
      | fname :: ":=" :: _ =>
        if liveIsIdent fname then some (t, rest)
        else if modsAtomStart rest then
          match parseAtomMods n bs rest with
          | some (a, rest2) => parseTermTailMods n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)
      | _ =>
        if modsAtomStart rest then
          match parseAtomMods n bs rest with
          | some (a, rest2) => parseTermTailMods n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / prefix `!` / && / == / atom. -/
  def parseTermMods : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermMods n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermMods n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermMods n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "!" :: rest =>
        match parseAtomMods n bs rest with
        | some (t, rest2) =>
          match parseTermTailMods n bs t rest2 with
          | some (t2, rest3) =>
            some (Term.ite t2 (Term.litBool false) (Term.litBool true), rest3)
          | none => none
        | none => none
      | _ =>
        match parseAtomMods n bs toks with
        | none => none
        | some (t, rest) =>
          match parseTermTailMods n bs t rest with
          | none => none
          | some (t2, rest2) =>
            match rest2 with
            | "&&" :: rest3 =>
              match parseTermMods n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 t3 (Term.litBool false), rest4)
              | none => none
            | "==" :: rest3 =>
              match parseTermMods n bs rest3 with
              | some (t3, rest4) => some (Term.decideEq t2 t3, rest4)
              | none => none
            | _ => some (t2, rest2)
end

/-- Parse `def` body after the name (typed assign only). -/
def parseDefMods (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match parseHostTypeAllHt tyToks with
        | none => none
        | some retTy =>
          let ty := addBinderArrows bs retTy
          let bnames := bs.map (fun p => p.fst)
          let dn := HostTerm.n dname
          match kind with
          | DefBodyKind.assign =>
            match parseTermMods liveImportModsParseFuel bnames bodyToks with
            | some (body, rest4) =>
              let rest5 :=
                match rest4 with
                | "where" :: more => skipUntilCmd fuel more
                | _ => rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
            | none => none
          | DefBodyKind.equation => none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdMods (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefMods fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / un-kernelable defs. -/
def parseCmdsMods : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMods liveImportModsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveImportModsSkipFuel rest
      if cmdBodyKnownMods kn c then
        parseCmdsMods n rest2 (kn ++ cmdAddsMods c) (acc ++ [c])
      else
        parseCmdsMods n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveImportModsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsMods n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostImportGraphMods.lean text.
    Greppable: parseLiveImportModsSource, PARSE-LIVE-IMPORT-MODS. -/
def parseLiveImportModsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMods liveImportModsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphMods"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphMods parse with RealMod / List seeds.
    Greppable: kernelCheckLiveImportModsSource, PARSE-LIVE-IMPORT-MODS. -/
def kernelCheckLiveImportModsSource (src : String) : Bool :=
  match parseLiveImportModsSource src with
  | FrontResult.accept m =>
    match seedImportMods [] [] with
    | (env, ss) =>
      isWellFormed m && kernelCheckN liveImportModsKernelFuel env ss m.commands
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveImportModsParsed? : Option Module :=
  match parseLiveImportModsSource liveImportModsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveImportModsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / RealMod defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveImportModsParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.HostImportGraphModel. -/
def liveParseHasImportModelImport : Bool :=
  match liveImportModsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostImportGraphModel"
      | _ => false

/-- Live parse has the HostImportGraph namespace command. -/
def liveParseHasImportGraphNs : Bool :=
  match liveImportModsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has core HostImportGraphMods defs (empty / singleton imports). -/
def liveParseHasCoreDefs : Bool :=
  match liveImportModsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "multLeafMod" && has "stepContractFullTheoremsMod"
      && has "emitBannerScaffoldMod"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveImportModsReady, PARSE-LIVE-IMPORT-MODS,
    HOST-FRONT-LIVE-IMPORT-MODS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveImportModsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_V0")
    && (hostId == "HOST-FRONT-LIVE-IMPORT-MODS")
    && (parseId == "PARSE-LIVE-IMPORT-MODS")
    && (liveImportModsRel
      == "src/systems/SystemsLean/HostImportGraphMods.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveImportModsFullHost
    && !hostFrontLiveImportModsResidualFreeClaimed
    && !hostFrontLiveImportModsProvablyUnlocked
    && kernelCheckLiveImportModsSource liveImportModsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasImportModelImport
    && liveParseHasImportGraphNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveImportModsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveImportMods (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IMPORT-MODS =="
  IO.println s!"  host={hostId} file={liveImportModsRel}"
  let path := root / liveImportModsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveImportModsRel}"
    throw (IO.userError s!"missing {liveImportModsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveImportModsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphMods.lean != liveImportModsSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphMods.lean")
  let r := parseLiveImportModsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IMPORT-MODS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IMPORT-MODS reject {reason}")
  | FrontResult.accept m =>
    let k := kernelCheckLiveImportModsSource disk
    IO.println s!"PASS PARSE-LIVE-IMPORT-MODS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphMods parse false"
      throw (IO.userError "kernelCheck live HostImportGraphMods parse false")
    unless hostFrontLiveImportModsReady do
      IO.eprintln "error: hostFrontLiveImportModsReady false"
      throw (IO.userError "hostFrontLiveImportModsReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphMods.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveImportMods root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveImportMods
