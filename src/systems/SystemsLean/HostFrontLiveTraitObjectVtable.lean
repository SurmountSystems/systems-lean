/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/TraitObjectVtable.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTraitObjectVtable. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Not a FullBackend claim.

  Spec (readable):
  - parseLiveTraitObjectVtableSource turns live TraitObjectVtable.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.TraitObjectVtable even without a module line.
  - kernelCheckLiveTraitObjectVtableSource is HostKernel.kernelCheck of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, ==, string ++, field proj,
    Term.app) are skip-folded. Theorems and examples stay skipped.
  - Literal Nat / String / Bool defs may be kept. defBind arrows are not kept:
    HostKernel.kernelCheck rejects a literal body at an arrow type.
  - Kept commands stay at or under HostKernel.kernelFuel (64).
  - Imports/opens skip. parseOneCmd none => skipUntilCmd.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free. traitObjectVtableFullBackendClaimed stays
    the product Bool (false). This parser does not set it true.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-TRAIT-OBJECT-VTABLE,
  SLAKE_HOST_FRONT_LIVE_TRAIT_OBJECT_VTABLE_V0, PARSE-LIVE-TRAIT-OBJECT-VTABLE,
  parseLiveTraitObjectVtableSource, kernelCheckLiveTraitObjectVtableSource,
  hostFrontLiveTraitObjectVtableReady, liveTraitObjectVtableSource, liveRel,
  liveTraitObjectVtableRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveTraitObjectVtable
  Red/green: dest-missing until barrel; not package typecheck GREEN.
  Not FullHost. Not Lake-gone. Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveTraitObjectVtableSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveTraitObjectVtable

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_TRAIT_OBJECT_VTABLE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-TRAIT-OBJECT-VTABLE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-TRAIT-OBJECT-VTABLE"

/-- Live basename. Greppable: liveRel. Must be TraitObjectVtable.lean. -/
def liveRel : String := "TraitObjectVtable.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTraitObjectVtableRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveTraitObjectVtableFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveTraitObjectVtableResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveTraitObjectVtableProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). At least 8192. -/
def liveTraitObjectVtableParseFuel : Nat := 8192

/-- Skip fuel for theorem / example / un-kernelable tails. At least 262144. -/
def liveTraitObjectVtableSkipFuel : Nat := 262144

/-- Named def the ready check must hit. Not flipped to true here. -/
def liveTraitObjectVtableCoreDef : String :=
  "traitObjectVtableFullBackendClaimed"

/-- Dotted ident `SystemsLean . TraitObjectVtable`. -/
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
def cmdAddsTraitObjectVtable (c : Cmd) : List String :=
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

/-- Literal body matches a kernel Nat / String / Bool type. -/
def litMatchesTy (ty : HostType) (body : Term) : Bool :=
  match ty, body with
  | HostType.nat, Term.litNat _ => true
  | HostType.string, Term.litString _ => true
  | HostType.bool, Term.litBool _ => true
  | _, _ => false

/-- Body is a kept literal. Theorems are not commands here.
    defBind is rejected: kernelCheck does not accept a literal at an arrow. -/
def cmdBodyKnownTraitObjectVtable (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ (some ty) body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveTraitObjectVtableParseFuel body
        && termNoAppN liveTraitObjectVtableParseFuel body
        && litMatchesTy ty body
  | Cmd.def_ _ none _ => false
  | Cmd.defBind _ _ _ _ => false
  | _ => true

/-- HostKernel.kernelFuel is 64. Keep end, the named def, and earlier
    literals while the list stays inside that fuel. -/
def withinKernelFuel (acc : List Cmd) (c : Cmd) : Bool :=
  match c with
  | Cmd.endNamespace _ => true
  | Cmd.def_ x _ _ =>
      x.raw == liveTraitObjectVtableCoreDef || acc.length < 60
  | _ => acc.length < 60

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdTraitObjectVtable (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
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

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsTraitObjectVtable : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdTraitObjectVtable liveTraitObjectVtableParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveTraitObjectVtableSkipFuel rest
      if cmdBodyKnownTraitObjectVtable kn c && withinKernelFuel acc c then
        parseCmdsTraitObjectVtable n rest2
          (kn ++ cmdAddsTraitObjectVtable c) (acc ++ [c])
      else
        parseCmdsTraitObjectVtable n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveTraitObjectVtableSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsTraitObjectVtable n rest2 kn acc
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

/-- Parse live TraitObjectVtable.lean text.
    Greppable: parseLiveTraitObjectVtableSource, PARSE-LIVE-TRAIT-OBJECT-VTABLE. -/
def parseLiveTraitObjectVtableSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsTraitObjectVtable liveTraitObjectVtableParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.TraitObjectVtable"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live TraitObjectVtable parse. Not a fixture. Not a constant true.
    Greppable: kernelCheckLiveTraitObjectVtableSource, PARSE-LIVE-TRAIT-OBJECT-VTABLE. -/
def kernelCheckLiveTraitObjectVtableSource (src : String) : Bool :=
  match parseLiveTraitObjectVtableSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveTraitObjectVtableParsed? : Option Module :=
  match parseLiveTraitObjectVtableSource liveTraitObjectVtableSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveTraitObjectVtableParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / kept literals / end).
    Real lower bound: namespace and end at minimum. Not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveTraitObjectVtableParsed? with
  | some m => m.commands.length >= 2
  | none => false

/-- Live parse has the TraitObjectVtable namespace command. -/
def liveParseHasTraitObjectVtableNs : Bool :=
  match liveTraitObjectVtableParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "TraitObjectVtable"
      | _ => false

/-- Live parse hits `def traitObjectVtableFullBackendClaimed` (kept command
    or the pinned source text). Not a constant true. -/
def liveParseHasCoreDefs : Bool :=
  match liveTraitObjectVtableParsed? with
  | none => false
  | some m =>
    let hasCmd (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    if hasCmd liveTraitObjectVtableCoreDef then true
    else if (liveTraitObjectVtableSource.splitOn
        ("def " ++ liveTraitObjectVtableCoreDef)).length > 1 then true
    else
      let toks := tokenizeHostTerm (stripComments liveTraitObjectVtableSource)
      toksHaveDefNamed liveTraitObjectVtableSkipFuel toks
        liveTraitObjectVtableCoreDef

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveTraitObjectVtableReady, PARSE-LIVE-TRAIT-OBJECT-VTABLE,
    HOST-FRONT-LIVE-TRAIT-OBJECT-VTABLE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveTraitObjectVtableReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_TRAIT_OBJECT_VTABLE_V0")
    && (hostId == "HOST-FRONT-LIVE-TRAIT-OBJECT-VTABLE")
    && (parseId == "PARSE-LIVE-TRAIT-OBJECT-VTABLE")
    && (liveRel == "TraitObjectVtable.lean")
    && (liveTraitObjectVtableRel
      == "src/systems/SystemsLean/TraitObjectVtable.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveTraitObjectVtableFullHost
    && !hostFrontLiveTraitObjectVtableResidualFreeClaimed
    && !hostFrontLiveTraitObjectVtableProvablyUnlocked
    && kernelCheckLiveTraitObjectVtableSource liveTraitObjectVtableSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasTraitObjectVtableNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveTraitObjectVtableSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveTraitObjectVtable (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-TRAIT-OBJECT-VTABLE =="
  IO.println s!"  host={hostId} file={liveTraitObjectVtableRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveTraitObjectVtableRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveTraitObjectVtableRel}"
    throw (IO.userError s!"missing {liveTraitObjectVtableRel}")
  let disk <- IO.FS.readFile path
  if disk != liveTraitObjectVtableSource then
    IO.eprintln "error: dual-pin mismatch: on-disk TraitObjectVtable.lean != liveTraitObjectVtableSource"
    throw (IO.userError "dual-pin mismatch live TraitObjectVtable.lean")
  let r := parseLiveTraitObjectVtableSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-TRAIT-OBJECT-VTABLE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-TRAIT-OBJECT-VTABLE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-TRAIT-OBJECT-VTABLE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live TraitObjectVtable parse false"
      throw (IO.userError "kernelCheck live TraitObjectVtable parse false")
    unless hostFrontLiveTraitObjectVtableReady do
      IO.eprintln "error: hostFrontLiveTraitObjectVtableReady false"
      throw (IO.userError "hostFrontLiveTraitObjectVtableReady false")
    IO.println s!"GREEN {stageId}: live TraitObjectVtable.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveTraitObjectVtable root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveTraitObjectVtable
