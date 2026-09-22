/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathReadSsot.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProductPathReadSsot.lean. It is not ProductPathReadSsotTheorems.lean.
  It is not ProductPathReadSsotMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_V0,
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT, liveRel,
  kernelCheckLiveProductPathReadSsotSource,
  hostFrontLiveProductPathReadSsotReady.
  Module: SystemsLean.HostFrontLiveProductPathReadSsot
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathReadSsotSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathReadSsot

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-READ-SSOT"

/-- Live file basename. -/
def liveRel : String := "ProductPathReadSsot.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathReadSsotRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathReadSsotFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveProductPathReadSsotFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathReadSsotResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProductPathReadSsotProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathReadSsotParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveProductPathReadSsotSkipFuel : Nat := 8192

/-- Kept commands: namespace, kernel-checkable literal defs, and end.
    ProductPathReadSsot.lean has no import. -/
def liveProductPathReadSsotKeptCmds : Nat := 14

/-- theorem keyword count. ProductPathReadSsot.lean has no theorem. -/
def liveProductPathReadSsotTheoremCount : Nat := 0

/-- example keyword count. ProductPathReadSsot.lean has no example. -/
def liveProductPathReadSsotExampleCount : Nat := 0

/-- set_option keyword count. ProductPathReadSsot.lean has no set_option. -/
def liveProductPathReadSsotSetOptionCount : Nat := 0

/-- Dotted ident. -/
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
def cmdAddsProductPathReadSsot (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathReadSsot (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathReadSsotParseFuel body
        && termNoAppN liveProductPathReadSsotParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathReadSsotParseFuel body
        && termNoAppN liveProductPathReadSsotParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductPathReadSsot (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPathReadSsot : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathReadSsot liveProductPathReadSsotParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathReadSsotSkipFuel rest
      if cmdBodyKnownProductPathReadSsot kn c then
        parseCmdsProductPathReadSsot n rest2
          (kn ++ cmdAddsProductPathReadSsot c) (acc ++ [c])
      else
        parseCmdsProductPathReadSsot n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathReadSsotSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathReadSsot n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProductPathReadSsot.lean text.
    Greppable: parseLiveProductPathReadSsotSource,
    PARSE-LIVE-PRODUCT-PATH-READ-SSOT. -/
def parseLiveProductPathReadSsotSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathReadSsot liveProductPathReadSsotParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathReadSsot"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathReadSsot parse. Not a fixture.
    Greppable: kernelCheckLiveProductPathReadSsotSource,
    PARSE-LIVE-PRODUCT-PATH-READ-SSOT. -/
def kernelCheckLiveProductPathReadSsotSource (src : String) : Bool :=
  match parseLiveProductPathReadSsotSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathReadSsotParsed? : Option Module :=
  match parseLiveProductPathReadSsotSource liveProductPathReadSsotSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathReadSsotParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, kernel-checkable defs, and end. No import. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathReadSsotParsed? with
  | some m => m.commands.length == liveProductPathReadSsotKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveProductPathReadSsotParsed? with
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
      && has "productPathPerformReadDependsOnLake"
      && has "productPathPerformReadEntrypointClaimed"

/-- Wrap module lastSeg is ProductPathReadSsot (no module line in the live file). -/
def liveParseHasProductPathReadSsotModule : Bool :=
  match liveProductPathReadSsotParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductPathReadSsot"
      && lastSeg m.name.raw == "ProductPathReadSsot"

/-- Live parse has namespace SystemsLean.ProductPathReadSsot. -/
def liveParseHasProductPathReadSsotNs : Bool :=
  match liveProductPathReadSsotParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPathReadSsot"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductPathReadSsot. -/
def liveParseHasProductPathReadSsotEnd : Bool :=
  match liveProductPathReadSsotParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductPathReadSsot"
      | _ => false

/-- Live parse has no import. ProductPathReadSsot.lean has no import. -/
def liveParseHasNoImport : Bool :=
  match liveProductPathReadSsotParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveProductPathReadSsotParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveProductPathReadSsotSource)
    let fuel := liveProductPathReadSsotSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveProductPathReadSsotTheoremCount
      && toksCountKw fuel toks "example" 0 == liveProductPathReadSsotExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductPathReadSsotSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ProductPathReadSsot\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ\"\n"

/-- selfHostId def needle with a trailing newline. -/
def needleSelfHostId : String :=
  "def selfHostId : String := \"SELF-HOST-PRODUCT-PATH-PERFORM-READ\"\n"

/-- DependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "def productPathPerformReadDependsOnLake : Bool := true\n"

/-- EntrypointClaimed def needle with a trailing newline. -/
def needleEntrypointClaimed : String :=
  "def productPathPerformReadEntrypointClaimed : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProductPathReadSsot\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveProductPathReadSsotSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSelfHostId).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleEntrypointClaimed).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathReadSsotReady,
    PARSE-LIVE-PRODUCT-PATH-READ-SSOT,
    HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductPathReadSsotReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-READ-SSOT")
    && (liveRel == "ProductPathReadSsot.lean")
    && (liveProductPathReadSsotRel
      == "src/systems/SystemsLean/ProductPathReadSsot.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathReadSsotFullHost
    && !hostFrontLiveProductPathReadSsotFullBackend
    && !hostFrontLiveProductPathReadSsotResidualFreeClaimed
    && !hostFrontLiveProductPathReadSsotProvablyUnlocked
    && kernelCheckLiveProductPathReadSsotSource liveProductPathReadSsotSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasProductPathReadSsotModule
    && liveParseHasProductPathReadSsotNs
    && liveParseHasProductPathReadSsotEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathReadSsotSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductPathReadSsot (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-READ-SSOT =="
  IO.println s!"  host={hostId} file={liveProductPathReadSsotRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductPathReadSsotRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathReadSsotRel}"
    throw (IO.userError s!"missing {liveProductPathReadSsotRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathReadSsotSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathReadSsot.lean != liveProductPathReadSsotSource"
    throw (IO.userError "dual-pin mismatch live ProductPathReadSsot.lean")
  let r := parseLiveProductPathReadSsotSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-READ-SSOT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-READ-SSOT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-READ-SSOT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathReadSsot parse false"
      throw (IO.userError "kernelCheck live ProductPathReadSsot parse false")
    unless hostFrontLiveProductPathReadSsotReady do
      IO.eprintln "error: hostFrontLiveProductPathReadSsotReady false"
      throw (IO.userError "hostFrontLiveProductPathReadSsotReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductPathReadSsot source was accepted"
      throw (IO.userError "empty ProductPathReadSsot source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathReadSsot root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathReadSsot
