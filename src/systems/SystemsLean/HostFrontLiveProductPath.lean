/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPath.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProductPath.lean. It is not ProductPathBars.lean.
  It is not ProductPathTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def productSelfHostCompleteClaimed is true.
  That def is not this wrap's complete claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-PATH,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_V0,
  PARSE-LIVE-PRODUCT-PATH, PRODUCT-PATH-THEOREM, liveRel,
  kernelCheckLiveProductPathSource,
  hostFrontLiveProductPathReady.
  Module: SystemsLean.HostFrontLiveProductPath
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPath

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH"

/-- Live file basename. -/
def liveRel : String := "ProductPath.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveProductPathFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file may cite provablyUnlocked. That cite is not this flag. -/
def hostFrontLiveProductPathProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveProductPathSkipFuel : Nat := 8192

/-- Kept commands: four imports, namespace, kernel-checkable defs, and end.
    A count of 4 would drop the literal defs. From ProductPath.lean.
    Kept: 4 imports, namespace, 33 string literals, 2 bool literals,
    productPathSurfaceOk, productPathCloseSurfaceOk,
    productPathFurtherAliasTheaterHeld, and end. Dotted projections and
    names that live only in ProductPathBars are skipped. -/
def liveProductPathKeptCmds : Nat := 44

/-- theorem keyword count. ProductPath.lean has no theorem. -/
def liveProductPathTheoremCount : Nat := 0

/-- example keyword count. ProductPath.lean has no example. -/
def liveProductPathExampleCount : Nat := 0

/-- set_option keyword count. ProductPath.lean has no set_option. -/
def liveProductPathSetOptionCount : Nat := 0

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
def cmdAddsProductPath (c : Cmd) : List String :=
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
def cmdBodyKnownProductPath (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathParseFuel body
        && termNoAppN liveProductPathParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathParseFuel body
        && termNoAppN liveProductPathParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductPath (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPath : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPath liveProductPathParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathSkipFuel rest
      if cmdBodyKnownProductPath kn c then
        parseCmdsProductPath n rest2
          (kn ++ cmdAddsProductPath c) (acc ++ [c])
      else
        parseCmdsProductPath n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPath n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProductPath.lean text.
    Greppable: parseLiveProductPathSource,
    PARSE-LIVE-PRODUCT-PATH. -/
def parseLiveProductPathSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPath liveProductPathParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPath"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPath parse. Not a fixture.
    Greppable: kernelCheckLiveProductPathSource,
    PARSE-LIVE-PRODUCT-PATH. -/
def kernelCheckLiveProductPathSource (src : String) : Bool :=
  match parseLiveProductPathSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathParsed? : Option Module :=
  match parseLiveProductPathSource liveProductPathSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathParsed? with
  | some m => m.commands.length == liveProductPathKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostProductPathId"
      && has "residualFreeClaimed"
      && has "productSelfHostCompleteClaimed"
      && has "closeStageId"
      && has "productPathSurfaceOk"
      && has "productPathCloseSurfaceOk"
      && has "productPathFurtherAliasTheaterHeld"

/-- Wrap module lastSeg is ProductPath (no module line in the live file). -/
def liveParseHasProductPathModule : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductPath"
      && lastSeg m.name.raw == "ProductPath"

/-- Live parse has namespace SystemsLean.ProductPath. -/
def liveParseHasProductPathNs : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPath"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductPath. -/
def liveParseHasProductPathEnd : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductPath"
      | _ => false

/-- Live parse imports SystemsLean.InventoryClose. -/
def liveParseHasInventoryCloseImport : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.InventoryClose"
      | _ => false

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.SelfApplyFs"
      | _ => false

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Live parse imports SystemsLean.ProductPathBars. -/
def liveParseHasProductPathBarsImport : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ProductPathBars"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveProductPathParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveProductPathSource)
    let fuel := liveProductPathSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveProductPathTheoremCount
      && toksCountKw fuel toks "example" 0 == liveProductPathExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductPathSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportInventoryClose : String :=
  "import SystemsLean.InventoryClose\n"

/-- ProductPathBars import needle. Trailing newline.
    This wrap is not ProductPathBars.lean. -/
def needleImportProductPathBars : String :=
  "import SystemsLean.ProductPathBars\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ProductPath\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_PATH_V0\"\n"

/-- hostProductPathId def needle with a trailing newline. -/
def needleHostProductPathId : String :=
  "def hostProductPathId : String := \"HOST-PRODUCT-PATH\"\n"

/-- residualFreeClaimed def needle with a trailing newline. -/
def needleResidualFreeClaimed : String :=
  "def residualFreeClaimed : Bool := false\n"

/-- productSelfHostCompleteClaimed def needle with a trailing newline. -/
def needleProductSelfHostCompleteClaimed : String :=
  "def productSelfHostCompleteClaimed : Bool := true\n"

/-- closeStageId def needle with a trailing newline. -/
def needleCloseStageId : String :=
  "def closeStageId : String := \"SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProductPath\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveProductPathSource
  (src.splitOn needleImportInventoryClose).length > 1
    && (src.splitOn needleImportProductPathBars).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostProductPathId).length > 1
    && (src.splitOn needleResidualFreeClaimed).length > 1
    && (src.splitOn needleProductSelfHostCompleteClaimed).length > 1
    && (src.splitOn needleCloseStageId).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathReady,
    PARSE-LIVE-PRODUCT-PATH,
    HOST-FRONT-LIVE-PRODUCT-PATH.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductPathReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH")
    && (liveRel == "ProductPath.lean")
    && (liveProductPathRel
      == "src/systems/SystemsLean/ProductPath.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathFullHost
    && !hostFrontLiveProductPathFullBackend
    && !hostFrontLiveProductPathResidualFreeClaimed
    && !hostFrontLiveProductPathProvablyUnlocked
    && kernelCheckLiveProductPathSource liveProductPathSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasProductPathModule
    && liveParseHasProductPathNs
    && liveParseHasProductPathEnd
    && liveParseHasInventoryCloseImport
    && liveParseHasSelfApplyFsImport
    && liveParseHasLlvmHoldImport
    && liveParseHasProductPathBarsImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductPath (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH =="
  IO.println s!"  host={hostId} file={liveProductPathRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductPathRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathRel}"
    throw (IO.userError s!"missing {liveProductPathRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPath.lean != liveProductPathSource"
    throw (IO.userError "dual-pin mismatch live ProductPath.lean")
  let r := parseLiveProductPathSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPath parse false"
      throw (IO.userError "kernelCheck live ProductPath parse false")
    unless hostFrontLiveProductPathReady do
      IO.eprintln "error: hostFrontLiveProductPathReady false"
      throw (IO.userError "hostFrontLiveProductPathReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductPath source was accepted"
      throw (IO.userError "empty ProductPath source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPath root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPath
