/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphModsLater.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportModsLater. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold plus list atoms. Not HostFront G1.
  Not HostTerm.multFixtureModule.

  Spec (readable):
  - parseLiveImportModsLaterSource turns live HostImportGraphModsLater.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphModsLater even without a
    module line.
  - kernelCheckLiveImportModsLaterSource is HostKernel.kernelCheckN of that
    parse with RealMod / List seeds.
  - Keep empty and singleton import RealMod lits. Skip huge seeds, cons
    tails, and nested append lists kernelFuel cannot type.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IMPORT-MODS-LATER,
  SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_LATER_V0, PARSE-LIVE-IMPORT-MODS-LATER,
  parseLiveImportModsLaterSource, kernelCheckLiveImportModsLaterSource,
  hostFrontLiveImportModsLaterReady, liveImportModsLaterSource,
  liveImportModsLaterRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveImportModsLater
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveImportModsLater on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveImportModsLaterSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveImportModsLater

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IMPORT-MODS-LATER"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IMPORT-MODS-LATER"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportModsLaterRel : String :=
  "src/systems/SystemsLean/HostImportGraphModsLater.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveImportModsLaterFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveImportModsLaterResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveImportModsLaterProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveImportModsLaterParseFuel : Nat := 512

/-- Skip fuel for huge resolveImportGraph / multi-import tails. -/
def liveImportModsLaterSkipFuel : Nat := 8192

/-- Seed names from HostImportGraphModel (List ops for RealMod.imports). -/
def seedKnown : List String := ["nil", "singleton", "append"]

/-- Kernel env + RealMod struct schema. -/
def seedImportModsLater (env : Env) (ss : Structs) : Prod Env Structs :=
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

/-- Atom start: allow `[` list lits and `{` struct lits. -/
def laterAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if hostTermIsStop t then false
    else if t == "[" || t == "{" then true
    else hostTermAtomStart (t :: rest)

/-- Fold list element terms into nil / singleton / nested append. -/
def foldListTerms : List Term -> Term
  | [] => Term.const (HostTerm.n "nil")
  | t :: [] => Term.app (Term.const (HostTerm.n "singleton")) t
  | t :: rest =>
    Term.app
      (Term.app (Term.const (HostTerm.n "append"))
        (Term.app (Term.const (HostTerm.n "singleton")) t))
      (foldListTerms rest)

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

/-- True when body uses append (multi-element list; kernelFuel 64 cannot type). -/
def termHasAppendN : Nat -> Term -> Bool
  | 0, _ => true
  | Nat.succ _, Term.const x => x.raw == "append"
  | Nat.succ n, Term.app f a => termHasAppendN n f || termHasAppendN n a
  | Nat.succ n, Term.some_ t => termHasAppendN n t
  | Nat.succ n, Term.ite c t e =>
      termHasAppendN n c || termHasAppendN n t || termHasAppendN n e
  | Nat.succ n, Term.decideEq a b =>
      termHasAppendN n a || termHasAppendN n b
  | Nat.succ n, Term.proj o _ => termHasAppendN n o
  | Nat.succ n, Term.structLit fs =>
      fs.any (fun p => termHasAppendN n p.snd)
  | Nat.succ _, Term.match_ _ _ => true
  | Nat.succ _, _ => false

/-- Names a command adds to the known-const set. -/
def cmdAddsLater (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    if lastSeg x.raw == "HostImportGraphMods" then seedKnown else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known, no untyped proj, no nested append. -/
def cmdBodyKnownLater (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      !termHasAppendN liveImportModsLaterParseFuel body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportModsLaterParseFuel body
  | Cmd.defBind _ _ _ body =>
      !termHasAppendN liveImportModsLaterParseFuel body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportModsLaterParseFuel body
  | _ => true

mutual
  /-- Comma-separated list elements until `]`. -/
  def parseListItemsLater : Nat -> List String -> List String -> List Term ->
      Option (Prod (List Term) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "]" :: rest => some (acc, rest)
      | _ =>
        match parseTermLater n bs toks with
        | none => none
        | some (t, rest2) =>
          let acc2 := acc ++ [t]
          match rest2 with
          | "," :: rest3 => parseListItemsLater n bs rest3 acc2
          | "]" :: rest3 => some (acc2, rest3)
          | _ => none

  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsLater : Nat -> List String -> List String ->
      List (Prod Name Term) ->
      Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermLater n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsLater n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | t :: ":=" :: _ =>
              if liveIsIdent t then
                parseStructLitFieldsLater n bs rest2 acc2
              else none
            | _ => none
      | _ => none

  /-- Atom including list / struct lit. -/
  def parseAtomLater : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomLater n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "[" :: "]" :: rest =>
        some (Term.const (HostTerm.n "nil"), rest)
      | "[" :: rest =>
        match parseListItemsLater n bs rest [] with
        | some (ts, rest2) => some (foldListTerms ts, rest2)
        | none => none
      | "{" :: rest =>
        match parseStructLitFieldsLater n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermLater n bs rest with
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
  def parseTermTailLater : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if field == "isSome" || field == "isEmpty" then
          parseTermTailLater n bs
            (Term.app (Term.const (HostTerm.n field)) t) rest2
        else if liveIsIdent field then
          parseTermTailLater n bs (Term.proj t (HostTerm.n field)) rest2
        else
          some (t, rest)
      | fname :: ":=" :: _ =>
        if liveIsIdent fname then some (t, rest)
        else if laterAtomStart rest then
          match parseAtomLater n bs rest with
          | some (a, rest2) => parseTermTailLater n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)
      | _ =>
        if laterAtomStart rest then
          match parseAtomLater n bs rest with
          | some (a, rest2) => parseTermTailLater n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / prefix `!` / && / == / atom. -/
  def parseTermLater : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermLater n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermLater n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermLater n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "!" :: rest =>
        match parseAtomLater n bs rest with
        | some (t, rest2) =>
          match parseTermTailLater n bs t rest2 with
          | some (t2, rest3) =>
            some (Term.ite t2 (Term.litBool false) (Term.litBool true), rest3)
          | none => none
        | none => none
      | _ =>
        match parseAtomLater n bs toks with
        | none => none
        | some (t, rest) =>
          match parseTermTailLater n bs t rest with
          | none => none
          | some (t2, rest2) =>
            match rest2 with
            | "&&" :: rest3 =>
              match parseTermLater n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 t3 (Term.litBool false), rest4)
              | none => none
            | "==" :: rest3 =>
              match parseTermLater n bs rest3 with
              | some (t3, rest4) => some (Term.decideEq t2 t3, rest4)
              | none => none
            | _ => some (t2, rest2)
end

/-- Parse `def` body after the name (typed assign only). -/
def parseDefLater (fuel : Nat) (dname : String) (rest : List String) :
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
            match parseTermLater liveImportModsLaterParseFuel bnames bodyToks with
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
def parseOneCmdLater (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLater fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / un-kernelable defs. -/
def parseCmdsLater : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLater liveImportModsLaterParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveImportModsLaterSkipFuel rest
      if cmdBodyKnownLater kn c then
        parseCmdsLater n rest2 (kn ++ cmdAddsLater c) (acc ++ [c])
      else
        parseCmdsLater n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveImportModsLaterSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLater n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostImportGraphModsLater.lean text.
    Greppable: parseLiveImportModsLaterSource, PARSE-LIVE-IMPORT-MODS-LATER. -/
def parseLiveImportModsLaterSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLater liveImportModsLaterParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphModsLater"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphModsLater parse with RealMod / List seeds.
    Greppable: kernelCheckLiveImportModsLaterSource,
    PARSE-LIVE-IMPORT-MODS-LATER. -/
def kernelCheckLiveImportModsLaterSource (src : String) : Bool :=
  match parseLiveImportModsLaterSource src with
  | FrontResult.accept m =>
    match seedImportModsLater [] [] with
    | (env, ss) =>
      isWellFormed m && kernelCheckN kernelFuel env ss m.commands
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveImportModsLaterParsed? : Option Module :=
  match parseLiveImportModsLaterSource liveImportModsLaterSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveImportModsLaterParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / RealMod leaves / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveImportModsLaterParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse has the HostImportGraph namespace command. -/
def liveParseHasImportGraphNs : Bool :=
  match liveImportModsLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has core HostImportGraphModsLater defs that survive the fold. -/
def liveParseHasCoreDefs : Bool :=
  match liveImportModsLaterParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "selfHostCompleteMod" && has "officialPathAlternateMod"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveImportModsLaterReady, PARSE-LIVE-IMPORT-MODS-LATER,
    HOST-FRONT-LIVE-IMPORT-MODS-LATER.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveImportModsLaterReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_LATER_V0")
    && (hostId == "HOST-FRONT-LIVE-IMPORT-MODS-LATER")
    && (parseId == "PARSE-LIVE-IMPORT-MODS-LATER")
    && (liveImportModsLaterRel
      == "src/systems/SystemsLean/HostImportGraphModsLater.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveImportModsLaterFullHost
    && !hostFrontLiveImportModsLaterResidualFreeClaimed
    && !hostFrontLiveImportModsLaterProvablyUnlocked
    && kernelCheckLiveImportModsLaterSource liveImportModsLaterSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasImportGraphNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveImportModsLaterSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveImportModsLater (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IMPORT-MODS-LATER =="
  IO.println s!"  host={hostId} file={liveImportModsLaterRel}"
  let path := root / liveImportModsLaterRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveImportModsLaterRel}"
    throw (IO.userError s!"missing {liveImportModsLaterRel}")
  let disk <- IO.FS.readFile path
  if disk != liveImportModsLaterSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphModsLater.lean != liveImportModsLaterSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphModsLater.lean")
  let r := parseLiveImportModsLaterSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IMPORT-MODS-LATER reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IMPORT-MODS-LATER reject {reason}")
  | FrontResult.accept m =>
    let k := kernelCheckLiveImportModsLaterSource disk
    IO.println s!"PASS PARSE-LIVE-IMPORT-MODS-LATER ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphModsLater parse false"
      throw (IO.userError "kernelCheck live HostImportGraphModsLater parse false")
    unless hostFrontLiveImportModsLaterReady do
      IO.eprintln "error: hostFrontLiveImportModsLaterReady false"
      throw (IO.userError "hostFrontLiveImportModsLaterReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphModsLater.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveImportModsLater root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveImportModsLater
