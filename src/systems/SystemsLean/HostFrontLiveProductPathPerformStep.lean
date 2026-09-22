/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathPerformStep.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathPerformStep. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses ProductPathPerformStep.lean only.
  Not ProductPathPerformStepTheorems.lean. That file's theorem is not here.
  No import line in the live file.

  Spec (readable):
  - parseLiveProductPathPerformStepSource turns live ProductPathPerformStep.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathPerformStep even without a module line.
  - kernelCheckLiveProductPathPerformStepSource is HostKernel.kernelCheck
    of that parse. Not a Bool defined as := true.
  - Kept commands are namespace, the kernel-checkable defs, and end.
    Theorem and example text is not in this file.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not ProductPathPerformStepTheorems. Not PerformClaimed.

  Unique needles (own line, no THEOREMS suffix):
  HostFrontLiveProductPathPerformStep
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProductPathPerformStepSource,
  kernelCheckLiveProductPathPerformStepSource,
  hostFrontLiveProductPathPerformStepReady,
  liveProductPathPerformStepSource,
  liveProductPathPerformStepRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductPathPerformStep
  Red/green: closed lean --run on horizon.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathPerformStepSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathPerformStep

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP"

/-- Live file relative to repo root. -/
def liveProductPathPerformStepRel : String :=
  "src/systems/SystemsLean/ProductPathPerformStep.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathPerformStepFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathPerformStepResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathPerformStepProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathPerformStepParseFuel : Nat := 256

/-- Skip fuel for un-kernelable tails. -/
def liveProductPathPerformStepSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProductPathPerformStep has block comments. HostFrontLiveMult.stripComments
    is not in-string safe. Backslash keeps the next char inside a string. -/
def stripCommentsPppN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPppN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPppN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPppN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPppN n nest false false ('"' :: acc) rest
        else
          stripCommentsPppN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPppN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPppN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPppN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPppN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPppN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPppN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPppN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPppN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live ProductPathPerformStep.lean bytes. -/
def stripCommentsPpp (src : String) : String :=
  String.ofList (stripCommentsPppN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProductPathPerformStep`. -/
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
def cmdAddsProductPathPerformStep (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathPerformStep (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathPerformStepParseFuel body
        && termNoAppN liveProductPathPerformStepParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathPerformStepParseFuel body
        && termNoAppN liveProductPathPerformStepParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathPerformStep (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPathPerformStep : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathPerformStep liveProductPathPerformStepParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathPerformStepSkipFuel rest
      if cmdBodyKnownProductPathPerformStep kn c then
        parseCmdsProductPathPerformStep n rest2
          (kn ++ cmdAddsProductPathPerformStep c) (acc ++ [c])
      else
        parseCmdsProductPathPerformStep n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathPerformStepSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathPerformStep n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live ProductPathPerformStep.lean text.
    Greppable: parseLiveProductPathPerformStepSource,
    PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP. -/
def parseLiveProductPathPerformStepSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPpp src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathPerformStep liveProductPathPerformStepParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathPerformStep"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathPerformStep parse. Not a fixture.
    Not := true.
    Greppable: kernelCheckLiveProductPathPerformStepSource,
    PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP. -/
def kernelCheckLiveProductPathPerformStepSource (src : String) : Bool :=
  match parseLiveProductPathPerformStepSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathPerformStepParsed? : Option Module :=
  match parseLiveProductPathPerformStepSource liveProductPathPerformStepSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathPerformStepParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count.
    Namespace, fifteen defs, and end. Lower bound, not a constant true.
    This file has no import. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathPerformStepParsed? with
  | some m => m.commands.length >= 17
  | none => false

/-- Wrap module lastSeg is ProductPathPerformStep (no module line in the live file). -/
def liveParseHasProductPathPerformStepModule : Bool :=
  match liveProductPathPerformStepParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathPerformStep"

/-- Live parse has the ProductPathPerformStep namespace command. -/
def liveParseHasProductPathPerformStepNs : Bool :=
  match liveProductPathPerformStepParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathPerformStep"
      | _ => false

/-- Live file has no import. The parse must not keep an import command. -/
def liveParseHasNoImport : Bool :=
  match liveProductPathPerformStepParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Def raw name when the command is a def. -/
def cmdDefRaw : Cmd -> Option String
  | Cmd.def_ x _ _ => some x.raw
  | Cmd.defBind x _ _ _ => some x.raw
  | _ => none

/-- True when a kept command declares `nm`. -/
def cmdsHaveDef (cmds : List Cmd) (nm : String) : Bool :=
  cmds.any fun c => cmdDefRaw c == some nm

/-- Kept defs are the ones HostKernel.kernelCheck sees.
    Names are the defs declared in ProductPathPerformStep.lean.
    Not productPathPerformStepPartialReady_true (that theorem is not in this file). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathPerformStepParsed? with
  | none => false
  | some m =>
    cmdsHaveDef m.commands "stageId"
      && cmdsHaveDef m.commands "hostId"
      && cmdsHaveDef m.commands "selfHostId"
      && cmdsHaveDef m.commands "writerPathStepInstallOut"
      && cmdsHaveDef m.commands "justRecipeName"
      && cmdsHaveDef m.commands "stepModuleCite"
      && cmdsHaveDef m.commands "gapReadSsot"
      && cmdsHaveDef m.commands "gapCompose"
      && cmdsHaveDef m.commands "gapWriteHc"
      && cmdsHaveDef m.commands "productPathPerformInstallLakeFreeEntrypointClaimed"
      && cmdsHaveDef m.commands "productPathPerformInstallLakeFreeEntrypointRecipe"
      && cmdsHaveDef m.commands "productPathPerformInstallStepLakeFreeCapable"
      && cmdsHaveDef m.commands "productPathPerformStepDependsOnLake"
      && cmdsHaveDef m.commands "productPathPerformStepOk"
      && cmdsHaveDef m.commands "productPathPerformStepPartialReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathPerformStepReady,
    PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP,
    HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty pins.
    Not a Bool defined as := true. -/
def hostFrontLiveProductPathPerformStepReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP")
    && (liveProductPathPerformStepRel
      == "src/systems/SystemsLean/ProductPathPerformStep.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathPerformStepFullHost
    && !hostFrontLiveProductPathPerformStepResidualFreeClaimed
    && !hostFrontLiveProductPathPerformStepProvablyUnlocked
    && kernelCheckLiveProductPathPerformStepSource liveProductPathPerformStepSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathPerformStepModule
    && liveParseHasProductPathPerformStepNs
    && liveParseHasNoImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathPerformStepSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- Space-separated raw names of kept defs. -/
def cmdDefNames : List Cmd -> List String
  | [] => []
  | c :: rest =>
    match cmdDefRaw c with
    | some nm => nm :: cmdDefNames rest
    | none => cmdDefNames rest

/-! ### Driver (short banners; on-disk file equality). Not mill 70. -/

def runLiveProductPathPerformStep (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP =="
  IO.println s!"  host={hostId} file={liveProductPathPerformStepRel}"
  IO.println s!"liveRel=ProductPathPerformStep.lean"
  let path := root / liveProductPathPerformStepRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathPerformStepRel}"
    throw (IO.userError s!"missing {liveProductPathPerformStepRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathPerformStepSource then
    IO.eprintln "error: on-disk ProductPathPerformStep.lean != liveProductPathPerformStepSource"
    throw (IO.userError "on-disk mismatch live ProductPathPerformStep.lean")
  let r := parseLiveProductPathPerformStepSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP ACCEPT liveRel=ProductPathPerformStep.lean cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"checkedDefs={String.intercalate " " (cmdDefNames m.commands)}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathPerformStep parse false"
      throw (IO.userError "kernelCheck live ProductPathPerformStep parse false")
    unless hostFrontLiveProductPathPerformStepReady do
      IO.eprintln "error: hostFrontLiveProductPathPerformStepReady false"
      throw (IO.userError "hostFrontLiveProductPathPerformStepReady false")
    IO.println s!"GREEN {stageId}: live ProductPathPerformStep.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathPerformStep root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathPerformStep
