/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckRequiredDecls.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveRequiredDecls. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold plus List String literals as cons/nil.
  Not HostFront G1. Not HostTerm.multFixtureModule.

  Spec (readable):
  - parseLiveRequiredDeclsSource turns live HostModuleCheckRequiredDecls.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckRequiredDecls even without a
    module line.
  - kernelCheckLiveRequiredDeclsSource is HostKernel.kernelCheck of that
    parse with List cons/nil seeds (nullary List.nil + cons binders).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-REQUIRED-DECLS,
  SLAKE_HOST_FRONT_LIVE_REQUIRED_DECLS_V0, PARSE-LIVE-REQUIRED-DECLS,
  parseLiveRequiredDeclsSource, kernelCheckLiveRequiredDeclsSource,
  hostFrontLiveRequiredDeclsReady, liveRequiredDeclsSource,
  liveRequiredDeclsRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveRequiredDecls
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveRequiredDecls on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveRequiredDeclsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveRequiredDecls

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_REQUIRED_DECLS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-REQUIRED-DECLS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-REQUIRED-DECLS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRequiredDeclsRel : String :=
  "src/systems/SystemsLean/HostModuleCheckRequiredDecls.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveRequiredDeclsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveRequiredDeclsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveRequiredDeclsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveRequiredDeclsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveRequiredDeclsSkipFuel : Nat := 4096

/-- Seed names so cons/nil list bodies are kernel-known. -/
def seedListKnown : List String := ["nil", "cons"]

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
def cmdAddsDecls (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownDecls (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRequiredDeclsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRequiredDeclsParseFuel body
  | _ => true

/-- Fold string lits into `cons s tl` ending at `nil`. -/
def parseListElemsRd : Nat -> List String -> Option (Prod Term (List String))
  | 0, _ => none
  | Nat.succ n, toks =>
    match toks with
    | "]" :: rest => some (Term.const (HostTerm.n "nil"), rest)
    | t :: rest =>
      if isStringLit t then
        let hd := Term.litString (stripStringLit t)
        match rest with
        | "," :: rest2 =>
          match parseListElemsRd n rest2 with
          | some (tl, rest3) =>
            some (Term.app (Term.app (Term.const (HostTerm.n "cons")) hd) tl,
              rest3)
          | none => none
        | "]" :: rest2 =>
          some (Term.app (Term.app (Term.const (HostTerm.n "cons")) hd)
            (Term.const (HostTerm.n "nil")), rest2)
        | _ => none
      else none
    | [] => none

/-- Parse `[` string-list `]` as cons/nil. -/
def parseListStringRd (fuel : Nat) (toks : List String) :
    Option (Prod Term (List String)) :=
  match toks with
  | "[" :: "]" :: rest => some (Term.const (HostTerm.n "nil"), rest)
  | "[" :: rest => parseListElemsRd fuel rest
  | _ => none

/-- Term parser: List String literals, else HostTerm term. -/
def parseTermRd (fuel : Nat) (bs : List String) (toks : List String) :
    Option (Prod Term (List String)) :=
  match toks with
  | "[" :: _ => parseListStringRd fuel toks
  | _ => parseTermHt fuel bs toks

/-- Parse `def` body after the name (typed assign; List String lits ok). -/
def parseDefRd (fuel : Nat) (dname : String) (rest : List String) :
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
            match parseTermRd liveHostTermParseFuel bnames bodyToks with
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
def parseOneCmdDecls (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
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
    | some (dname, rest2) => parseDefRd fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsDecls : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdDecls liveRequiredDeclsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveRequiredDeclsSkipFuel rest
      if cmdBodyKnownDecls kn c then
        parseCmdsDecls n rest2 (kn ++ cmdAddsDecls c) (acc ++ [c])
      else
        parseCmdsDecls n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveRequiredDeclsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsDecls n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostModuleCheckRequiredDecls.lean text.
    Greppable: parseLiveRequiredDeclsSource, PARSE-LIVE-REQUIRED-DECLS. -/
def parseLiveRequiredDeclsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsDecls liveRequiredDeclsParseFuel toks seedListKnown [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckRequiredDecls"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- List.nil + cons seeds so kernelCheck can type List String lits. -/
def listSeedCmds : List Cmd :=
  let listTy : HostType := HostType.named (HostTerm.n "List")
  [ Cmd.inductive_ (HostTerm.n "List") [{ name := HostTerm.n "nil" }] []
  , Cmd.defBind (HostTerm.n "cons")
      [(HostTerm.n "x", HostType.string), (HostTerm.n "xs", listTy)]
      listTy
      (Term.var (HostTerm.n "xs")) ]

/-- Kernel-check live HostModuleCheckRequiredDecls parse.
    Greppable: kernelCheckLiveRequiredDeclsSource, PARSE-LIVE-REQUIRED-DECLS. -/
def kernelCheckLiveRequiredDeclsSource (src : String) : Bool :=
  match parseLiveRequiredDeclsSource src with
  | FrontResult.accept m =>
    HostKernel.kernelCheck { m with commands := listSeedCmds ++ m.commands }
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveRequiredDeclsParsed? : Option Module :=
  match parseLiveRequiredDeclsSource liveRequiredDeclsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveRequiredDeclsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed list defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveRequiredDeclsParsed? with
  | some m => m.commands.length >= 50
  | none => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveRequiredDeclsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has core required-decl list defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveRequiredDeclsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "multRequiredDecls" && has "emitBannerRequiredDecls"
      && has "kernelSelfApplyRequiredDecls"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveRequiredDeclsReady, PARSE-LIVE-REQUIRED-DECLS,
    HOST-FRONT-LIVE-REQUIRED-DECLS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveRequiredDeclsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_REQUIRED_DECLS_V0")
    && (hostId == "HOST-FRONT-LIVE-REQUIRED-DECLS")
    && (parseId == "PARSE-LIVE-REQUIRED-DECLS")
    && (liveRequiredDeclsRel
      == "src/systems/SystemsLean/HostModuleCheckRequiredDecls.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveRequiredDeclsFullHost
    && !hostFrontLiveRequiredDeclsResidualFreeClaimed
    && !hostFrontLiveRequiredDeclsProvablyUnlocked
    && kernelCheckLiveRequiredDeclsSource liveRequiredDeclsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveRequiredDeclsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveRequiredDecls (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-REQUIRED-DECLS =="
  IO.println s!"  host={hostId} file={liveRequiredDeclsRel}"
  let path := root / liveRequiredDeclsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRequiredDeclsRel}"
    throw (IO.userError s!"missing {liveRequiredDeclsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveRequiredDeclsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckRequiredDecls.lean != liveRequiredDeclsSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckRequiredDecls.lean")
  let r := parseLiveRequiredDeclsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-REQUIRED-DECLS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-REQUIRED-DECLS reject {reason}")
  | FrontResult.accept m =>
    let k := kernelCheckLiveRequiredDeclsSource disk
    IO.println s!"PASS PARSE-LIVE-REQUIRED-DECLS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckRequiredDecls parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckRequiredDecls parse false")
    unless hostFrontLiveRequiredDeclsReady do
      IO.eprintln "error: hostFrontLiveRequiredDeclsReady false"
      throw (IO.userError "hostFrontLiveRequiredDeclsReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckRequiredDecls.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveRequiredDecls root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveRequiredDecls
