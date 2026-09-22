/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitApply.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitApply.lean. It is not EmitApplyScaffold.lean.
  It is not EmitPlan.lean.
  structure Apply and literal applyCap are kept. Theorem, example, open,
  private, struct-lit, and un-kernelable defs are skipped.
  applyFromCompose, applyIsValid, and applyOk stay in the live text
  (token walk). Their bodies are not kernel-checkable (if, app, field proj).
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-APPLY,
  SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_V0,
  PARSE-LIVE-EMIT-APPLY, EMIT-APPLY-THEOREM, liveRel,
  kernelCheckLiveEmitApplySource,
  hostFrontLiveEmitApplyReady.
  Module: SystemsLean.HostFrontLiveEmitApply
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitApplySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitApply

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-APPLY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-APPLY"

/-- Live file basename. -/
def liveRel : String := "EmitApply.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitApplyRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitApplyFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveEmitApplyFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitApplyResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitApplyProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitApplyParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable.
    EmitApply.lean token walk is larger than the LlvmHold file. -/
def liveEmitApplySkipFuel : Nat := 16384

/-- Kept commands: four imports, namespace, applyCap, structure Apply, and end.
    Theorems, examples, opens, private defs, struct lits, and app bodies drop.
    tagMult and tagKind lose slash and percent in the tokenizer, so the
    leftover Nat is an app and is not kept. From EmitApply.lean. -/
def liveEmitApplyKeptCmds : Nat := 8

/-- theorem keyword count after comment strip. EmitApply.lean has 23. -/
def liveEmitApplyTheoremCount : Nat := 23

/-- example keyword count after comment strip. EmitApply.lean has 13. -/
def liveEmitApplyExampleCount : Nat := 13

/-- set_option keyword count. EmitApply.lean has no set_option. -/
def liveEmitApplySetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . EmitApply`. -/
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
def cmdAddsEmitApply (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app and struct lits.
    Apply.failClosed and private IrNode fixtures are struct lits.
    The kernel would reject them unless every field matches a known struct.
    Do not keep them. -/
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
  | Nat.succ _, Term.structLit _ => false
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, no struct lit. -/
def cmdBodyKnownEmitApply (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitApplyParseFuel body
        && termNoAppN liveEmitApplyParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitApplyParseFuel body
        && termNoAppN liveEmitApplyParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here.
    structure Apply is parsed (where + deriving). -/
def parseOneCmdEmitApply (fuel : Nat) (toks : List String) :
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
  | "structure" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseStructFieldDeclsHt fuel rest [] with
      | none => none
      | some (fields, rest2) =>
        if fields.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingHt rest3 with
            | some (der, rest4) =>
              some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields der, rest4)
            | none => none
          | _ =>
            some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields [], rest2)
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem, example, set_option, open, private,
    and un-kernelable defs. private is not isCmdKw. -/
def parseCmdsEmitApply : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitApply liveEmitApplyParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitApplySkipFuel rest
      if cmdBodyKnownEmitApply kn c then
        parseCmdsEmitApply n rest2
          (kn ++ cmdAddsEmitApply c) (acc ++ [c])
      else
        parseCmdsEmitApply n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitApply n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitApplySkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitApply n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live EmitApply.lean text.
    Greppable: parseLiveEmitApplySource,
    PARSE-LIVE-EMIT-APPLY. -/
def parseLiveEmitApplySource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitApply liveEmitApplyParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitApply"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitApply parse. Not a fixture.
    Greppable: kernelCheckLiveEmitApplySource,
    PARSE-LIVE-EMIT-APPLY. -/
def kernelCheckLiveEmitApplySource (src : String) : Bool :=
  match parseLiveEmitApplySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitApplyParsed? : Option Module :=
  match parseLiveEmitApplySource liveEmitApplySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Four imports, namespace, applyCap,
    structure Apply, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitApplyParsed? with
  | some m => m.commands.length == liveEmitApplyKeptCmds
  | none => false

/-- Literal def the kernel must keep: applyCap := 32. -/
def liveParseHasApplyCapDef : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ (Term.litNat 32) => x.raw == "applyCap"
      | _ => false

/-- Wrap module lastSeg is EmitApply (no module line in the live file). -/
def liveParseHasEmitApplyModule : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitApply"
      && lastSeg m.name.raw == "EmitApply"

/-- Live parse has namespace SystemsLean.EmitApply. -/
def liveParseHasEmitApplyNs : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitApply"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitApply. -/
def liveParseHasEmitApplyEnd : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitApply"
      | _ => false

/-- Live parse imports Mult, Types, HostCompose, and EmitApplyScaffold. -/
def liveParseHasEmitApplyImports : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Mult"
      && has "SystemsLean.Types"
      && has "SystemsLean.HostCompose"
      && has "SystemsLean.EmitApplyScaffold"

/-- Live parse has structure Apply and its three inventory fields. -/
def liveParseHasApplyStruct : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "Apply"
          && fields.any (fun f => f.name.raw == "tags")
          && fields.any (fun f => f.name.raw == "count")
          && fields.any (fun f => f.name.raw == "valid")
      | _ => false

/-- Skip-head: applyFromCompose, applyIsValid, and applyOk are defs in the
    live text. Bodies are skipped. Do not require them as kept Cmd.def_. -/
def liveParseHasCoreDefs : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitApplySource)
    toksHaveDefNamed liveEmitApplySkipFuel toks "applyFromCompose"
      && toksHaveDefNamed liveEmitApplySkipFuel toks "applyIsValid"
      && toksHaveDefNamed liveEmitApplySkipFuel toks "applyOk"

/-- Keyword counts: 23 theorem, 13 example, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitApplyParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitApplySource)
    let fuel := liveEmitApplySkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitApplyTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitApplyExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitApplySetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportHostCompose : String := "import SystemsLean.HostCompose\n"

/-- Scaffold import needle. Trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitApplyScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitApply\n"

/-- applyCap def needle with a trailing newline. -/
def needleApplyCap : String := "def applyCap : Nat := 32\n"

/-- structure Apply needle with a trailing newline. -/
def needleStructure : String := "structure Apply where\n"

/-- applyFromCompose def needle with a trailing newline. -/
def needleApplyFromCompose : String :=
  "def applyFromCompose (hc : Host) : Apply :=\n"

/-- applyIsValid def needle with a trailing newline. -/
def needleApplyIsValid : String := "def applyIsValid (a : Apply) : Bool :=\n"

/-- applyOk def needle with a trailing newline. -/
def needleApplyOk : String := "def applyOk (hc : Host) : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitApply\n"

/-- Header needle with a trailing newline. -/
def needleHeader : String :=
  "  SYSTEMS_LEAN_HOST partial -- emit apply tag buffer on Systems Lean host.\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitApplySource
  (src.splitOn needleImportHostCompose).length > 1
    && (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleApplyCap).length > 1
    && (src.splitOn needleStructure).length > 1
    && (src.splitOn needleApplyFromCompose).length > 1
    && (src.splitOn needleApplyIsValid).length > 1
    && (src.splitOn needleApplyOk).length > 1
    && (src.splitOn needleEnd).length > 1
    && (src.splitOn needleHeader).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitApplyReady,
    PARSE-LIVE-EMIT-APPLY,
    HOST-FRONT-LIVE-EMIT-APPLY.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitApplyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-APPLY")
    && (parseId == "PARSE-LIVE-EMIT-APPLY")
    && (liveRel == "EmitApply.lean")
    && (liveEmitApplyRel
      == "src/systems/SystemsLean/EmitApply.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitApplyFullHost
    && !hostFrontLiveEmitApplyFullBackend
    && !hostFrontLiveEmitApplyResidualFreeClaimed
    && !hostFrontLiveEmitApplyProvablyUnlocked
    && kernelCheckLiveEmitApplySource liveEmitApplySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasApplyCapDef
    && liveParseHasEmitApplyModule
    && liveParseHasEmitApplyNs
    && liveParseHasEmitApplyEnd
    && liveParseHasEmitApplyImports
    && liveParseHasApplyStruct
    && liveParseHasCoreDefs
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitApplySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- Short command tag for a ready-failure line. -/
def cmdTag : Cmd -> String
  | Cmd.importModule x => "import:" ++ x.raw
  | Cmd.namespace x => "ns:" ++ x.raw
  | Cmd.endNamespace x => "end:" ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive:" ++ x.raw
  | Cmd.def_ x _ _ => "def:" ++ x.raw
  | Cmd.defBind x _ _ _ => "defBind:" ++ x.raw
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => "structure:" ++ x.raw

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitApply (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-APPLY =="
  IO.println s!"  host={hostId} file={liveEmitApplyRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitApplyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitApplyRel}"
    throw (IO.userError s!"missing {liveEmitApplyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitApplySource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitApply.lean != liveEmitApplySource"
    throw (IO.userError "dual-pin mismatch live EmitApply.lean")
  let r := parseLiveEmitApplySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-APPLY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-APPLY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-APPLY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitApply parse false"
      throw (IO.userError "kernelCheck live EmitApply parse false")
    unless hostFrontLiveEmitApplyReady do
      let tags := String.intercalate "," (m.commands.map cmdTag)
      IO.eprintln s!"error: hostFrontLiveEmitApplyReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} module={liveParseHasEmitApplyModule} ns={liveParseHasEmitApplyNs} endNs={liveParseHasEmitApplyEnd} imports={liveParseHasEmitApplyImports} struct={liveParseHasApplyStruct} cap={liveParseHasApplyCapDef} core={liveParseHasCoreDefs} kw={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd} tags={tags}"
      throw (IO.userError "hostFrontLiveEmitApplyReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitApply source was accepted"
      throw (IO.userError "empty EmitApply source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitApply root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitApply
