/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/RustIrInterop.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Not a Rust toolchain. Not an LLVM backend. Not FullBackend.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-RUST-IR-INTEROP,
  SLAKE_HOST_FRONT_LIVE_RUST_IR_INTEROP_V0,
  PARSE-LIVE-RUST-IR-INTEROP, RUST-IR-INTEROP, liveRel,
  kernelCheckLiveRustIrInteropSource,
  hostFrontLiveRustIrInteropReady.
  Module: SystemsLean.HostFrontLiveRustIrInterop
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveRustIrInteropSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveRustIrInterop

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_RUST_IR_INTEROP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-RUST-IR-INTEROP"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-RUST-IR-INTEROP"

/-- Live file basename. -/
def liveRel : String := "RustIrInterop.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRustIrInteropRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveRustIrInteropFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveRustIrInteropResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveRustIrInteropProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveRustIrInteropParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option / open / un-kernelable tails. -/
def liveRustIrInteropSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . RustIrInterop`. -/
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
def cmdAddsRustIrInterop (c : Cmd) : List String :=
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
def cmdBodyKnownRustIrInterop (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRustIrInteropParseFuel body
        && termNoAppN liveRustIrInteropParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRustIrInteropParseFuel body
        && termNoAppN liveRustIrInteropParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdRustIrInterop (fuel : Nat) (toks : List String) :
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
def parseCmdsRustIrInterop : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdRustIrInterop liveRustIrInteropParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveRustIrInteropSkipFuel rest
      if cmdBodyKnownRustIrInterop kn c then
        parseCmdsRustIrInterop n rest2
          (kn ++ cmdAddsRustIrInterop c) (acc ++ [c])
      else
        parseCmdsRustIrInterop n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveRustIrInteropSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsRustIrInterop n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live RustIrInterop.lean text.
    Greppable: parseLiveRustIrInteropSource,
    PARSE-LIVE-RUST-IR-INTEROP. -/
def parseLiveRustIrInteropSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsRustIrInterop liveRustIrInteropParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.RustIrInterop"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live RustIrInterop parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveRustIrInteropSource,
    PARSE-LIVE-RUST-IR-INTEROP. -/
def kernelCheckLiveRustIrInteropSource (src : String) : Bool :=
  match parseLiveRustIrInteropSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveRustIrInteropParsed? : Option Module :=
  match parseLiveRustIrInteropSource liveRustIrInteropSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveRustIrInteropParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end / literal defs).
    Real lower bound, not hardcoded true. Un-kernelable bodies skipped.
    Seven imports, namespace, end, and kernelable literal defs. -/
def liveParseCmdCountOk : Bool :=
  match liveRustIrInteropParsed? with
  | some m => m.commands.length >= 9
  | none => false

/-- Wrap module lastSeg is RustIrInterop (no module line in the live file). -/
def liveParseHasRustIrInteropModule : Bool :=
  match liveRustIrInteropParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "RustIrInterop"

/-- Live parse has the living RustIrInterop namespace command. -/
def liveParseHasRustIrInteropNs : Bool :=
  match liveRustIrInteropParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "RustIrInterop"
      | _ => false

/-- Skip-head still sees def stageId, def rustIrInteropFullBackendClaimed,
    and theorem rustIrInteropFullBackendClaimed_false. Theorems, examples,
    open, and dotted / && bodies are skipped. -/
def liveParseHasCoreDefs : Bool :=
  match liveRustIrInteropParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveRustIrInteropSource)
    toksHaveDefNamed liveRustIrInteropSkipFuel toks "stageId"
      && toksHaveDefNamed liveRustIrInteropSkipFuel toks
        "rustIrInteropFullBackendClaimed"
      && toksHaveTheoremNamed liveRustIrInteropSkipFuel toks
        "rustIrInteropFullBackendClaimed_false"

/-- Unique needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.RustIrInterop\n"

/-- def stageId needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_RUST_IR_INTEROP_PARTIAL_V0\"\n"

/-- def rustIrInteropFullBackendClaimed needle with a trailing newline. -/
def needleFullBackendFalse : String :=
  "def rustIrInteropFullBackendClaimed : Bool := false\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveRustIrInteropSource
  (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleFullBackendFalse).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveRustIrInteropReady,
    PARSE-LIVE-RUST-IR-INTEROP,
    HOST-FRONT-LIVE-RUST-IR-INTEROP.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. Not a Rust toolchain. Not an LLVM backend.
    Not FullBackend. -/
def hostFrontLiveRustIrInteropReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_RUST_IR_INTEROP_V0")
    && (hostId == "HOST-FRONT-LIVE-RUST-IR-INTEROP")
    && (parseId == "PARSE-LIVE-RUST-IR-INTEROP")
    && (liveRel == "RustIrInterop.lean")
    && (liveRustIrInteropRel
      == "src/systems/SystemsLean/RustIrInterop.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveRustIrInteropFullHost
    && !hostFrontLiveRustIrInteropResidualFreeClaimed
    && !hostFrontLiveRustIrInteropProvablyUnlocked
    && kernelCheckLiveRustIrInteropSource liveRustIrInteropSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasRustIrInteropNs
    && liveParseHasRustIrInteropModule
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveRustIrInteropSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveRustIrInterop (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-RUST-IR-INTEROP =="
  IO.println s!"  host={hostId} file={liveRustIrInteropRel}"
  let path := root / liveRustIrInteropRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRustIrInteropRel}"
    throw (IO.userError s!"missing {liveRustIrInteropRel}")
  let disk <- IO.FS.readFile path
  if disk != liveRustIrInteropSource then
    IO.eprintln "error: dual-pin mismatch: on-disk RustIrInterop.lean != liveRustIrInteropSource"
    throw (IO.userError "dual-pin mismatch live RustIrInterop.lean")
  let r := parseLiveRustIrInteropSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-RUST-IR-INTEROP reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-RUST-IR-INTEROP reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-RUST-IR-INTEROP ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live RustIrInterop parse false"
      throw (IO.userError "kernelCheck live RustIrInterop parse false")
    unless hostFrontLiveRustIrInteropReady do
      IO.eprintln "error: hostFrontLiveRustIrInteropReady false"
      throw (IO.userError "hostFrontLiveRustIrInteropReady false")
    IO.println s!"GREEN {stageId}: live RustIrInterop.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveRustIrInterop root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveRustIrInterop
