/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathOwnershipRegenerateTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathOwnershipRegenerateTheorems. Reuses
  HostFrontLiveHostTerm skip-un-kernelable fold. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not the ProductPathOwnershipRegenerateMain wrap.
  Not ProductPathOwnershipRegenerate.lean (stage ids stay in that file).
  Not ProductPathOwnershipInputsTheorems.lean.
  Not ProductPathPerformTheorems.lean.

  Unique needles (trailing newline so
  HostFrontLiveProductPathOwnershipRegenerateTheorems is not a prefix hit
  on the ProductPathOwnershipRegenerateMain wrap):
  HostFrontLiveProductPathOwnershipRegenerateTheorems
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0

  Spec (readable):
  - parseLiveProductPathOwnershipRegenerateTheoremsSource turns live
    ProductPathOwnershipRegenerateTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathOwnershipRegenerateTheorems even
    without a module line.
  - kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource is
    HostKernel.kernelCheck of that parse. Never := true.
  - Un-kernelable bodies (theorem proof scripts, tactics, example smokes
    the kernel cannot type) are skip-folded. import / namespace / end
    remain. This theorems peel has no kernelable def; skip-head still sees
    theorem stageId_eq.
  - Imports skip-fold: dotted import kept; open would be skipped.
    parseOneCmd none => skipUntilCmd.
  - liveRel is ProductPathOwnershipRegenerateTheorems.lean (basename under
    SystemsLean/).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not ProductPathOwnershipRegenerate.lean wrap.
  - Not the ProductPathOwnershipRegenerateMain wrap.

  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS,
  parseLiveProductPathOwnershipRegenerateTheoremsSource,
  kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource,
  hostFrontLiveProductPathOwnershipRegenerateTheoremsReady,
  liveProductPathOwnershipRegenerateTheoremsSource,
  liveProductPathOwnershipRegenerateTheoremsRel, liveRel,
  UNIT_SURFACE host surface, MULT-0, liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems
  Red/green: dest-missing until barrel; lake build of this module on
  surmount-1 stays queued. Dests skipped this slice.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathOwnershipRegenerateTheoremsRel : String :=
  "src/systems/SystemsLean/ProductPathOwnershipRegenerateTheorems.lean"

/-- Live basename. Greppable: liveRel.
    Must be ProductPathOwnershipRegenerateTheorems.lean. -/
def liveRel : String := "ProductPathOwnershipRegenerateTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathOwnershipRegenerateTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathOwnershipRegenerateTheoremsResidualFreeClaimed :
    Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathOwnershipRegenerateTheoremsProvablyUnlocked :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveProductPathOwnershipRegenerateTheoremsOwnsPackageTypecheck :
    Bool := false

/-- Parse fuel (command fold). Enough for about 36 theorems and 22 examples. -/
def liveProductPathOwnershipRegenerateTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveProductPathOwnershipRegenerateTheoremsSkipFuel : Nat := 8192

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
def cmdAddsProductPathOwnershipRegenerateTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathOwnershipRegenerateTheorems (kn : List String) :
    Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathOwnershipRegenerateTheoremsParseFuel body
        && termNoAppN liveProductPathOwnershipRegenerateTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathOwnershipRegenerateTheoremsParseFuel body
        && termNoAppN liveProductPathOwnershipRegenerateTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathOwnershipRegenerateTheorems (fuel : Nat)
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

/-- Fold commands. Skip theorem / example / set_option / open / un-kernelable. -/
def parseCmdsProductPathOwnershipRegenerateTheorems : Nat -> List String ->
    List String -> List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathOwnershipRegenerateTheorems
        liveProductPathOwnershipRegenerateTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathOwnershipRegenerateTheoremsSkipFuel rest
      if cmdBodyKnownProductPathOwnershipRegenerateTheorems kn c then
        parseCmdsProductPathOwnershipRegenerateTheorems n rest2
          (kn ++ cmdAddsProductPathOwnershipRegenerateTheorems c) (acc ++ [c])
      else
        parseCmdsProductPathOwnershipRegenerateTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathOwnershipRegenerateTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathOwnershipRegenerateTheorems n rest2 kn acc
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

/-- Parse live ProductPathOwnershipRegenerateTheorems.lean text.
    Greppable: parseLiveProductPathOwnershipRegenerateTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS. -/
def parseLiveProductPathOwnershipRegenerateTheoremsSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathOwnershipRegenerateTheorems
        liveProductPathOwnershipRegenerateTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathOwnershipRegenerateTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathOwnershipRegenerateTheorems parse.
    Not a fixture. Not := true.
    Greppable: kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS. -/
def kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource (src : String) :
    Bool :=
  match parseLiveProductPathOwnershipRegenerateTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathOwnershipRegenerateTheoremsParsed? : Option Module :=
  match parseLiveProductPathOwnershipRegenerateTheoremsSource
      liveProductPathOwnershipRegenerateTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathOwnershipRegenerateTheoremsParsed? with
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
  match liveProductPathOwnershipRegenerateTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is ProductPathOwnershipRegenerateTheorems
    (no module line in the live file). -/
def liveParseHasProductPathOwnershipRegenerateTheoremsModule : Bool :=
  match liveProductPathOwnershipRegenerateTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathOwnershipRegenerateTheorems"

/-- Live parse has the living ProductPathOwnershipRegenerate namespace command.
    The live namespace is SystemsLean.ProductPathOwnershipRegenerate, not the
    Theorems suffix. -/
def liveParseHasProductPathOwnershipRegenerateNs : Bool :=
  match liveProductPathOwnershipRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathOwnershipRegenerate"
      | _ => false

/-- Live parse imports SystemsLean.ProductPathOwnershipRegenerate
    (exactly one import; kept marker). -/
def liveParseHasProductPathOwnershipRegenerateImport : Bool :=
  match liveProductPathOwnershipRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "ProductPathOwnershipRegenerate"
      | _ => false

/-- Skip-head: theorem stageId_eq is in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathOwnershipRegenerateTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveProductPathOwnershipRegenerateTheoremsSource)
    toksHaveTheoremNamed liveProductPathOwnershipRegenerateTheoremsSkipFuel toks
      "stageId_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathOwnershipRegenerateTheoremsReady,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS,
    HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not hardcoded true. -/
def hostFrontLiveProductPathOwnershipRegenerateTheoremsReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS")
    && (liveProductPathOwnershipRegenerateTheoremsRel
      == "src/systems/SystemsLean/ProductPathOwnershipRegenerateTheorems.lean")
    && (liveRel == "ProductPathOwnershipRegenerateTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathOwnershipRegenerateTheoremsFullHost
    && !hostFrontLiveProductPathOwnershipRegenerateTheoremsResidualFreeClaimed
    && !hostFrontLiveProductPathOwnershipRegenerateTheoremsProvablyUnlocked
    && !hostFrontLiveProductPathOwnershipRegenerateTheoremsOwnsPackageTypecheck
    && kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource
      liveProductPathOwnershipRegenerateTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathOwnershipRegenerateTheoremsModule
    && liveParseHasProductPathOwnershipRegenerateNs
    && liveParseHasProductPathOwnershipRegenerateImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathOwnershipRegenerateTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductPathOwnershipRegenerateTheorems (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveProductPathOwnershipRegenerateTheoremsRel} liveRel={liveRel}"
  let path := root / liveProductPathOwnershipRegenerateTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathOwnershipRegenerateTheoremsRel}"
    throw (IO.userError s!"missing {liveProductPathOwnershipRegenerateTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathOwnershipRegenerateTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathOwnershipRegenerateTheorems.lean != liveProductPathOwnershipRegenerateTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathOwnershipRegenerateTheorems.lean")
  let r := parseLiveProductPathOwnershipRegenerateTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathOwnershipRegenerateTheorems parse false"
      throw (IO.userError "kernelCheck live ProductPathOwnershipRegenerateTheorems parse false")
    unless hostFrontLiveProductPathOwnershipRegenerateTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductPathOwnershipRegenerateTheoremsReady false"
      throw (IO.userError "hostFrontLiveProductPathOwnershipRegenerateTheoremsReady false")
    IO.println s!"GREEN {stageId}: live ProductPathOwnershipRegenerateTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathOwnershipRegenerateTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems
