/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckParityMultTermKernel.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckParityMultTermKernel.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  The live file has two imports. Those imports stay inside the
  embedded source bytes. This checker does not import them.
  Checker imports: HostFrontLiveHostTerm, the Source module, HostKernel.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: those two imports, the namespace, end, and
  defs whose bodies are one String or Bool literal.
  A Bool literal inside the product
  (hostModuleCheckParityMultTermKernelDualOk)
  is not this checker's kernelCheck. kernelCheck calls HostKernel.kernelCheck
  on an accepted parse and returns false on reject.
  Match, application, and && bodies stay in the source text
  (needles). Their bodies are not kernel terms.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  FullHostElaborateRemains stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPARITYMULTTERMKERNEL_V0,
  PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL, liveRel,
  kernelCheckLiveHostModuleCheckParityMultTermKernelSource,
  hostFrontLiveHostModuleCheckParityMultTermKernelReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernelSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPARITYMULTTERMKERNEL_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckParityMultTermKernel.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckParityMultTermKernelRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckParityMultTermKernelFullHost :
    Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckParityMultTermKernelFullBackend :
    Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckParityMultTermKernelResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckParityMultTermKernelProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- Kept-command count printed by this driver (cmds=7).
    Not a hand count. The run with 0 printed cmdCount=false. -/
def liveKeptCmds : Nat := 7

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

/-- Names a command adds to the known-const set.
    Imports do not add names. -/
def cmdAddsLive (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- A typed def whose body is one String, Bool, or Nat literal.
    An application or `&&` body is not a kernel literal, so it is not kept. -/
def bodyIsKernelLit (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.string) (Term.litString _) => true
  | Cmd.def_ _ (some HostType.bool) (Term.litBool _) => true
  | Cmd.def_ _ (some HostType.nat) (Term.litNat _) => true
  | _ => false

/-- Parse `def` only when the body is one complete term.
    A leftover that is not the next command means the body used syntax
    HostTerm does not keep (`match`, `let`, list lit).
    Return none so the caller skipUntilCmd. Do not keep a prefix of the body. -/
def parseDefLive (fuel : Nat) (dname : String)
    (rest : List String) : Option (Prod Cmd (List String)) :=
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
            match parseTermHt fuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              let complete :=
                match rest4 with
                | [] => true
                | t :: _ => isCmdKw t
              if !complete then none
              else
                let rest5 := skipNonCmd liveSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    open is not parsed here. theorem, example, and set_option are not
    parsed here. -/
def parseOneCmdLive (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLive fuel dname rest2
    | none => none
  | _ => none

/-- Keep imports, namespace, end, and literal defs.
    Drop defBind and non-literal defs after they have been consumed. -/
def keepParsed (kn : List String) (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ _ _ => cmdBodyKnown kn c && bodyIsKernelLit c
  | Cmd.defBind _ _ _ _ => false
  | _ => true

/-- Fold commands. Skip defs whose bodies are not kernel literals.
    A non-command token is not a parse failure. -/
def parseCmdsLive : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLive liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      if keepParsed kn c then
        parseCmdsLive n rest2 (kn ++ cmdAddsLive c) (acc ++ [c])
      else
        parseCmdsLive n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLive n rest2 kn acc
        else none
      | [] => some acc

/-- Parse live HostModuleCheckParityMultTermKernel.lean text.
    Greppable: parseLiveHostModuleCheckParityMultTermKernelSource,
    PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL. -/
def parseLiveHostModuleCheckParityMultTermKernelSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLive liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name :=
              HostTerm.n "SystemsLean.HostModuleCheckParityMultTermKernel"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckParityMultTermKernelSource,
    PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL. -/
def kernelCheckLiveHostModuleCheckParityMultTermKernelSource
    (src : String) : Bool :=
  match parseLiveHostModuleCheckParityMultTermKernelSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckParityMultTermKernelSource
      liveHostModuleCheckParityMultTermKernelSource with
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

/-- Import command names, in order. -/
def importNames : List Cmd -> List String
  | [] => []
  | Cmd.importModule x :: rest => x.raw :: importNames rest
  | _ :: rest => importNames rest

/-- Two imports. HostKernel then HostFrontLiveParityMultTerm.
    The product modules are not imports of this checker. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostKernel",
      "SystemsLean.HostFrontLiveParityMultTerm"
    ]

/-- Live parse command count matches liveKeptCmds. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Kept String def checkDepthParityMultTermKernelBar is KERNEL-CHECK. -/
def liveParseHasBarLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthParityMultTermKernelBar"
          && s == "KERNEL-CHECK"
      | _ => false

/-- Kept String def checkDepthParityMultTermKernelScope is
    HostModuleCheckParityMultTerm-only. -/
def liveParseHasScopeLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthParityMultTermKernelScope"
          && s == "HostModuleCheckParityMultTerm-only"
      | _ => false

/-- Scope is namespace SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- End of namespace SystemsLean.HostModuleCheck. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Wrap module lastSeg is HostModuleCheckParityMultTermKernel
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckParityMultTermKernel"
      && lastSeg m.name.raw == "HostModuleCheckParityMultTermKernel"

/-- Import HostKernel, once, with a trailing newline. -/
def needleImportKernel : String := "import SystemsLean.HostKernel\n"

/-- Import HostFrontLiveParityMultTerm, once, with a trailing newline. -/
def needleImportParityMultTerm : String :=
  "import SystemsLean.HostFrontLiveParityMultTerm\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Bar def name. The body string is KERNEL-CHECK. -/
def needleBarDef : String := "def checkDepthParityMultTermKernelBar"

/-- Combined ok def name. Not this checker's kernelCheck. -/
def needleOkDef : String :=
  "def hostModuleCheckParityMultTermKernelOk"

/-- Bar string in the live source. -/
def needleBar : String := "KERNEL-CHECK"

/-- Scope string in the live source. -/
def needleScope : String := "HostModuleCheckParityMultTerm-only"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Two imports. Bar is KERNEL-CHECK. Scope is HostModuleCheckParityMultTerm-only. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckParityMultTermKernelSource
  (src.splitOn needleImportKernel).length == 2
    && (src.splitOn needleImportParityMultTerm).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleEnd).length == 2
    && (src.splitOn needleBarDef).length == 2
    && (src.splitOn needleOkDef).length == 2
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleScope).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckParityMultTermKernelReady,
    PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL,
    HOST-FRONT-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckParityMultTermKernelReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPARITYMULTTERMKERNEL_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL")
    && (liveRel == "HostModuleCheckParityMultTermKernel.lean")
    && (liveHostModuleCheckParityMultTermKernelRel ==
        "src/systems/SystemsLean/HostModuleCheckParityMultTermKernel.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckParityMultTermKernelFullHost
    && !hostFrontLiveHostModuleCheckParityMultTermKernelFullBackend
    && !hostFrontLiveHostModuleCheckParityMultTermKernelResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckParityMultTermKernelProvablyUnlocked
    && kernelCheckLiveHostModuleCheckParityMultTermKernelSource
        liveHostModuleCheckParityMultTermKernelSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasBarLit
    && liveParseHasScopeLit
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasModule
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckParityMultTermKernelSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityMultTermKernelRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckParityMultTermKernelRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckParityMultTermKernelRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckParityMultTermKernelRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckParityMultTermKernelSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckParityMultTermKernel.lean != liveHostModuleCheckParityMultTermKernelSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckParityMultTermKernel.lean")
  let r := parseLiveHostModuleCheckParityMultTermKernelSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} bar={liveParseHasBarLit} scope={liveParseHasScopeLit} namespace={liveParseHasNs} end={liveParseHasEnd} module={liveParseHasModule} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckParityMultTermKernel parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckParityMultTermKernel parse false")
    unless hostFrontLiveHostModuleCheckParityMultTermKernelReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckParityMultTermKernelReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckParityMultTermKernelReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckParityMultTermKernel source was accepted"
      throw (IO.userError "empty HostModuleCheckParityMultTermKernel source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel
