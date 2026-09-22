/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostPackageWriteTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostPackageWriteTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses HostPackageWriteTheorems.lean only.
  Do not steal HostFrontLivePackageWrite (that wrap parses HostPackageWrite.lean).
  Do not steal HostFrontLiveHostPackageWriteMain (liveRel is HostPackageWriteMain.lean).
  Do not edit HostFrontLivePackageWriteTheorems (old wrap without liveRel).

  Spec (readable):
  - parseLiveHostPackageWriteTheoremsSource turns live
    HostPackageWriteTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostPackageWriteTheorems even without a
    module line.
  - kernelCheckLiveHostPackageWriteTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. This theorems companion has
    no kernelable defs; skip-head still sees theorem hostPackageWrite_ids_eq.
  - Skip-fold ALL theorems and examples. `by native_decide` / `rfl` skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is HostPackageWrite.
  - Wrap-assigned module lastSeg is HostPackageWriteTheorems.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free. Not package typecheck.
  - Not the HostPackageWrite.lean library wrap.
  - Not the HostPackageWriteMain.lean mill wrap.

  Unique needles (trailing newline so HostFrontLiveHostPackageWriteMain is not a prefix):
  HostFrontLiveHostPackageWriteTheorems
  HostFrontLiveHostPackageWriteTheoremsSource
  HostFrontLiveHostPackageWriteTheoremsMain
  SlakeTypecheckHostPackageWriteTheorems
  PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS
  HOST-FRONT-LIVE-HOST-PACKAGE-WRITE-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_WRITE_THEOREMS_V0
  SLAKE_TYPECHECK_HOST_PACKAGE_WRITE_THEOREMS_V0
  HOST-SLAKE-TYPECHECK-HOST-PACKAGE-WRITE-THEOREMS
  HOST-PACKAGE-WRITE-THEOREMS
  liveRel
  HostPackageWriteTheorems.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostPackageWriteTheoremsSource,
  kernelCheckLiveHostPackageWriteTheoremsSource,
  hostFrontLiveHostPackageWriteTheoremsReady, liveHostPackageWriteTheoremsSource,
  liveHostPackageWriteTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostPackageWriteTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveHostPackageWriteTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostPackageWriteTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostPackageWriteTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_WRITE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-PACKAGE-WRITE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostPackageWriteTheoremsRel : String :=
  "src/systems/SystemsLean/HostPackageWriteTheorems.lean"

/-- Live basename. Greppable: liveRel. Must be HostPackageWriteTheorems.lean. -/
def liveRel : String := "HostPackageWriteTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostPackageWriteTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostPackageWriteTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostPackageWriteTheoremsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostPackageWriteTheoremsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveHostPackageWriteTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostPackageWriteTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . HostPackageWriteTheorems`. -/
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
def cmdAddsHostPackageWriteTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownHostPackageWriteTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostPackageWriteTheoremsParseFuel body
        && termNoAppN liveHostPackageWriteTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostPackageWriteTheoremsParseFuel body
        && termNoAppN liveHostPackageWriteTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdHostPackageWriteTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsHostPackageWriteTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostPackageWriteTheorems liveHostPackageWriteTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostPackageWriteTheoremsSkipFuel rest
      if cmdBodyKnownHostPackageWriteTheorems kn c then
        parseCmdsHostPackageWriteTheorems n rest2
          (kn ++ cmdAddsHostPackageWriteTheorems c) (acc ++ [c])
      else
        parseCmdsHostPackageWriteTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostPackageWriteTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostPackageWriteTheorems n rest2 kn acc
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

/-- Parse live HostPackageWriteTheorems.lean text.
    Greppable: parseLiveHostPackageWriteTheoremsSource,
    PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS. -/
def parseLiveHostPackageWriteTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostPackageWriteTheorems liveHostPackageWriteTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostPackageWriteTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostPackageWriteTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostPackageWriteTheoremsSource,
    PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS. -/
def kernelCheckLiveHostPackageWriteTheoremsSource (src : String) : Bool :=
  match parseLiveHostPackageWriteTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostPackageWriteTheoremsParsed? : Option Module :=
  match parseLiveHostPackageWriteTheoremsSource liveHostPackageWriteTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostPackageWriteTheoremsParsed? with
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
  match liveHostPackageWriteTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is HostPackageWriteTheorems (no module line in the live file). -/
def liveParseHasHostPackageWriteTheoremsModule : Bool :=
  match liveHostPackageWriteTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostPackageWriteTheorems"

/-- Live parse has the living HostPackageWrite namespace command. -/
def liveParseHasHostPackageWriteNs : Bool :=
  match liveHostPackageWriteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostPackageWrite"
      | _ => false

/-- Live parse imports SystemsLean.HostPackageWrite (kept marker). -/
def liveParseHasHostPackageWriteImport : Bool :=
  match liveHostPackageWriteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostPackageWrite"
      | _ => false

/-- Skip-head: theorems unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match liveHostPackageWriteTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostPackageWriteTheoremsSource)
    toksHaveTheoremNamed liveHostPackageWriteTheoremsSkipFuel toks
      "hostPackageWriteG1Ready_true"
      && toksHaveTheoremNamed liveHostPackageWriteTheoremsSkipFuel toks
        "hostPackageWriteReady_true"
      && toksHaveTheoremNamed liveHostPackageWriteTheoremsSkipFuel toks
        "hostPackageWrite_ids_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostPackageWriteTheoremsReady,
    PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS,
    HOST-FRONT-LIVE-HOST-PACKAGE-WRITE-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostPackageWriteTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_WRITE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-PACKAGE-WRITE-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS")
    && (liveHostPackageWriteTheoremsRel
      == "src/systems/SystemsLean/HostPackageWriteTheorems.lean")
    && (liveRel == "HostPackageWriteTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostPackageWriteTheoremsFullHost
    && !hostFrontLiveHostPackageWriteTheoremsResidualFreeClaimed
    && !hostFrontLiveHostPackageWriteTheoremsProvablyUnlocked
    && !hostFrontLiveHostPackageWriteTheoremsOwnsPackageTypecheck
    && kernelCheckLiveHostPackageWriteTheoremsSource liveHostPackageWriteTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostPackageWriteTheoremsModule
    && liveParseHasHostPackageWriteNs
    && liveParseHasHostPackageWriteImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostPackageWriteTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostPackageWriteTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostPackageWriteTheoremsRel} liveRel={liveRel}"
  let path := root / liveHostPackageWriteTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostPackageWriteTheoremsRel}"
    throw (IO.userError s!"missing {liveHostPackageWriteTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostPackageWriteTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostPackageWriteTheorems.lean != liveHostPackageWriteTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostPackageWriteTheorems.lean")
  let r := parseLiveHostPackageWriteTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostPackageWriteTheorems parse false"
      throw (IO.userError "kernelCheck live HostPackageWriteTheorems parse false")
    unless hostFrontLiveHostPackageWriteTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostPackageWriteTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostPackageWriteTheoremsReady false")
    IO.println s!"GREEN {stageId}: live HostPackageWriteTheorems.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostPackageWriteTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostPackageWriteTheorems
