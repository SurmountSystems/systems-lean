/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckKernelMultTermKernel.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckKernelMultTermKernel.lean.
  It is not a neighbor product file.
  Kept: two imports, namespace SystemsLean.HostModuleCheck,
  three literal defs, and end. Open lines and kernel-call defs are
  skipped. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_KERNEL_MULT_TERM_KERNEL_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL, liveRel,
  kernelCheckLiveHostModuleCheckKernelMultTermKernelSource,
  hostFrontLiveHostModuleCheckKernelMultTermKernelReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckKernelMultTermKernelSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckKernelMultTermKernelSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_KERNEL_MULT_TERM_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckKernelMultTermKernel.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckKernelMultTermKernelRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckKernelMultTermKernelFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckKernelMultTermKernelFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckKernelMultTermKernelResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckKernelMultTermKernelProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, three literal defs, and end. -/
def liveKeptCmds : Nat := 7

/-- theorem keyword count. The live file has no theorem command. -/
def liveTheoremCount : Nat := 0

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. -/
def liveImportCount : Nat := 2

/-- On-disk HostModuleCheckKernelMultTermKernel.lean bytes.
    Greppable: liveHostModuleCheckKernelMultTermKernelSource. -/


def liveHostModuleCheckKernelMultTermKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for
  SystemsLean.HostModuleCheckKernelMultTerm.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostModuleCheckKernelMultTerm KERNEL-CHECK only. Same
  namespace SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLiveKernelMultTerm parse of live HostModuleCheckKernelMultTerm.lean
    then kernelCheck (PARSE-LIVE-KERNELMULTTERM).
  Live HostModuleCheckKernelMultTerm.lean parse is
  SystemsLean.HostFrontLiveKernelMultTerm, not the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelMultTermKernel, KERNEL-CHECK,
  HostModuleCheckKernelMultTerm-only, checkKernelMultTermKernel,
  hostModuleCheckKernelMultTermKernelOk,
  hostModuleCheckLiveKernelMultTermParseOk, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckKernelMultTermKernel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostModuleCheckKernelMultTermKernel when on
  surmount-1.
  Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLiveKernelMultTerm

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveKernelMultTerm

/-! ### HostModuleCheckKernelMultTerm KERNEL-CHECK pins (live
    HostModuleCheckKernelMultTerm.lean, not Mult fixture) -/

/-- Named kernel depth bar for HostModuleCheckKernelMultTerm.
    Greppable: checkDepthKernelMultTermKernelBar, KERNEL-CHECK,
    HostModuleCheckKernelMultTerm-only. -/
def checkDepthKernelMultTermKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostModuleCheckKernelMultTerm live parse only.
    Greppable: checkDepthKernelMultTermKernelScope,
    HostModuleCheckKernelMultTerm-only, KERNEL-CHECK. -/
def checkDepthKernelMultTermKernelScope : String :=
  "HostModuleCheckKernelMultTerm-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckKernelMultTermKernelOk).
    Greppable: hostModuleCheckKernelMultTermKernelDualOk, KERNEL-CHECK,
    HostModuleCheckKernelMultTerm-only. -/
def hostModuleCheckKernelMultTermKernelDualOk : Bool := true

/-- Live HostModuleCheckKernelMultTerm.lean parse kernel-checks. Not the HostTerm
    Mult fixture.
    Greppable: hostModuleCheckLiveKernelMultTermParseOk,
    PARSE-LIVE-KERNELMULTTERM. -/
def hostModuleCheckLiveKernelMultTermParseOk : Bool :=
  kernelCheckLiveKernelMultTermSource liveKernelMultTermSource
    && hostFrontLiveKernelMultTermReady

/-- Kernel check entry (live KernelMultTerm parse + HostKernel ready).
    Greppable: checkKernelMultTermKernel, KERNEL-CHECK,
    PARSE-LIVE-KERNELMULTTERM. -/
def checkKernelMultTermKernel : Bool :=
  hostKernelReady && hostModuleCheckLiveKernelMultTermParseOk

/-- Combined HostModuleCheckKernelMultTerm kernel dual-pin.
    Greppable: hostModuleCheckKernelMultTermKernelOk, KERNEL-CHECK,
    HostModuleCheckKernelMultTerm-only. -/
def hostModuleCheckKernelMultTermKernelOk : Bool :=
  hostModuleCheckKernelMultTermKernelDualOk
    && (checkDepthKernelMultTermKernelBar == "KERNEL-CHECK")
    && (checkDepthKernelMultTermKernelScope
      == "HostModuleCheckKernelMultTerm-only")
    && checkKernelMultTermKernel

end SystemsLean.HostModuleCheck
"#
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
def cmdAddsGk (c : Cmd) : List String :=
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
def cmdBodyKnownGk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdGk (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip open, theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsGk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdGk liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      if cmdBodyKnownGk kn c then
        parseCmdsGk n rest2 (kn ++ cmdAddsGk c) (acc ++ [c])
      else
        parseCmdsGk n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsGk n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live HostModuleCheckKernelMultTermKernel.lean text.
    Greppable: parseLiveHostModuleCheckKernelMultTermKernelSource. -/
def parseLiveHostModuleCheckKernelMultTermKernelSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGk liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckKernelMultTermKernel"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckKernelMultTermKernelSource. -/
def kernelCheckLiveHostModuleCheckKernelMultTermKernelSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckKernelMultTermKernelSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckKernelMultTermKernelSource
      liveHostModuleCheckKernelMultTermKernelSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count is the kept set, not a neighbor count. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "checkDepthKernelMultTermKernelBar"
      && has "checkDepthKernelMultTermKernelScope"
      && has "hostModuleCheckKernelMultTermKernelDualOk"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckKernelMultTermKernel"

/-- Live parse has namespace SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostModuleCheck. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse keeps the two imports. -/
def liveParseImportCountOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let n := m.commands.foldl (fun acc c =>
      match c with
      | Cmd.importModule _ => acc + 1
      | _ => acc) 0
    n == liveImportCount

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveHostModuleCheckKernelMultTermKernelSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostKernel\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthKernelMultTermKernelBar : String := \"KERNEL-CHECK\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckKernelMultTermKernelDualOk : Bool := true\n"

/-- Skipped kernel-call def needle with a trailing newline. -/
def needleParseOk : String :=
  "def hostModuleCheckLiveKernelMultTermParseOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckKernelMultTermKernelSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleParseOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckKernelMultTermKernelReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckKernelMultTermKernelReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_KERNEL_MULT_TERM_KERNEL_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL")
    && (liveRel == "HostModuleCheckKernelMultTermKernel.lean")
    && (liveHostModuleCheckKernelMultTermKernelRel ==
      "src/systems/SystemsLean/HostModuleCheckKernelMultTermKernel.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckKernelMultTermKernelFullHost
    && !hostFrontLiveHostModuleCheckKernelMultTermKernelFullBackend
    && !hostFrontLiveHostModuleCheckKernelMultTermKernelResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckKernelMultTermKernelProvablyUnlocked
    && kernelCheckLiveHostModuleCheckKernelMultTermKernelSource
      liveHostModuleCheckKernelMultTermKernelSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasModuleName
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseImportCountOk
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckKernelMultTermKernelSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- One kept command, for a failure line. -/
def cmdTag : Cmd -> String
  | Cmd.importModule x => s!"import {x.raw}"
  | Cmd.namespace x => s!"namespace {x.raw}"
  | Cmd.endNamespace x => s!"end {x.raw}"
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => s!"inductive {x.raw}"
  | Cmd.def_ x _ _ => s!"def {x.raw}"
  | Cmd.defBind x _ _ _ => s!"defBind {x.raw}"
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => s!"structure {x.raw}"

/-- Which ready conjuncts failed. Empty when ready holds. -/
def readyFailures : List String :=
  let bad (name : String) (ok : Bool) : List String :=
    if ok then [] else [name]
  bad "stageId" (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_KERNEL_MULT_TERM_KERNEL_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-MULT-TERM-KERNEL")
    ++ bad "liveRel" (liveRel == "HostModuleCheckKernelMultTermKernel.lean")
    ++ bad "rel" (liveHostModuleCheckKernelMultTermKernelRel ==
      "src/systems/SystemsLean/HostModuleCheckKernelMultTermKernel.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckKernelMultTermKernelFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckKernelMultTermKernelFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckKernelMultTermKernelResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckKernelMultTermKernelProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckKernelMultTermKernelSource
      liveHostModuleCheckKernelMultTermKernelSource)
    ++ bad "noCheck" liveParseHasNoCheckCmd
    ++ bad "count" liveParseCmdCountOk
    ++ bad "literals" liveParseHasLiteralDefs
    ++ bad "module" liveParseHasModuleName
    ++ bad "ns" liveParseHasNs
    ++ bad "endNs" liveParseHasEnd
    ++ bad "imports" liveParseImportCountOk
    ++ bad "kw" liveParseKwCountsOk
    ++ bad "needles" liveNeedlesOk

/-! ### Driver (short banners; on-disk bytes must match the embedded source). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: {parseId} =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelMultTermKernelRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckKernelMultTermKernelRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckKernelMultTermKernelRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckKernelMultTermKernelRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckKernelMultTermKernelSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckKernelMultTermKernel.lean != liveHostModuleCheckKernelMultTermKernelSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckKernelMultTermKernel.lean")
  let r := parseLiveHostModuleCheckKernelMultTermKernelSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckKernelMultTermKernel parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckKernelMultTermKernel parse false")
    unless hostFrontLiveHostModuleCheckKernelMultTermKernelReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckKernelMultTermKernelReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckKernelMultTermKernel source was accepted"
      throw (IO.userError "empty HostModuleCheckKernelMultTermKernel source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckKernelMultTermKernelSource
