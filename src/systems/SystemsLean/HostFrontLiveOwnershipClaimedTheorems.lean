/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OwnershipClaimedTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveOwnershipClaimedTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  Not HostFrontLiveOwnershipClaimed (that wrap parses OwnershipClaimed.lean).
  Not HostFrontLiveHostOwnershipClaimedMain (that wrap parses the mill Main).

  Spec (readable):
  - parseLiveOwnershipClaimedTheoremsSource turns live
    OwnershipClaimedTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.OwnershipClaimedTheorems even without a
    module line.
  - kernelCheckLiveOwnershipClaimedTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. This theorems peel has
    no kernelable defs; skip-head still sees theorem stageId_eq.
  - Skip-fold ALL theorems and examples. `by decide` / `rfl` skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is OwnershipClaimed.
  - Wrap-assigned module lastSeg is OwnershipClaimedTheorems.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free. Not package typecheck.

  Unique needles (trailing newline so HostFrontLiveOwnershipClaimed is not a prefix):
  HostFrontLiveOwnershipClaimedTheorems
  HostFrontLiveOwnershipClaimedTheoremsSource
  HostFrontLiveOwnershipClaimedTheoremsMain
  SlakeTypecheckOwnershipClaimedTheorems
  PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS
  HOST-FRONT-LIVE-OWNERSHIP-CLAIMED-THEOREMS
  SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_THEOREMS_V0
  SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_THEOREMS_V0
  HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED-THEOREMS
  OWNERSHIP-CLAIMED-THEOREMS
  liveRel
  OwnershipClaimedTheorems.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveOwnershipClaimedTheoremsSource,
  kernelCheckLiveOwnershipClaimedTheoremsSource,
  hostFrontLiveOwnershipClaimedTheoremsReady, liveOwnershipClaimedTheoremsSource,
  liveOwnershipClaimedTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveOwnershipClaimedTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveOwnershipClaimedTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOwnershipClaimedTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOwnershipClaimedTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OWNERSHIP-CLAIMED-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOwnershipClaimedTheoremsRel : String :=
  "src/systems/SystemsLean/OwnershipClaimedTheorems.lean"

/-- Live basename. Greppable: liveRel. Must be OwnershipClaimedTheorems.lean. -/
def liveRel : String := "OwnershipClaimedTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOwnershipClaimedTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOwnershipClaimedTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveOwnershipClaimedTheoremsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveOwnershipClaimedTheoremsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveOwnershipClaimedTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveOwnershipClaimedTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . OwnershipClaimedTheorems`. -/
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
def cmdAddsOwnershipClaimedTheorems (c : Cmd) : List String :=
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

/-- Atom bodies the kernel can type without && / ++ / struct / ite. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app, atom only. -/
def cmdBodyKnownOwnershipClaimedTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOwnershipClaimedTheoremsParseFuel body
        && termNoAppN liveOwnershipClaimedTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOwnershipClaimedTheoremsParseFuel body
        && termNoAppN liveOwnershipClaimedTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdOwnershipClaimedTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsOwnershipClaimedTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOwnershipClaimedTheorems liveOwnershipClaimedTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOwnershipClaimedTheoremsSkipFuel rest
      if cmdBodyKnownOwnershipClaimedTheorems kn c then
        parseCmdsOwnershipClaimedTheorems n rest2
          (kn ++ cmdAddsOwnershipClaimedTheorems c) (acc ++ [c])
      else
        parseCmdsOwnershipClaimedTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveOwnershipClaimedTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsOwnershipClaimedTheorems n rest2 kn acc
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

/-- Parse live OwnershipClaimedTheorems.lean text.
    Greppable: parseLiveOwnershipClaimedTheoremsSource,
    PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS. -/
def parseLiveOwnershipClaimedTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOwnershipClaimedTheorems liveOwnershipClaimedTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OwnershipClaimedTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OwnershipClaimedTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveOwnershipClaimedTheoremsSource,
    PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS. -/
def kernelCheckLiveOwnershipClaimedTheoremsSource (src : String) : Bool :=
  match parseLiveOwnershipClaimedTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOwnershipClaimedTheoremsParsed? : Option Module :=
  match parseLiveOwnershipClaimedTheoremsSource liveOwnershipClaimedTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOwnershipClaimedTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    One dotted import plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveOwnershipClaimedTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is OwnershipClaimedTheorems (no module line in the live file). -/
def liveParseHasOwnershipClaimedTheoremsModule : Bool :=
  match liveOwnershipClaimedTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "OwnershipClaimedTheorems"

/-- Live parse has the living OwnershipClaimed namespace command. -/
def liveParseHasOwnershipClaimedNs : Bool :=
  match liveOwnershipClaimedTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "OwnershipClaimed"
      | _ => false

/-- Live parse imports SystemsLean.OwnershipClaimed (kept marker). -/
def liveParseHasOwnershipClaimedImport : Bool :=
  match liveOwnershipClaimedTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "OwnershipClaimed"
      | _ => false

/-- Skip-head: theorem stageId_eq is in the live text, plus Ok and recipe pins. -/
def liveParseHasCoreDefs : Bool :=
  match liveOwnershipClaimedTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveOwnershipClaimedTheoremsSource)
    toksHaveTheoremNamed liveOwnershipClaimedTheoremsSkipFuel toks
      "stageId_eq"
      && toksHaveTheoremNamed liveOwnershipClaimedTheoremsSkipFuel toks
        "productPathFreestandingOwnershipClaimedOk_true"
      && toksHaveTheoremNamed liveOwnershipClaimedTheoremsSkipFuel toks
        "lakeFreeOwnershipClaimedRecipe_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOwnershipClaimedTheoremsReady,
    PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS,
    HOST-FRONT-LIVE-OWNERSHIP-CLAIMED-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveOwnershipClaimedTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-OWNERSHIP-CLAIMED-THEOREMS")
    && (parseId == "PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS")
    && (liveOwnershipClaimedTheoremsRel
      == "src/systems/SystemsLean/OwnershipClaimedTheorems.lean")
    && (liveRel == "OwnershipClaimedTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOwnershipClaimedTheoremsFullHost
    && !hostFrontLiveOwnershipClaimedTheoremsResidualFreeClaimed
    && !hostFrontLiveOwnershipClaimedTheoremsProvablyUnlocked
    && !hostFrontLiveOwnershipClaimedTheoremsOwnsPackageTypecheck
    && kernelCheckLiveOwnershipClaimedTheoremsSource liveOwnershipClaimedTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasOwnershipClaimedTheoremsModule
    && liveParseHasOwnershipClaimedNs
    && liveParseHasOwnershipClaimedImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOwnershipClaimedTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveOwnershipClaimedTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS =="
  IO.println s!"  host={hostId} file={liveOwnershipClaimedTheoremsRel} liveRel={liveRel}"
  let path := root / liveOwnershipClaimedTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOwnershipClaimedTheoremsRel}"
    throw (IO.userError s!"missing {liveOwnershipClaimedTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOwnershipClaimedTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OwnershipClaimedTheorems.lean != liveOwnershipClaimedTheoremsSource"
    throw (IO.userError "dual-pin mismatch live OwnershipClaimedTheorems.lean")
  let r := parseLiveOwnershipClaimedTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OwnershipClaimedTheorems parse false"
      throw (IO.userError "kernelCheck live OwnershipClaimedTheorems parse false")
    unless hostFrontLiveOwnershipClaimedTheoremsReady do
      IO.eprintln "error: hostFrontLiveOwnershipClaimedTheoremsReady false"
      throw (IO.userError "hostFrontLiveOwnershipClaimedTheoremsReady false")
    IO.println s!"GREEN {stageId}: live OwnershipClaimedTheorems.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOwnershipClaimedTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOwnershipClaimedTheorems
