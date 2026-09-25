/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/InventoryClose.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is InventoryClose.lean. It is not InventoryCloseTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def productSelfHostCompleteClaimed is true.
  That def is not this wrap's complete claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-INVENTORY-CLOSE,
  SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_V0,
  PARSE-LIVE-INVENTORY-CLOSE, liveRel,
  kernelCheckLiveInventoryCloseSource,
  hostFrontLiveInventoryCloseReady.
  Module: SystemsLean.HostFrontLiveInventoryClose
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveInventoryCloseSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveInventoryClose

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-INVENTORY-CLOSE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-INVENTORY-CLOSE"

/-- Live file basename. -/
def liveRel : String := "InventoryClose.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveInventoryCloseRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveInventoryCloseFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    Inventory close does not unlock a backend. -/
def hostFrontLiveInventoryCloseFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveInventoryCloseResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveInventoryCloseProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveInventoryCloseParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveInventoryCloseSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable defs, and end.
    A count of 4 would drop the literal defs. From InventoryClose.lean. -/
def liveInventoryCloseKeptCmds : Nat := 20

/-- theorem keyword count. InventoryClose.lean has no theorem. -/
def liveInventoryCloseTheoremCount : Nat := 0

/-- example keyword count. InventoryClose.lean has no example. -/
def liveInventoryCloseExampleCount : Nat := 0

/-- set_option keyword count. InventoryClose.lean has no set_option. -/
def liveInventoryCloseSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . InventoryClose`. -/
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
def cmdAddsInventoryClose (c : Cmd) : List String :=
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
def cmdBodyKnownInventoryClose (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInventoryCloseParseFuel body
        && termNoAppN liveInventoryCloseParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInventoryCloseParseFuel body
        && termNoAppN liveInventoryCloseParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdInventoryClose (fuel : Nat) (toks : List String) :
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
def parseCmdsInventoryClose : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdInventoryClose liveInventoryCloseParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveInventoryCloseSkipFuel rest
      if cmdBodyKnownInventoryClose kn c then
        parseCmdsInventoryClose n rest2
          (kn ++ cmdAddsInventoryClose c) (acc ++ [c])
      else
        parseCmdsInventoryClose n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveInventoryCloseSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsInventoryClose n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live InventoryClose.lean text.
    Greppable: parseLiveInventoryCloseSource,
    PARSE-LIVE-INVENTORY-CLOSE. -/
def parseLiveInventoryCloseSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsInventoryClose liveInventoryCloseParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.InventoryClose"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live InventoryClose parse. Not a fixture.
    Greppable: kernelCheckLiveInventoryCloseSource,
    PARSE-LIVE-INVENTORY-CLOSE. -/
def kernelCheckLiveInventoryCloseSource (src : String) : Bool :=
  match parseLiveInventoryCloseSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveInventoryCloseParsed? : Option Module :=
  match parseLiveInventoryCloseSource liveInventoryCloseSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveInventoryCloseParsed? with
  | some m => m.commands.length == liveInventoryCloseKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostInventoryCloseId,
    residualFreeClaimed, productSelfHostCompleteClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostInventoryCloseId"
      && has "residualFreeClaimed"
      && has "productSelfHostCompleteClaimed"

/-- Wrap module lastSeg is InventoryClose (no module line in the live file). -/
def liveParseHasInventoryCloseModule : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.InventoryClose"
      && lastSeg m.name.raw == "InventoryClose"

/-- Live parse has namespace SystemsLean.InventoryClose. -/
def liveParseHasInventoryCloseNs : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.InventoryClose"
      | _ => false

/-- Live parse ends namespace SystemsLean.InventoryClose. -/
def liveParseHasInventoryCloseEnd : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.InventoryClose"
      | _ => false

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.SelfApplyFs"
      | _ => false

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveInventoryCloseParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveInventoryCloseSource)
    let fuel := liveInventoryCloseSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveInventoryCloseTheoremCount
      && toksCountKw fuel toks "example" 0 == liveInventoryCloseExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveInventoryCloseSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportSelfApplyFs : String := "import SystemsLean.SelfApplyFs\n"

/-- Second import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.InventoryClose\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_INVENTORY_CLOSE_V0\"\n"

/-- hostInventoryCloseId def needle with a trailing newline. -/
def needleHostInventoryCloseId : String :=
  "def hostInventoryCloseId : String := \"HOST-INVENTORY-CLOSE\"\n"

/-- residualFreeClaimed def needle with a trailing newline. -/
def needleResidualFree : String := "def residualFreeClaimed : Bool := false\n"

/-- productSelfHostCompleteClaimed def needle with a trailing newline. -/
def needleProductComplete : String :=
  "def productSelfHostCompleteClaimed : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.InventoryClose\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.InventoryClose. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveInventoryCloseSource
  (src.splitOn needleImportSelfApplyFs).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostInventoryCloseId).length > 1
    && (src.splitOn needleResidualFree).length > 1
    && (src.splitOn needleProductComplete).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveInventoryCloseReady,
    PARSE-LIVE-INVENTORY-CLOSE,
    HOST-FRONT-LIVE-INVENTORY-CLOSE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveInventoryCloseReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_V0")
    && (hostId == "HOST-FRONT-LIVE-INVENTORY-CLOSE")
    && (parseId == "PARSE-LIVE-INVENTORY-CLOSE")
    && (liveRel == "InventoryClose.lean")
    && (liveInventoryCloseRel
      == "src/systems/SystemsLean/InventoryClose.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveInventoryCloseFullHost
    && !hostFrontLiveInventoryCloseFullBackend
    && !hostFrontLiveInventoryCloseResidualFreeClaimed
    && !hostFrontLiveInventoryCloseProvablyUnlocked
    && kernelCheckLiveInventoryCloseSource liveInventoryCloseSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasInventoryCloseModule
    && liveParseHasInventoryCloseNs
    && liveParseHasInventoryCloseEnd
    && liveParseHasSelfApplyFsImport
    && liveParseHasLlvmHoldImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveInventoryCloseSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveInventoryClose (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-INVENTORY-CLOSE =="
  IO.println s!"  host={hostId} file={liveInventoryCloseRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveInventoryCloseRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveInventoryCloseRel}"
    throw (IO.userError s!"missing {liveInventoryCloseRel}")
  let disk <- IO.FS.readFile path
  if disk != liveInventoryCloseSource then
    IO.eprintln "error: dual-pin mismatch: on-disk InventoryClose.lean != liveInventoryCloseSource"
    throw (IO.userError "dual-pin mismatch live InventoryClose.lean")
  let r := parseLiveInventoryCloseSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-INVENTORY-CLOSE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-INVENTORY-CLOSE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-INVENTORY-CLOSE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live InventoryClose parse false"
      throw (IO.userError "kernelCheck live InventoryClose parse false")
    unless hostFrontLiveInventoryCloseReady do
      IO.eprintln "error: hostFrontLiveInventoryCloseReady false"
      throw (IO.userError "hostFrontLiveInventoryCloseReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty InventoryClose source was accepted"
      throw (IO.userError "empty InventoryClose source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveInventoryClose root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveInventoryClose
