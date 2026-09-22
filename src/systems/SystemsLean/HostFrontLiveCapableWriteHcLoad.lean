/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableWriteHcLoad.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is CapableWriteHcLoad.lean. It is not CapableWriteHc.lean.
  The live namespace is SystemsLean.CapableWriteHc. There is no module line.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Structures are skipped. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Hyphenated stage id from the product name CapableWriteHcLoad.
  Product gate DUAL-SSOT-EQUALITY stays a live needle. No nix presence token.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-WRITE-HC-LOAD,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_LOAD_V0,
  PARSE-LIVE-CAPABLE-WRITE-HC-LOAD, DUAL-SSOT-EQUALITY, liveRel,
  kernelCheckLiveCapableWriteHcLoadSource,
  hostFrontLiveCapableWriteHcLoadReady.
  Module: SystemsLean.HostFrontLiveCapableWriteHcLoad
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableWriteHcLoadSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableWriteHcLoad

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_LOAD_V0"

/-- Greppable host map id. Hyphenated from CapableWriteHcLoad. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-WRITE-HC-LOAD"

/-- Greppable parse id. Hyphenated from CapableWriteHcLoad. -/
def parseId : String := "PARSE-LIVE-CAPABLE-WRITE-HC-LOAD"

/-- Live file basename. -/
def liveRel : String := "CapableWriteHcLoad.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableWriteHcLoadRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableWriteHcLoadFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableWriteHcLoadFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableWriteHcLoadResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableWriteHcLoadProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableWriteHcLoadParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveCapableWriteHcLoadSkipFuel : Nat := 8192

/-- Kept commands: 20 imports, namespace, three literal string defs, and end.
    From CapableWriteHcLoad.lean. A count of 4 would drop the literal defs. -/
def liveCapableWriteHcLoadKeptCmds : Nat := 25

/-- theorem keyword count. CapableWriteHcLoad.lean has no theorem. -/
def liveCapableWriteHcLoadTheoremCount : Nat := 0

/-- example keyword count. CapableWriteHcLoad.lean has no example. -/
def liveCapableWriteHcLoadExampleCount : Nat := 0

/-- set_option keyword count. CapableWriteHcLoad.lean has no set_option. -/
def liveCapableWriteHcLoadSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . CapableWriteHc`. -/
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
def cmdAddsCapableWriteHcLoad (c : Cmd) : List String :=
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
def cmdBodyKnownCapableWriteHcLoad (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableWriteHcLoadParseFuel body
        && termNoAppN liveCapableWriteHcLoadParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableWriteHcLoadParseFuel body
        && termNoAppN liveCapableWriteHcLoadParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableWriteHcLoad (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableWriteHcLoad : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableWriteHcLoad liveCapableWriteHcLoadParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableWriteHcLoadSkipFuel rest
      if cmdBodyKnownCapableWriteHcLoad kn c then
        parseCmdsCapableWriteHcLoad n rest2
          (kn ++ cmdAddsCapableWriteHcLoad c) (acc ++ [c])
      else
        parseCmdsCapableWriteHcLoad n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableWriteHcLoadSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableWriteHcLoad n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live CapableWriteHcLoad.lean text.
    Greppable: parseLiveCapableWriteHcLoadSource,
    PARSE-LIVE-CAPABLE-WRITE-HC-LOAD. -/
def parseLiveCapableWriteHcLoadSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableWriteHcLoad liveCapableWriteHcLoadParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableWriteHc"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableWriteHcLoad parse. Not a fixture.
    Greppable: kernelCheckLiveCapableWriteHcLoadSource,
    PARSE-LIVE-CAPABLE-WRITE-HC-LOAD. -/
def kernelCheckLiveCapableWriteHcLoadSource (src : String) : Bool :=
  match parseLiveCapableWriteHcLoadSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableWriteHcLoadParsed? : Option Module :=
  match parseLiveCapableWriteHcLoadSource liveCapableWriteHcLoadSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | some m => m.commands.length == liveCapableWriteHcLoadKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, dualEqualityGateId,
    expectedEmptyFragment. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "dualEqualityGateId"
      && has "expectedEmptyFragment"

/-- Wrap module lastSeg is CapableWriteHc (no module line in the live file).
    The file basename is CapableWriteHcLoad.lean. The namespace is
    SystemsLean.CapableWriteHc. -/
def liveParseHasCapableWriteHcModule : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableWriteHc"
      && lastSeg m.name.raw == "CapableWriteHc"

/-- Live parse has namespace SystemsLean.CapableWriteHc. -/
def liveParseHasCapableWriteHcNs : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableWriteHc"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableWriteHc. -/
def liveParseHasCapableWriteHcEnd : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableWriteHc"
      | _ => false

/-- Live parse imports SystemsLean.EmitBanner. -/
def liveParseHasEmitBannerImport : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitBanner"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableWriteHcLoadParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableWriteHcLoadSource)
    let fuel := liveCapableWriteHcLoadSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableWriteHcLoadTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableWriteHcLoadExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableWriteHcLoadSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportEmitBanner : String := "import SystemsLean.EmitBanner\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableWriteHc\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String := "def stageId : String :=\n"

/-- Product stage id value line. Two spaces, trailing newline. -/
def needleStageIdValue : String :=
  "  \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0\"\n"

/-- dualEqualityGateId def needle with a trailing newline.
    Product token DUAL-SSOT-EQUALITY. -/
def needleDualEqualityGateId : String :=
  "def dualEqualityGateId : String := \"DUAL-SSOT-EQUALITY\"\n"

/-- expectedEmptyFragment def needle with a trailing newline. -/
def needleExpectedEmptyFragment : String :=
  "def expectedEmptyFragment : String := \"/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableWriteHc\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableWriteHcLoadSource
  (src.splitOn needleImportEmitBanner).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleStageIdValue).length > 1
    && (src.splitOn needleDualEqualityGateId).length > 1
    && (src.splitOn needleExpectedEmptyFragment).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableWriteHcLoadReady,
    PARSE-LIVE-CAPABLE-WRITE-HC-LOAD,
    HOST-FRONT-LIVE-CAPABLE-WRITE-HC-LOAD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableWriteHcLoadReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_LOAD_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-WRITE-HC-LOAD")
    && (parseId == "PARSE-LIVE-CAPABLE-WRITE-HC-LOAD")
    && (liveRel == "CapableWriteHcLoad.lean")
    && (liveCapableWriteHcLoadRel
      == "src/systems/SystemsLean/CapableWriteHcLoad.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableWriteHcLoadFullHost
    && !hostFrontLiveCapableWriteHcLoadFullBackend
    && !hostFrontLiveCapableWriteHcLoadResidualFreeClaimed
    && !hostFrontLiveCapableWriteHcLoadProvablyUnlocked
    && kernelCheckLiveCapableWriteHcLoadSource liveCapableWriteHcLoadSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasCapableWriteHcModule
    && liveParseHasCapableWriteHcNs
    && liveParseHasCapableWriteHcEnd
    && liveParseHasEmitBannerImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableWriteHcLoadSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableWriteHcLoad (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-WRITE-HC-LOAD =="
  IO.println s!"  host={hostId} file={liveCapableWriteHcLoadRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableWriteHcLoadRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableWriteHcLoadRel}"
    throw (IO.userError s!"missing {liveCapableWriteHcLoadRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableWriteHcLoadSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableWriteHcLoad.lean != liveCapableWriteHcLoadSource"
    throw (IO.userError "dual-pin mismatch live CapableWriteHcLoad.lean")
  let r := parseLiveCapableWriteHcLoadSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-WRITE-HC-LOAD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-WRITE-HC-LOAD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-WRITE-HC-LOAD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableWriteHcLoad parse false"
      throw (IO.userError "kernelCheck live CapableWriteHcLoad parse false")
    unless hostFrontLiveCapableWriteHcLoadReady do
      IO.eprintln "error: hostFrontLiveCapableWriteHcLoadReady false"
      throw (IO.userError "hostFrontLiveCapableWriteHcLoadReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableWriteHcLoad source was accepted"
      throw (IO.userError "empty CapableWriteHcLoad source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableWriteHcLoad root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableWriteHcLoad
