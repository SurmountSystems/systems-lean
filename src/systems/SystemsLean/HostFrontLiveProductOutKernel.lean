/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductOutKernel.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProductOutKernel.lean. It is not ProductOutKernelTheorems.lean.
  Literal defs stay. Compound defs stay when the body is kernel-checkable
  (decideEq and && as ite, no Term.app). theorem, example, and set_option
  counts are 0. The live file has no import.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_V0,
  PARSE-LIVE-PRODUCT-OUT-KERNEL, PRODUCT-OUT-THEOREM, liveRel,
  kernelCheckLiveProductOutKernelSource,
  hostFrontLiveProductOutKernelReady.
  Module: SystemsLean.HostFrontLiveProductOutKernel
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductOutKernelSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductOutKernel

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-OUT-KERNEL"

/-- Live file basename. -/
def liveRel : String := "ProductOutKernel.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductOutKernelRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductOutKernelFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveProductOutKernelFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductOutKernelResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProductOutKernelProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductOutKernelParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveProductOutKernelSkipFuel : Nat := 8192

/-- Kept commands: namespace, eleven string defs, two kernel-checkable
    Bool defs, and end. ProductOutKernel.lean has no import.
    A count of 4 would drop the literal defs. -/
def liveProductOutKernelKeptCmds : Nat := 15

/-- theorem keyword count. ProductOutKernel.lean has no theorem. -/
def liveProductOutKernelTheoremCount : Nat := 0

/-- example keyword count. ProductOutKernel.lean has no example. -/
def liveProductOutKernelExampleCount : Nat := 0

/-- set_option keyword count. ProductOutKernel.lean has no set_option. -/
def liveProductOutKernelSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ProductOutKernel`. -/
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
def cmdAddsProductOutKernel (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded.
    decideEq and && (parsed as ite) stay when kernel-checkable. -/
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
def cmdBodyKnownProductOutKernel (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductOutKernelParseFuel body
        && termNoAppN liveProductOutKernelParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductOutKernelParseFuel body
        && termNoAppN liveProductOutKernelParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductOutKernel (fuel : Nat) (toks : List String) :
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
def parseCmdsProductOutKernel : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductOutKernel liveProductOutKernelParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductOutKernelSkipFuel rest
      if cmdBodyKnownProductOutKernel kn c then
        parseCmdsProductOutKernel n rest2
          (kn ++ cmdAddsProductOutKernel c) (acc ++ [c])
      else
        parseCmdsProductOutKernel n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductOutKernelSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductOutKernel n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProductOutKernel.lean text.
    Greppable: parseLiveProductOutKernelSource,
    PARSE-LIVE-PRODUCT-OUT-KERNEL. -/
def parseLiveProductOutKernelSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductOutKernel liveProductOutKernelParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductOutKernel"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductOutKernel parse. Not a fixture.
    Greppable: kernelCheckLiveProductOutKernelSource,
    PARSE-LIVE-PRODUCT-OUT-KERNEL. -/
def kernelCheckLiveProductOutKernelSource (src : String) : Bool :=
  match parseLiveProductOutKernelSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductOutKernelParsed? : Option Module :=
  match parseLiveProductOutKernelSource liveProductOutKernelSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductOutKernelParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse has no import. ProductOutKernel.lean does not import. -/
def liveParseHasNoImport : Bool :=
  match liveProductOutKernelParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Live parse command count. Literal defs and kernel-checkable Bool defs
    are kept. Namespace, eleven strings, two Bools, and end. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveProductOutKernelParsed? with
  | some m => m.commands.length == liveProductOutKernelKeptCmds
  | none => false

/-- Literal and kernel-checkable defs the kernel must keep. -/
def liveParseHasCoreDefs : Bool :=
  match liveProductOutKernelParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "selfHostId"
      && has "productOutKernelModuleCite"
      && has "productOutPath"
      && has "productOutApiMult"
      && has "productOutApiLinear"
      && has "productOutApiErasure"
      && has "productOutApiTypes"
      && has "productOutApiProgram"
      && has "acceptancePath"
      && has "productOutKernelBarSurfaceOk"
      && has "productOutKernelEvidencePartialReady"

/-- Wrap module lastSeg is ProductOutKernel (no module line in the live file). -/
def liveParseHasProductOutKernelModule : Bool :=
  match liveProductOutKernelParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductOutKernel"
      && lastSeg m.name.raw == "ProductOutKernel"

/-- Live parse has namespace SystemsLean.ProductOutKernel. -/
def liveParseHasProductOutKernelNs : Bool :=
  match liveProductOutKernelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductOutKernel"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductOutKernel. -/
def liveParseHasProductOutKernelEnd : Bool :=
  match liveProductOutKernelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductOutKernel"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveProductOutKernelParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveProductOutKernelSource)
    let fuel := liveProductOutKernelSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveProductOutKernelTheoremCount
      && toksCountKw fuel toks "example" 0 == liveProductOutKernelExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductOutKernelSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ProductOutKernel\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_OUT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-OUT\"\n"

/-- selfHostId def needle with a trailing newline. -/
def needleSelfHostId : String :=
  "def selfHostId : String := \"SELF-HOST-PRODUCT-OUT\"\n"

/-- Module cite needle with a trailing newline. -/
def needleModuleCite : String :=
  "def productOutKernelModuleCite : String := \"ProductOutKernel\"\n"

/-- productOutPath def needle with a trailing newline. -/
def needleProductOutPath : String :=
  "def productOutPath : String := \"out/freestanding-c/\"\n"

/-- API cite needles with a trailing newline. -/
def needleApiMult : String :=
  "def productOutApiMult : String := \"slake_mult_is_valid\"\n"

def needleApiLinear : String :=
  "def productOutApiLinear : String := \"slake_linear_consume\"\n"

def needleApiErasure : String :=
  "def productOutApiErasure : String := \"slake_erasure_is_runtime_absent\"\n"

def needleApiTypes : String :=
  "def productOutApiTypes : String := \"slake_type_tag\"\n"

def needleApiProgram : String :=
  "def productOutApiProgram : String := \"slake_ir_program\"\n"

/-- acceptancePath def needle with a trailing newline. -/
def needleAcceptancePath : String :=
  "def acceptancePath : String := \"src/systems/self-host.md\"\n"

/-- Bar surface def needle with a trailing newline. -/
def needleBarSurface : String :=
  "def productOutKernelBarSurfaceOk : Bool :=\n"

/-- PartialReady def needle with a trailing newline. -/
def needlePartialReady : String :=
  "def productOutKernelEvidencePartialReady : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProductOutKernel\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveProductOutKernelSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSelfHostId).length > 1
    && (src.splitOn needleModuleCite).length > 1
    && (src.splitOn needleProductOutPath).length > 1
    && (src.splitOn needleApiMult).length > 1
    && (src.splitOn needleApiLinear).length > 1
    && (src.splitOn needleApiErasure).length > 1
    && (src.splitOn needleApiTypes).length > 1
    && (src.splitOn needleApiProgram).length > 1
    && (src.splitOn needleAcceptancePath).length > 1
    && (src.splitOn needleBarSurface).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductOutKernelReady,
    PARSE-LIVE-PRODUCT-OUT-KERNEL,
    HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductOutKernelReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL")
    && (parseId == "PARSE-LIVE-PRODUCT-OUT-KERNEL")
    && (liveRel == "ProductOutKernel.lean")
    && (liveProductOutKernelRel
      == "src/systems/SystemsLean/ProductOutKernel.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductOutKernelFullHost
    && !hostFrontLiveProductOutKernelFullBackend
    && !hostFrontLiveProductOutKernelResidualFreeClaimed
    && !hostFrontLiveProductOutKernelProvablyUnlocked
    && kernelCheckLiveProductOutKernelSource liveProductOutKernelSource
    && liveParseHasNoCheckCmd
    && liveParseHasNoImport
    && liveParseCmdCountOk
    && liveParseHasCoreDefs
    && liveParseHasProductOutKernelModule
    && liveParseHasProductOutKernelNs
    && liveParseHasProductOutKernelEnd
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductOutKernelSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- One-line command tag for the driver banner. -/
def cmdBrief : Cmd -> String
  | Cmd.importModule x => "import " ++ x.raw
  | Cmd.namespace x => "namespace " ++ x.raw
  | Cmd.endNamespace x => "end " ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive " ++ x.raw
  | Cmd.def_ x _ _ => "def " ++ x.raw
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => "structure " ++ x.raw
  | Cmd.defBind x _ _ _ => "def " ++ x.raw

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductOutKernel (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-OUT-KERNEL =="
  IO.println s!"  host={hostId} file={liveProductOutKernelRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductOutKernelRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductOutKernelRel}"
    throw (IO.userError s!"missing {liveProductOutKernelRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductOutKernelSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductOutKernel.lean != liveProductOutKernelSource"
    throw (IO.userError "dual-pin mismatch live ProductOutKernel.lean")
  let r := parseLiveProductOutKernelSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-OUT-KERNEL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-OUT-KERNEL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    let briefs := String.intercalate ", " (m.commands.map cmdBrief)
    IO.println s!"PASS PARSE-LIVE-PRODUCT-OUT-KERNEL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"cmdBriefs={briefs}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductOutKernel parse false"
      throw (IO.userError "kernelCheck live ProductOutKernel parse false")
    unless hostFrontLiveProductOutKernelReady do
      IO.eprintln "error: hostFrontLiveProductOutKernelReady false"
      throw (IO.userError "hostFrontLiveProductOutKernelReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductOutKernel source was accepted"
      throw (IO.userError "empty ProductOutKernel source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductOutKernel root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductOutKernel
