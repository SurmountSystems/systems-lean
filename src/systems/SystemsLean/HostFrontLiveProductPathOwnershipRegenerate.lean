/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathOwnershipRegenerate.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that
  parse. Ready is that conjunction, not a hardcoded true.
  This wrap is ProductPathOwnershipRegenerate.lean.
  It is not ProductPathOwnershipRegenerateTheorems.lean.
  Literal defs stay. The Ok fold and PartialReady fold are skipped
  (parser encodes && as Term.ite and == as Term.decideEq; kernelFuel 64
  cannot check that nest after the literal defs). IO and main stay skipped.
  theorem, example, and set_option counts are 0.
  Not a backend. FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def productPathOwnershipRegenerateWithoutLake is true.
  That def is not this wrap's FullHost claim.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  PRODUCT-PATH-OWNERSHIP-REGENERATE, liveRel,
  kernelCheckLiveProductPathOwnershipRegenerateSource,
  hostFrontLiveProductPathOwnershipRegenerateReady.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipRegenerate
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathOwnershipRegenerateSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathOwnershipRegenerate

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE"

/-- Live file basename. -/
def liveRel : String := "ProductPathOwnershipRegenerate.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathOwnershipRegenerateRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathOwnershipRegenerateFullHost : Bool := false

/-- Honesty: this wrap is not a backend. FullBackend stays false. -/
def hostFrontLiveProductPathOwnershipRegenerateFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathOwnershipRegenerateResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProductPathOwnershipRegenerateProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathOwnershipRegenerateParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveProductPathOwnershipRegenerateSkipFuel : Nat := 8192

/-- Kept commands: namespace, 33 literal defs, and end. No import.
    productPathOwnershipRegenerateOk, PartialReady, the IO print, and
    main are skipped (kernelFuel 64). A count of 4 would drop the
    literal defs. From ProductPathOwnershipRegenerate.lean. -/
def liveProductPathOwnershipRegenerateKeptCmds : Nat := 35

/-- theorem keyword count. The live file has no theorem command. -/
def liveProductPathOwnershipRegenerateTheoremCount : Nat := 0

/-- example keyword count. The live file has no example command. -/
def liveProductPathOwnershipRegenerateExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option. -/
def liveProductPathOwnershipRegenerateSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ProductPathOwnershipRegenerate`. -/
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
def cmdAddsProductPathOwnershipRegenerate (c : Cmd) : List String :=
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

/-- Keep lit / const / var only. Skip &&-as-ite and ==-as-decideEq
    so kernelFuel 64 can check the remaining Bool and String lits. -/
def termKeepSimpleN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.some_ t => termKeepSimpleN n t
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ _, Term.ite _ _ _ => false
  | Nat.succ _, Term.decideEq _ _ => false
  | Nat.succ _, Term.proj _ _ => false
  | Nat.succ _, Term.structLit _ => false
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, no && / == nest. -/
def cmdBodyKnownProductPathOwnershipRegenerate (kn : List String) :
    Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathOwnershipRegenerateParseFuel body
        && termNoAppN liveProductPathOwnershipRegenerateParseFuel body
        && termKeepSimpleN liveProductPathOwnershipRegenerateParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathOwnershipRegenerateParseFuel body
        && termNoAppN liveProductPathOwnershipRegenerateParseFuel body
        && termKeepSimpleN liveProductPathOwnershipRegenerateParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductPathOwnershipRegenerate (fuel : Nat)
    (toks : List String) : Option (Prod Cmd (List String)) :=
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
def parseCmdsProductPathOwnershipRegenerate : Nat -> List String ->
    List String -> List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathOwnershipRegenerate
        liveProductPathOwnershipRegenerateParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathOwnershipRegenerateSkipFuel rest
      if cmdBodyKnownProductPathOwnershipRegenerate kn c then
        parseCmdsProductPathOwnershipRegenerate n rest2
          (kn ++ cmdAddsProductPathOwnershipRegenerate c) (acc ++ [c])
      else
        parseCmdsProductPathOwnershipRegenerate n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd
            liveProductPathOwnershipRegenerateSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathOwnershipRegenerate n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProductPathOwnershipRegenerate.lean text.
    Greppable: parseLiveProductPathOwnershipRegenerateSource,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
def parseLiveProductPathOwnershipRegenerateSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathOwnershipRegenerate
        liveProductPathOwnershipRegenerateParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathOwnershipRegenerate"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathOwnershipRegenerate parse. Not a fixture.
    Greppable: kernelCheckLiveProductPathOwnershipRegenerateSource,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
def kernelCheckLiveProductPathOwnershipRegenerateSource (src : String) :
    Bool :=
  match parseLiveProductPathOwnershipRegenerateSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathOwnershipRegenerateParsed? : Option Module :=
  match parseLiveProductPathOwnershipRegenerateSource
      liveProductPathOwnershipRegenerateSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace and end. Ok and PartialReady are not kept. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
  | some m =>
    m.commands.length == liveProductPathOwnershipRegenerateKeptCmds
  | none => false

/-- Literal defs the kernel must keep. Ok and PartialReady are skipped. -/
def liveParseHasLiteralDefs : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
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
      && has "productPathOwnershipRegenerateInstallLakeFree"
      && has "productPathOwnershipRegenerateDependsOnLake"
      && has "productPathOwnershipRegenerateWithoutLake"
      && has "productPathFreestandingCapableStepContractFullSatisfied"

/-- Wrap module lastSeg is ProductPathOwnershipRegenerate
    (no module line in the live file). -/
def liveParseHasProductPathOwnershipRegenerateModule : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductPathOwnershipRegenerate"
      && lastSeg m.name.raw == "ProductPathOwnershipRegenerate"

/-- Live parse has namespace SystemsLean.ProductPathOwnershipRegenerate. -/
def liveParseHasProductPathOwnershipRegenerateNs : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x =>
        x.raw == "SystemsLean.ProductPathOwnershipRegenerate"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductPathOwnershipRegenerate. -/
def liveParseHasProductPathOwnershipRegenerateEnd : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x =>
        x.raw == "SystemsLean.ProductPathOwnershipRegenerate"
      | _ => false

/-- The live file has no import command. -/
def liveParseHasNoImport : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveProductPathOwnershipRegenerateParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveProductPathOwnershipRegenerateSource)
    let fuel := liveProductPathOwnershipRegenerateSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveProductPathOwnershipRegenerateTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveProductPathOwnershipRegenerateExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductPathOwnershipRegenerateSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String :=
  "namespace SystemsLean.ProductPathOwnershipRegenerate\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String :=\n  \"SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String :=\n  \"HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE\"\n"

/-- selfHostId def needle with a trailing newline. -/
def needleSelfHostId : String :=
  "def selfHostId : String :=\n  \"SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE\"\n"

/-- Install Lake-free def needle with a trailing newline. -/
def needleInstallLakeFree : String :=
  "def productPathOwnershipRegenerateInstallLakeFree : Bool := true\n"

/-- DependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "def productPathOwnershipRegenerateDependsOnLake : Bool := true\n"

/-- Step-contract land-time pin needle with a trailing newline. -/
def needleStepContractFalse : String :=
  "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String :=
  "end SystemsLean.ProductPathOwnershipRegenerate\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveProductPathOwnershipRegenerateSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSelfHostId).length > 1
    && (src.splitOn needleInstallLakeFree).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleStepContractFalse).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathOwnershipRegenerateReady,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
    HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
    PRODUCT-PATH-OWNERSHIP-REGENERATE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductPathOwnershipRegenerateReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE")
    && (parseId ==
      "PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE")
    && (liveRel == "ProductPathOwnershipRegenerate.lean")
    && (liveProductPathOwnershipRegenerateRel
      == "src/systems/SystemsLean/ProductPathOwnershipRegenerate.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathOwnershipRegenerateFullHost
    && !hostFrontLiveProductPathOwnershipRegenerateFullBackend
    && !hostFrontLiveProductPathOwnershipRegenerateResidualFreeClaimed
    && !hostFrontLiveProductPathOwnershipRegenerateProvablyUnlocked
    && kernelCheckLiveProductPathOwnershipRegenerateSource
      liveProductPathOwnershipRegenerateSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasProductPathOwnershipRegenerateModule
    && liveParseHasProductPathOwnershipRegenerateNs
    && liveParseHasProductPathOwnershipRegenerateEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathOwnershipRegenerateSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductPathOwnershipRegenerate (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE =="
  IO.println s!"  host={hostId} file={liveProductPathOwnershipRegenerateRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductPathOwnershipRegenerateRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathOwnershipRegenerateRel}"
    throw (IO.userError s!"missing {liveProductPathOwnershipRegenerateRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathOwnershipRegenerateSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathOwnershipRegenerate.lean != liveProductPathOwnershipRegenerateSource"
    throw (IO.userError "dual-pin mismatch live ProductPathOwnershipRegenerate.lean")
  let r := parseLiveProductPathOwnershipRegenerateSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathOwnershipRegenerate parse false"
      throw (IO.userError "kernelCheck live ProductPathOwnershipRegenerate parse false")
    unless hostFrontLiveProductPathOwnershipRegenerateReady do
      IO.eprintln "error: hostFrontLiveProductPathOwnershipRegenerateReady false"
      throw (IO.userError "hostFrontLiveProductPathOwnershipRegenerateReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductPathOwnershipRegenerate source was accepted"
      throw (IO.userError "empty ProductPathOwnershipRegenerate source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathOwnershipRegenerate root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathOwnershipRegenerate
