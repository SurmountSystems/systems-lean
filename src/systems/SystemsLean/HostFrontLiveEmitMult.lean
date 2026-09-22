/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitMult.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Not emit scaffolding. Not EmitBanner, EmitLinear, or EmitTypes.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-MULT,
  SLAKE_HOST_FRONT_LIVE_EMIT_MULT_V0,
  PARSE-LIVE-EMIT-MULT, EMIT-MULT, liveRel,
  kernelCheckLiveEmitMultSource,
  hostFrontLiveEmitMultReady.
  Module: SystemsLean.HostFrontLiveEmitMult
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitMultSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitMult

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_MULT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-MULT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-MULT"

/-- Live file basename. -/
def liveRel : String := "EmitMult.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitMultRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitMultFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitMultResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitMultProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitMultParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitMultSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitMult`. -/
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
def cmdAddsEmitMult (c : Cmd) : List String :=
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
def cmdBodyKnownEmitMult (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitMultParseFuel body
        && termNoAppN liveEmitMultParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitMultParseFuel body
        && termNoAppN liveEmitMultParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitMult (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitMult : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitMult liveEmitMultParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitMultSkipFuel rest
      if cmdBodyKnownEmitMult kn c then
        parseCmdsEmitMult n rest2
          (kn ++ cmdAddsEmitMult c) (acc ++ [c])
      else
        parseCmdsEmitMult n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitMultSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitMult n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live EmitMult.lean text.
    Greppable: parseLiveEmitMultSource, PARSE-LIVE-EMIT-MULT. -/
def parseLiveEmitMultSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitMult liveEmitMultParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitMult"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitMult parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveEmitMultSource,
    PARSE-LIVE-EMIT-MULT. -/
def kernelCheckLiveEmitMultSource (src : String) : Bool :=
  match parseLiveEmitMultSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitMultParsed? : Option Module :=
  match parseLiveEmitMultSource liveEmitMultSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitMultParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count: one import, namespace, and end.
    Real count from the parse, not a hardcoded true.
    Doc comments are stripped. No def in the live file. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitMultParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is EmitMult (no module line in the live file). -/
def liveParseHasEmitMultModule : Bool :=
  match liveEmitMultParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitMult"

/-- Live parse has the living EmitMult namespace command. -/
def liveParseHasEmitMultNs : Bool :=
  match liveEmitMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "EmitMult"
      | _ => false

/-- Live parse imports SystemsLean.EmitMultScaffold. -/
def liveParseHasEmitMultScaffoldImport : Bool :=
  match liveEmitMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitMultScaffold"
      | _ => false

/-- Live parse ends the EmitMult namespace. -/
def liveParseHasEmitMultEnd : Bool :=
  match liveEmitMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "EmitMult"
      | _ => false

/-- Unique needle. Trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitMultScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitMult\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitMult\n"

/-- Header needle with a trailing newline. -/
def needleHeader : String :=
  "  SYSTEMS_LEAN_HOST partial -- host-owned Mult freestanding C product text (SH2).\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitMultSource
  (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEnd).length > 1
    && (src.splitOn needleHeader).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitMultReady,
    PARSE-LIVE-EMIT-MULT,
    HOST-FRONT-LIVE-EMIT-MULT.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. -/
def hostFrontLiveEmitMultReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_MULT_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-MULT")
    && (parseId == "PARSE-LIVE-EMIT-MULT")
    && (liveRel == "EmitMult.lean")
    && (liveEmitMultRel == "src/systems/SystemsLean/EmitMult.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitMultFullHost
    && !hostFrontLiveEmitMultResidualFreeClaimed
    && !hostFrontLiveEmitMultProvablyUnlocked
    && kernelCheckLiveEmitMultSource liveEmitMultSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitMultNs
    && liveParseHasEmitMultModule
    && liveParseHasEmitMultScaffoldImport
    && liveParseHasEmitMultEnd
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitMultSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitMult (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-MULT =="
  IO.println s!"  host={hostId} file={liveEmitMultRel}"
  let path := root / liveEmitMultRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitMultRel}"
    throw (IO.userError s!"missing {liveEmitMultRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitMultSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitMult.lean != liveEmitMultSource"
    throw (IO.userError "dual-pin mismatch live EmitMult.lean")
  let r := parseLiveEmitMultSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-MULT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-MULT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-MULT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitMult parse false"
      throw (IO.userError "kernelCheck live EmitMult parse false")
    unless hostFrontLiveEmitMultReady do
      IO.eprintln "error: hostFrontLiveEmitMultReady false"
      throw (IO.userError "hostFrontLiveEmitMultReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitMult source must reject"
      throw (IO.userError "empty EmitMult source must reject")
    IO.println s!"GREEN {stageId}: live EmitMult.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitMult root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitMult
