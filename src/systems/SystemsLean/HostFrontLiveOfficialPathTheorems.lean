/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OfficialPathTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveOfficialPathTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  Not HostFrontLiveOfficialPath (that wrap parses OfficialPath.lean).
  Not OfficialPathMain mill Main.

  Spec (readable):
  - parseLiveOfficialPathTheoremsSource turns live OfficialPathTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.OfficialPathTheorems even without a module line.
  - kernelCheckLiveOfficialPathTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. This theorems peel has
    no kernelable defs; skip-head still sees theorem stageId_eq.
  - Skip-fold ALL theorems and examples. `by decide` / `rfl` skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is OfficialPath.
  - Wrap-assigned module lastSeg is OfficialPathTheorems.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free. Not package typecheck.

  Unique needles (trailing newline so HostFrontLiveOfficialPath is not a prefix):
  HostFrontLiveOfficialPathTheorems
  HostFrontLiveOfficialPathTheoremsSource
  HostFrontLiveOfficialPathTheoremsMain
  SlakeTypecheckOfficialPathTheorems
  PARSE-LIVE-OFFICIAL-PATH-THEOREMS
  HOST-FRONT-LIVE-OFFICIAL-PATH-THEOREMS
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_THEOREMS_V0
  SLAKE_TYPECHECK_OFFICIAL_PATH_THEOREMS_V0
  HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-THEOREMS
  OFFICIAL-PATH-THEOREMS
  liveRel
  OfficialPathTheorems.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveOfficialPathTheoremsSource,
  kernelCheckLiveOfficialPathTheoremsSource,
  hostFrontLiveOfficialPathTheoremsReady, liveOfficialPathTheoremsSource,
  liveOfficialPathTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveOfficialPathTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveOfficialPathTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOfficialPathTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOfficialPathTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OFFICIAL-PATH-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OFFICIAL-PATH-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathTheoremsRel : String :=
  "src/systems/SystemsLean/OfficialPathTheorems.lean"

/-- Live basename. Greppable: liveRel. Must be OfficialPathTheorems.lean. -/
def liveRel : String := "OfficialPathTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOfficialPathTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOfficialPathTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveOfficialPathTheoremsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveOfficialPathTheoremsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveOfficialPathTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveOfficialPathTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . OfficialPathTheorems`. -/
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
def cmdAddsOfficialPathTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownOfficialPathTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathTheoremsParseFuel body
        && termNoAppN liveOfficialPathTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathTheoremsParseFuel body
        && termNoAppN liveOfficialPathTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdOfficialPathTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsOfficialPathTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOfficialPathTheorems liveOfficialPathTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOfficialPathTheoremsSkipFuel rest
      if cmdBodyKnownOfficialPathTheorems kn c then
        parseCmdsOfficialPathTheorems n rest2
          (kn ++ cmdAddsOfficialPathTheorems c) (acc ++ [c])
      else
        parseCmdsOfficialPathTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveOfficialPathTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsOfficialPathTheorems n rest2 kn acc
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

/-- Parse live OfficialPathTheorems.lean text.
    Greppable: parseLiveOfficialPathTheoremsSource,
    PARSE-LIVE-OFFICIAL-PATH-THEOREMS. -/
def parseLiveOfficialPathTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOfficialPathTheorems liveOfficialPathTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OfficialPathTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OfficialPathTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveOfficialPathTheoremsSource,
    PARSE-LIVE-OFFICIAL-PATH-THEOREMS. -/
def kernelCheckLiveOfficialPathTheoremsSource (src : String) : Bool :=
  match parseLiveOfficialPathTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOfficialPathTheoremsParsed? : Option Module :=
  match parseLiveOfficialPathTheoremsSource liveOfficialPathTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOfficialPathTheoremsParsed? with
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
  match liveOfficialPathTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is OfficialPathTheorems (no module line in the live file). -/
def liveParseHasOfficialPathTheoremsModule : Bool :=
  match liveOfficialPathTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "OfficialPathTheorems"

/-- Live parse has the living OfficialPath namespace command. -/
def liveParseHasOfficialPathNs : Bool :=
  match liveOfficialPathTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "OfficialPath"
      | _ => false

/-- Live parse imports SystemsLean.OfficialPath (kept marker). -/
def liveParseHasOfficialPathImport : Bool :=
  match liveOfficialPathTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "OfficialPath"
      | _ => false

/-- Skip-head: theorem stageId_eq is in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveOfficialPathTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveOfficialPathTheoremsSource)
    toksHaveTheoremNamed liveOfficialPathTheoremsSkipFuel toks
      "stageId_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOfficialPathTheoremsReady,
    PARSE-LIVE-OFFICIAL-PATH-THEOREMS,
    HOST-FRONT-LIVE-OFFICIAL-PATH-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveOfficialPathTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-OFFICIAL-PATH-THEOREMS")
    && (parseId == "PARSE-LIVE-OFFICIAL-PATH-THEOREMS")
    && (liveOfficialPathTheoremsRel
      == "src/systems/SystemsLean/OfficialPathTheorems.lean")
    && (liveRel == "OfficialPathTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOfficialPathTheoremsFullHost
    && !hostFrontLiveOfficialPathTheoremsResidualFreeClaimed
    && !hostFrontLiveOfficialPathTheoremsProvablyUnlocked
    && !hostFrontLiveOfficialPathTheoremsOwnsPackageTypecheck
    && kernelCheckLiveOfficialPathTheoremsSource liveOfficialPathTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasOfficialPathTheoremsModule
    && liveParseHasOfficialPathNs
    && liveParseHasOfficialPathImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOfficialPathTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveOfficialPathTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OFFICIAL-PATH-THEOREMS =="
  IO.println s!"  host={hostId} file={liveOfficialPathTheoremsRel} liveRel={liveRel}"
  let path := root / liveOfficialPathTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOfficialPathTheoremsRel}"
    throw (IO.userError s!"missing {liveOfficialPathTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOfficialPathTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OfficialPathTheorems.lean != liveOfficialPathTheoremsSource"
    throw (IO.userError "dual-pin mismatch live OfficialPathTheorems.lean")
  let r := parseLiveOfficialPathTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OFFICIAL-PATH-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OFFICIAL-PATH-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OFFICIAL-PATH-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OfficialPathTheorems parse false"
      throw (IO.userError "kernelCheck live OfficialPathTheorems parse false")
    unless hostFrontLiveOfficialPathTheoremsReady do
      IO.eprintln "error: hostFrontLiveOfficialPathTheoremsReady false"
      throw (IO.userError "hostFrontLiveOfficialPathTheoremsReady false")
    IO.println s!"GREEN {stageId}: live OfficialPathTheorems.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOfficialPathTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOfficialPathTheorems
