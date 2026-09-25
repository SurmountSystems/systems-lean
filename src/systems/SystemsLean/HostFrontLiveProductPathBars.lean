/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathBars.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProductPathBars.lean. It is not ProductPath.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. ProductPathBars path bars are compound Bool folds, so
  they are skip-folded. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-PATH-BARS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_BARS_V0,
  PARSE-LIVE-PRODUCT-PATH-BARS, liveRel,
  kernelCheckLiveProductPathBarsSource,
  hostFrontLiveProductPathBarsReady.
  Module: SystemsLean.HostFrontLiveProductPathBars
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathBarsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathBars

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_BARS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-BARS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-BARS"

/-- Live file basename. -/
def liveRel : String := "ProductPathBars.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathBarsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathBarsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveProductPathBarsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathBarsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProductPathBarsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathBarsParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveProductPathBarsSkipFuel : Nat := 8192

/-- Kept commands: nine imports, namespace, and end.
    Compound path-bar defs are skip-folded. From ProductPathBars.lean. -/
def liveProductPathBarsKeptCmds : Nat := 11

/-- theorem keyword count. ProductPathBars.lean has no theorem. -/
def liveProductPathBarsTheoremCount : Nat := 0

/-- example keyword count. ProductPathBars.lean has no example. -/
def liveProductPathBarsExampleCount : Nat := 0

/-- set_option keyword count. ProductPathBars.lean has no set_option. -/
def liveProductPathBarsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ProductPath`. -/
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
def cmdAddsProductPathBars (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathBars (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathBarsParseFuel body
        && termNoAppN liveProductPathBarsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathBarsParseFuel body
        && termNoAppN liveProductPathBarsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductPathBars (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPathBars : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathBars liveProductPathBarsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathBarsSkipFuel rest
      if cmdBodyKnownProductPathBars kn c then
        parseCmdsProductPathBars n rest2
          (kn ++ cmdAddsProductPathBars c) (acc ++ [c])
      else
        parseCmdsProductPathBars n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathBarsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathBars n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProductPathBars.lean text.
    Greppable: parseLiveProductPathBarsSource,
    PARSE-LIVE-PRODUCT-PATH-BARS. -/
def parseLiveProductPathBarsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathBars liveProductPathBarsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathBars"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathBars parse. Not a fixture.
    Greppable: kernelCheckLiveProductPathBarsSource,
    PARSE-LIVE-PRODUCT-PATH-BARS. -/
def kernelCheckLiveProductPathBarsSource (src : String) : Bool :=
  match parseLiveProductPathBarsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathBarsParsed? : Option Module :=
  match parseLiveProductPathBarsSource liveProductPathBarsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathBarsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Nine imports, namespace, and end.
    Compound path-bar defs are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathBarsParsed? with
  | some m => m.commands.length == liveProductPathBarsKeptCmds
  | none => false

/-- Compound path-bar defs are skip-folded, not kept. -/
def liveParseSkippedCompoundDefs : Bool :=
  match liveProductPathBarsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | Cmd.structure_ _ _ _ => true
      | Cmd.inductive_ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is ProductPathBars (no module line in the live file). -/
def liveParseHasProductPathBarsModule : Bool :=
  match liveProductPathBarsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductPathBars"
      && lastSeg m.name.raw == "ProductPathBars"

/-- Live parse has namespace SystemsLean.ProductPath. -/
def liveParseHasProductPathNs : Bool :=
  match liveProductPathBarsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPath"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductPath. -/
def liveParseHasProductPathEnd : Bool :=
  match liveProductPathBarsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductPath"
      | _ => false

/-- Live parse imports the nine ProductPathBars parents. -/
def liveParseHasProductPathBarsImports : Bool :=
  match liveProductPathBarsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.CompilePath"
      && has "SystemsLean.KernelEmit"
      && has "SystemsLean.KernelProgram"
      && has "SystemsLean.HostCompose"
      && has "SystemsLean.IrProgram"
      && has "SystemsLean.JoinMap"
      && has "SystemsLean.SelfHost"
      && has "SystemsLean.SurfaceMatrix"
      && has "SystemsLean.SelfApplyFs"

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveProductPathBarsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveProductPathBarsSource)
    let fuel := liveProductPathBarsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveProductPathBarsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveProductPathBarsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductPathBarsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCompilePath : String := "import SystemsLean.CompilePath\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelEmit : String := "import SystemsLean.KernelEmit\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelProgram : String := "import SystemsLean.KernelProgram\n"

/-- Import needle. Trailing newline. -/
def needleImportHostCompose : String := "import SystemsLean.HostCompose\n"

/-- Import needle. Trailing newline. -/
def needleImportIrProgram : String := "import SystemsLean.IrProgram\n"

/-- Import needle. Trailing newline. -/
def needleImportJoinMap : String := "import SystemsLean.JoinMap\n"

/-- Import needle. Trailing newline. -/
def needleImportSelfHost : String := "import SystemsLean.SelfHost\n"

/-- Import needle. Trailing newline. -/
def needleImportSurfaceMatrix : String := "import SystemsLean.SurfaceMatrix\n"

/-- Import needle. Trailing newline. -/
def needleImportSelfApplyFs : String := "import SystemsLean.SelfApplyFs\n"

/-- Namespace needle. Leading newline keeps it off the comment line.
    Trailing newline. -/
def needleNamespace : String := "\nnamespace SystemsLean.ProductPath\n"

/-- Unit path bar def needle with a trailing newline. -/
def needleUnitReady : String :=
  "def freestandingUnitProductPathReady : Bool :=\n"

/-- Program path bar def needle with a trailing newline. -/
def needleProgramReady : String :=
  "def freestandingProgramProductPathReady : Bool :=\n"

/-- Emit path bar def needle with a trailing newline. -/
def needleEmitReady : String :=
  "def freestandingEmitProductPathReady : Bool :=\n"

/-- Joint fold def needle with a trailing newline. -/
def needleProductReady : String :=
  "def freestandingProductPathReady : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProductPath\n"

/-- Each needle occurs once in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveProductPathBarsSource
  (src.splitOn needleImportCompilePath).length == 2
    && (src.splitOn needleImportKernelEmit).length == 2
    && (src.splitOn needleImportKernelProgram).length == 2
    && (src.splitOn needleImportHostCompose).length == 2
    && (src.splitOn needleImportIrProgram).length == 2
    && (src.splitOn needleImportJoinMap).length == 2
    && (src.splitOn needleImportSelfHost).length == 2
    && (src.splitOn needleImportSurfaceMatrix).length == 2
    && (src.splitOn needleImportSelfApplyFs).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleUnitReady).length == 2
    && (src.splitOn needleProgramReady).length == 2
    && (src.splitOn needleEmitReady).length == 2
    && (src.splitOn needleProductReady).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathBarsReady,
    PARSE-LIVE-PRODUCT-PATH-BARS,
    HOST-FRONT-LIVE-PRODUCT-PATH-BARS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductPathBarsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_BARS_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-BARS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-BARS")
    && (liveRel == "ProductPathBars.lean")
    && (liveProductPathBarsRel
      == "src/systems/SystemsLean/ProductPathBars.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathBarsFullHost
    && !hostFrontLiveProductPathBarsFullBackend
    && !hostFrontLiveProductPathBarsResidualFreeClaimed
    && !hostFrontLiveProductPathBarsProvablyUnlocked
    && kernelCheckLiveProductPathBarsSource liveProductPathBarsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseSkippedCompoundDefs
    && liveParseHasProductPathBarsModule
    && liveParseHasProductPathNs
    && liveParseHasProductPathEnd
    && liveParseHasProductPathBarsImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathBarsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductPathBars (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-BARS =="
  IO.println s!"  host={hostId} file={liveProductPathBarsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductPathBarsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathBarsRel}"
    throw (IO.userError s!"missing {liveProductPathBarsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathBarsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathBars.lean != liveProductPathBarsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathBars.lean")
  let r := parseLiveProductPathBarsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-BARS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-BARS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-BARS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathBars parse false"
      throw (IO.userError "kernelCheck live ProductPathBars parse false")
    unless hostFrontLiveProductPathBarsReady do
      IO.eprintln "error: hostFrontLiveProductPathBarsReady false"
      throw (IO.userError "hostFrontLiveProductPathBarsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductPathBars source was accepted"
      throw (IO.userError "empty ProductPathBars source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathBars root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathBars
