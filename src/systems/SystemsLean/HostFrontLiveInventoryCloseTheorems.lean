/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/InventoryCloseTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveInventoryCloseTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveInventoryCloseSource. Not occupancy leftover InventoryCloseTerm.
  Not live HostModuleCheckInventoryCloseTerm.lean.
  Not HostFrontLiveInventoryClose (that wrap parses InventoryClose.lean).
  Prefix: import SystemsLean.HostFrontLiveInventoryClose is a prefix of
  import SystemsLean.HostFrontLiveInventoryCloseTheorems; dest needles need a
  trailing newline.

  Spec (readable):
  - parseLiveInventoryCloseTheoremsSource turns live InventoryCloseTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.InventoryCloseTheorems even without a module line.
  - kernelCheckLiveInventoryCloseTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Theorem, example, and set_option tails are skip-folded. There are no
    kernelable defs in this live file. Kept commands are three dotted
    imports, namespace, and end. Skip-head still sees theorem stageId_eq
    or hostInventoryCloseId_eq. private is not isCmdKw: drop the private
    token then skip/drop the following def via cmdBodyKnown or skipUntilCmd.
    Do not import InventoryClose.lean. The three live imports are
    Cmd.importModule only.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear.lean / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-INVENTORY-CLOSE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_THEOREMS_V0,
  PARSE-LIVE-INVENTORY-CLOSE-THEOREMS,
  parseLiveInventoryCloseTheoremsSource,
  kernelCheckLiveInventoryCloseTheoremsSource,
  hostFrontLiveInventoryCloseTheoremsReady, liveInventoryCloseTheoremsSource,
  liveInventoryCloseTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveInventoryCloseTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveInventoryCloseTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveInventoryCloseTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveInventoryCloseTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-INVENTORY-CLOSE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-INVENTORY-CLOSE-THEOREMS"

/-- Bare basename. No slash. The path string below stays repo-relative. -/
def liveRel : String := "InventoryCloseTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveInventoryCloseTheoremsRel : String :=
  "src/systems/SystemsLean/InventoryCloseTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveInventoryCloseTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveInventoryCloseTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveInventoryCloseTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveInventoryCloseTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveInventoryCloseTheoremsSkipFuel : Nat := 8192

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
def cmdAddsInventoryCloseTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownInventoryCloseTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInventoryCloseTheoremsParseFuel body
        && termNoAppN liveInventoryCloseTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInventoryCloseTheoremsParseFuel body
        && termNoAppN liveInventoryCloseTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdInventoryCloseTheorems (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / open / private /
    un-kernelable. private is not isCmdKw. -/
def parseCmdsInventoryCloseTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdInventoryCloseTheorems liveInventoryCloseTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveInventoryCloseTheoremsSkipFuel rest
      if cmdBodyKnownInventoryCloseTheorems kn c then
        parseCmdsInventoryCloseTheorems n rest2
          (kn ++ cmdAddsInventoryCloseTheorems c) (acc ++ [c])
      else
        parseCmdsInventoryCloseTheorems n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsInventoryCloseTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveInventoryCloseTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsInventoryCloseTheorems n rest2 kn acc
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

/-- Parse live InventoryCloseTheorems.lean text.
    Greppable: parseLiveInventoryCloseTheoremsSource,
    PARSE-LIVE-INVENTORY-CLOSE-THEOREMS. -/
def parseLiveInventoryCloseTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsInventoryCloseTheorems liveInventoryCloseTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.InventoryCloseTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live InventoryCloseTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveInventoryCloseTheoremsSource,
    PARSE-LIVE-INVENTORY-CLOSE-THEOREMS. -/
def kernelCheckLiveInventoryCloseTheoremsSource (src : String) : Bool :=
  match parseLiveInventoryCloseTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveInventoryCloseTheoremsParsed? : Option Module :=
  match parseLiveInventoryCloseTheoremsSource liveInventoryCloseTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveInventoryCloseTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Theorems are skip-folded.
    Three dotted imports plus namespace plus end. No kernelable defs.
    Do not require a kept Cmd.def_. -/
def liveParseCmdCountOk : Bool :=
  match liveInventoryCloseTheoremsParsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Wrap module lastSeg is InventoryCloseTheorems (no module line in the live file). -/
def liveParseHasInventoryCloseTheoremsModule : Bool :=
  match liveInventoryCloseTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "InventoryCloseTheorems"

/-- Live parse has the living InventoryClose namespace command. -/
def liveParseHasInventoryCloseNs : Bool :=
  match liveInventoryCloseTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "InventoryClose"
      | _ => false

/-- Skip-head: theorem stageId_eq or hostInventoryCloseId_eq is in the live text.
    Do not require kept Cmd.def_. Theorems are skip-folded. -/
def liveParseHasCoreDefs : Bool :=
  match liveInventoryCloseTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveInventoryCloseTheoremsSource)
    toksHaveTheoremNamed liveInventoryCloseTheoremsSkipFuel toks "stageId_eq"
      || toksHaveTheoremNamed liveInventoryCloseTheoremsSkipFuel toks
        "hostInventoryCloseId_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveInventoryCloseTheoremsReady,
    PARSE-LIVE-INVENTORY-CLOSE-THEOREMS,
    HOST-FRONT-LIVE-INVENTORY-CLOSE-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveInventoryCloseTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-INVENTORY-CLOSE-THEOREMS")
    && (parseId == "PARSE-LIVE-INVENTORY-CLOSE-THEOREMS")
    && (liveRel == "InventoryCloseTheorems.lean")
    && (liveInventoryCloseTheoremsRel
      == "src/systems/SystemsLean/InventoryCloseTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveInventoryCloseTheoremsFullHost
    && !hostFrontLiveInventoryCloseTheoremsResidualFreeClaimed
    && !hostFrontLiveInventoryCloseTheoremsProvablyUnlocked
    && kernelCheckLiveInventoryCloseTheoremsSource liveInventoryCloseTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasInventoryCloseNs
    && liveParseHasInventoryCloseTheoremsModule
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveInventoryCloseTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveInventoryCloseTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-INVENTORY-CLOSE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveInventoryCloseTheoremsRel}"
  let path := root / liveInventoryCloseTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveInventoryCloseTheoremsRel}"
    throw (IO.userError s!"missing {liveInventoryCloseTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveInventoryCloseTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk InventoryCloseTheorems.lean != liveInventoryCloseTheoremsSource"
    throw (IO.userError "dual-pin mismatch live InventoryCloseTheorems.lean")
  let r := parseLiveInventoryCloseTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-INVENTORY-CLOSE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-INVENTORY-CLOSE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-INVENTORY-CLOSE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live InventoryCloseTheorems parse false"
      throw (IO.userError "kernelCheck live InventoryCloseTheorems parse false")
    unless hostFrontLiveInventoryCloseTheoremsReady do
      IO.eprintln "error: hostFrontLiveInventoryCloseTheoremsReady false"
      throw (IO.userError "hostFrontLiveInventoryCloseTheoremsReady false")
    IO.println s!"GREEN {stageId}: live InventoryCloseTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveInventoryCloseTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveInventoryCloseTheorems
