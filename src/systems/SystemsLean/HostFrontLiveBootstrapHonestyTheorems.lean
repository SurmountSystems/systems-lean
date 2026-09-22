/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/BootstrapHonestyTheorems.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that
  parse. Ready is that conjunction, not a hardcoded true.
  This wrap is BootstrapHonestyTheorems.lean. It is not
  BootstrapHonesty.lean.
  Theorems and examples are skipped. Their bodies are `by decide`, not
  kernel-checkable here. Kept commands are import, namespace, and end.
  theorem count is 2. example count is 9. set_option count is 0.
  Section anchors are the BOOTSTRAP-THEOREM and BOOTSTRAP-SMOKE headers.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-BOOTSTRAP-HONESTY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_THEOREMS_V0,
  PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS, BOOTSTRAP-THEOREM, liveRel,
  kernelCheckLiveBootstrapHonestyTheoremsSource,
  hostFrontLiveBootstrapHonestyTheoremsReady.
  Module: SystemsLean.HostFrontLiveBootstrapHonestyTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveBootstrapHonestyTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveBootstrapHonestyTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-BOOTSTRAP-HONESTY-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel itself is defined in the Source module. -/
def liveBootstrapHonestyTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveBootstrapHonestyTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveBootstrapHonestyTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveBootstrapHonestyTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveBootstrapHonestyTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveBootstrapHonestyTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorems, examples, and non-commands. -/
def liveBootstrapHonestyTheoremsSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, and end.
    Theorems and examples are skipped. From BootstrapHonestyTheorems.lean.
    A count of 4 would invent a def this file does not have. -/
def liveBootstrapHonestyTheoremsKeptCmds : Nat := 3

/-- theorem keyword count. BootstrapHonestyTheorems.lean has two theorems. -/
def liveBootstrapHonestyTheoremsTheoremCount : Nat := 2

/-- example keyword count. BootstrapHonestyTheorems.lean has nine examples. -/
def liveBootstrapHonestyTheoremsExampleCount : Nat := 9

/-- set_option keyword count. BootstrapHonestyTheorems.lean has no set_option. -/
def liveBootstrapHonestyTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . BootstrapHonesty`. -/
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
def cmdAddsBootstrapHonestyTheorems (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
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

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownBootstrapHonestyTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveBootstrapHonestyTheoremsParseFuel body
        && termNoAppN liveBootstrapHonestyTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveBootstrapHonestyTheoremsParseFuel body
        && termNoAppN liveBootstrapHonestyTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdBootstrapHonestyTheorems (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsBootstrapHonestyTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdBootstrapHonestyTheorems
        liveBootstrapHonestyTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveBootstrapHonestyTheoremsSkipFuel rest
      if cmdBodyKnownBootstrapHonestyTheorems kn c then
        parseCmdsBootstrapHonestyTheorems n rest2
          (kn ++ cmdAddsBootstrapHonestyTheorems c) (acc ++ [c])
      else
        parseCmdsBootstrapHonestyTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveBootstrapHonestyTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsBootstrapHonestyTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live BootstrapHonestyTheorems.lean text.
    Greppable: parseLiveBootstrapHonestyTheoremsSource,
    PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS. -/
def parseLiveBootstrapHonestyTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsBootstrapHonestyTheorems
        liveBootstrapHonestyTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.BootstrapHonestyTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live BootstrapHonestyTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveBootstrapHonestyTheoremsSource,
    PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS. -/
def kernelCheckLiveBootstrapHonestyTheoremsSource (src : String) : Bool :=
  match parseLiveBootstrapHonestyTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveBootstrapHonestyTheoremsParsed? : Option Module :=
  match parseLiveBootstrapHonestyTheoremsSource
      liveBootstrapHonestyTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Import, namespace, and end.
    Theorems and examples are not kept. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | some m => m.commands.length == liveBootstrapHonestyTheoremsKeptCmds
  | none => false

/-- This file has no def. Theorems and examples are the surface. -/
def liveParseHasNoDef : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is BootstrapHonestyTheorems
    (no module line in the live file). -/
def liveParseHasBootstrapHonestyTheoremsModule : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.BootstrapHonestyTheorems"
      && lastSeg m.name.raw == "BootstrapHonestyTheorems"

/-- Live parse has namespace SystemsLean.BootstrapHonesty.
    The long-file split shares that namespace. It is not
    SystemsLean.BootstrapHonestyTheorems. -/
def liveParseHasBootstrapHonestyNs : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.BootstrapHonesty"
      | _ => false

/-- Live parse ends namespace SystemsLean.BootstrapHonesty. -/
def liveParseHasBootstrapHonestyEnd : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.BootstrapHonesty"
      | _ => false

/-- Live parse imports SystemsLean.BootstrapHonesty. -/
def liveParseHasBootstrapHonestyImport : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.BootstrapHonesty"
      | _ => false

/-- Keyword counts: theorem 2, example 9, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveBootstrapHonestyTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveBootstrapHonestyTheoremsSource)
    let fuel := liveBootstrapHonestyTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveBootstrapHonestyTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveBootstrapHonestyTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveBootstrapHonestyTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportBootstrapHonesty : String :=
  "import SystemsLean.BootstrapHonesty\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.BootstrapHonesty\n"

/-- BOOTSTRAP-THEOREM section anchor. Trailing newline. -/
def needleSectionTheorem : String :=
  "/-! ### BOOTSTRAP-THEOREM / HOST-BOOTSTRAP-THEOREM\n"

/-- First theorem anchor. Trailing newline. -/
def needleTheoremPartialReady : String :=
  "theorem productPathHostLakeBootstrapPartialReady_true :\n"

/-- Second theorem anchor. Trailing newline. -/
def needleTheoremRemains : String :=
  "theorem productPathHostLakeBootstrapRemains_true :\n"

/-- BOOTSTRAP-SMOKE section anchor. Trailing newline. -/
def needleSectionSmoke : String :=
  "/-! ### BOOTSTRAP-SMOKE / HOST-BOOTSTRAP-SMOKE\n"

/-- PartialReady example anchor. Trailing newline. -/
def needleExamplePartialReady : String :=
  "example : productPathHostLakeBootstrapPartialReady = true := by\n"

/-- Surface Ok example anchor. Trailing newline. -/
def needleExampleSurfaceOk : String :=
  "example : productPathBootstrapSurfaceOk = true := by\n"

/-- Remains example anchor. Trailing newline. -/
def needleExampleRemains : String :=
  "example : productPathHostLakeBootstrapRemains = true := by\n"

/-- stageId example anchor. Trailing newline. -/
def needleExampleStageId : String :=
  "example : stageId = \"SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0\" := by\n"

/-- hostId example anchor. Trailing newline. -/
def needleExampleHostId : String :=
  "example : hostId = \"HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP\" := by\n"

/-- selfHostId example anchor. Trailing newline. -/
def needleExampleSelfHostId : String :=
  "example : selfHostId = \"SELF-HOST-PRODUCT-PATH-BOOTSTRAP\" := by\n"

/-- Writer path example anchor. Trailing newline. -/
def needleExampleWriterPath : String :=
  "example : hostLakeEmitWriterPath = \"src/systems/SystemsLean/FreestandingEmit.lean\" := by\n"

/-- Emit exe example anchor. Trailing newline. -/
def needleExampleEmitExe : String :=
  "example : hostLakeEmitExe = \"slake-emit-freestanding-c\" := by\n"

/-- Emit stage example anchor. Trailing newline. -/
def needleExampleEmitStage : String :=
  "example : hostLakeEmitStageCite = \"SLAKE_EMIT_FREESTANDING_C_V0\" := by\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.BootstrapHonesty\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.BootstrapHonestyTheorems. -/
def liveNeedlesOk : Bool :=
  let src := liveBootstrapHonestyTheoremsSource
  (src.splitOn needleImportBootstrapHonesty).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleSectionTheorem).length > 1
    && (src.splitOn needleTheoremPartialReady).length > 1
    && (src.splitOn needleTheoremRemains).length > 1
    && (src.splitOn needleSectionSmoke).length > 1
    && (src.splitOn needleExamplePartialReady).length > 1
    && (src.splitOn needleExampleSurfaceOk).length > 1
    && (src.splitOn needleExampleRemains).length > 1
    && (src.splitOn needleExampleStageId).length > 1
    && (src.splitOn needleExampleHostId).length > 1
    && (src.splitOn needleExampleSelfHostId).length > 1
    && (src.splitOn needleExampleWriterPath).length > 1
    && (src.splitOn needleExampleEmitExe).length > 1
    && (src.splitOn needleExampleEmitStage).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveBootstrapHonestyTheoremsReady,
    PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS,
    HOST-FRONT-LIVE-BOOTSTRAP-HONESTY-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveBootstrapHonestyTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-BOOTSTRAP-HONESTY-THEOREMS")
    && (parseId == "PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS")
    && (liveRel == "BootstrapHonestyTheorems.lean")
    && (liveBootstrapHonestyTheoremsRel
      == "src/systems/SystemsLean/BootstrapHonestyTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveBootstrapHonestyTheoremsFullHost
    && !hostFrontLiveBootstrapHonestyTheoremsFullBackend
    && !hostFrontLiveBootstrapHonestyTheoremsResidualFreeClaimed
    && !hostFrontLiveBootstrapHonestyTheoremsProvablyUnlocked
    && kernelCheckLiveBootstrapHonestyTheoremsSource
      liveBootstrapHonestyTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoDef
    && liveParseHasBootstrapHonestyTheoremsModule
    && liveParseHasBootstrapHonestyNs
    && liveParseHasBootstrapHonestyEnd
    && liveParseHasBootstrapHonestyImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveBootstrapHonestyTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveBootstrapHonestyTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS =="
  IO.println s!"  host={hostId} file={liveBootstrapHonestyTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveBootstrapHonestyTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveBootstrapHonestyTheoremsRel}"
    throw (IO.userError s!"missing {liveBootstrapHonestyTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveBootstrapHonestyTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk BootstrapHonestyTheorems.lean != liveBootstrapHonestyTheoremsSource"
    throw (IO.userError "dual-pin mismatch live BootstrapHonestyTheorems.lean")
  let r := parseLiveBootstrapHonestyTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live BootstrapHonestyTheorems parse false"
      throw (IO.userError "kernelCheck live BootstrapHonestyTheorems parse false")
    unless hostFrontLiveBootstrapHonestyTheoremsReady do
      IO.eprintln "error: hostFrontLiveBootstrapHonestyTheoremsReady false"
      throw (IO.userError "hostFrontLiveBootstrapHonestyTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty BootstrapHonestyTheorems source was accepted"
      throw (IO.userError "empty BootstrapHonestyTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveBootstrapHonestyTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveBootstrapHonestyTheorems
