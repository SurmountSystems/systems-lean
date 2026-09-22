/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitErasure.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  The live file has one import, a namespace, and an end. It has no local def.
  Checked commands are that import, namespace, and end. Not EmitErasureScaffold
  defs copied in. Not EmitMult, EmitBanner, EmitLinear, or EmitTypes.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-ERASURE,
  SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_V0,
  PARSE-LIVE-EMIT-ERASURE, EMIT-ERASURE, liveRel,
  kernelCheckLiveEmitErasureSource,
  hostFrontLiveEmitErasureReady.
  Module: SystemsLean.HostFrontLiveEmitErasure
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitErasureSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitErasure

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-ERASURE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-ERASURE"

/-- Live file basename. -/
def liveRel : String := "EmitErasure.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitErasureRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitErasureFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitErasureResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitErasureProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitErasureParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitErasureSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitErasure`. -/
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
def cmdAddsEmitErasure (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app (tokenizer drops `++`, so string concat is an untyped app). -/
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

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownEmitErasure (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitErasureParseFuel body
        && termNoAppN liveEmitErasureParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitErasureParseFuel body
        && termNoAppN liveEmitErasureParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitErasure (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / un-kernelable. -/
def parseCmdsEmitErasure : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitErasure liveEmitErasureParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitErasureSkipFuel rest
      if cmdBodyKnownEmitErasure kn c then
        parseCmdsEmitErasure n rest2
          (kn ++ cmdAddsEmitErasure c) (acc ++ [c])
      else
        parseCmdsEmitErasure n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitErasureSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitErasure n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live EmitErasure.lean text.
    Greppable: parseLiveEmitErasureSource, PARSE-LIVE-EMIT-ERASURE. -/
def parseLiveEmitErasureSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitErasure liveEmitErasureParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitErasure"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitErasure parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveEmitErasureSource,
    PARSE-LIVE-EMIT-ERASURE. -/
def kernelCheckLiveEmitErasureSource (src : String) : Bool :=
  match parseLiveEmitErasureSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitErasureParsed? : Option Module :=
  match parseLiveEmitErasureSource liveEmitErasureSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitErasureParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count: import, namespace, end.
    The live file has no local def, so the count is 3, not a copied lower
    bound from a file that has defs. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitErasureParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is EmitErasure (no module line in the live file). -/
def liveParseHasEmitErasureModule : Bool :=
  match liveEmitErasureParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitErasure"

/-- Live parse has the living EmitErasure namespace command. -/
def liveParseHasEmitErasureNs : Bool :=
  match liveEmitErasureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "EmitErasure"
      | _ => false

/-- Live parse imports EmitErasureScaffold. That import is in the file.
    Scaffold defs are not copied into this parse. -/
def liveParseHasScaffoldImport : Bool :=
  match liveEmitErasureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitErasureScaffold"
      | _ => false

/-- Live parse ends the EmitErasure namespace. -/
def liveParseHasEmitErasureEnd : Bool :=
  match liveEmitErasureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "EmitErasure"
      | _ => false

/-- The live file defines no def. The parse must not invent one. -/
def liveParseHasNoLocalDef : Bool :=
  match liveEmitErasureParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Import needle. Trailing newline so the name is the whole line. -/
def needleImportScaffold : String := "import SystemsLean.EmitErasureScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitErasure\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitErasure\n"

/-- Module cite needle with a trailing newline. One line in the live file. -/
def needleModuleCite : String := "Module: SystemsLean.EmitErasure\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitErasureSource
  (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEnd).length > 1
    && (src.splitOn needleModuleCite).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitErasureReady,
    PARSE-LIVE-EMIT-ERASURE,
    HOST-FRONT-LIVE-EMIT-ERASURE.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. -/
def hostFrontLiveEmitErasureReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-ERASURE")
    && (parseId == "PARSE-LIVE-EMIT-ERASURE")
    && (liveRel == "EmitErasure.lean")
    && (liveEmitErasureRel == "src/systems/SystemsLean/EmitErasure.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitErasureFullHost
    && !hostFrontLiveEmitErasureResidualFreeClaimed
    && !hostFrontLiveEmitErasureProvablyUnlocked
    && kernelCheckLiveEmitErasureSource liveEmitErasureSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitErasureNs
    && liveParseHasEmitErasureModule
    && liveParseHasScaffoldImport
    && liveParseHasEmitErasureEnd
    && liveParseHasNoLocalDef
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitErasureSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitErasure (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-ERASURE =="
  IO.println s!"  host={hostId} file={liveEmitErasureRel}"
  let path := root / liveEmitErasureRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitErasureRel}"
    throw (IO.userError s!"missing {liveEmitErasureRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitErasureSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitErasure.lean != liveEmitErasureSource"
    throw (IO.userError "dual-pin mismatch live EmitErasure.lean")
  let r := parseLiveEmitErasureSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-ERASURE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-ERASURE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-ERASURE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitErasure parse false"
      throw (IO.userError "kernelCheck live EmitErasure parse false")
    unless hostFrontLiveEmitErasureReady do
      IO.eprintln "error: hostFrontLiveEmitErasureReady false"
      throw (IO.userError "hostFrontLiveEmitErasureReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitErasure source must reject"
      throw (IO.userError "empty EmitErasure source must reject")
    IO.println s!"GREEN {stageId}: live EmitErasure.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitErasure root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitErasure
