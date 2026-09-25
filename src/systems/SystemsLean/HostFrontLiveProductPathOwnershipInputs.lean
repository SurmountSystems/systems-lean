/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathOwnershipInputs.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathOwnershipInputs. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses ProductPathOwnershipInputs.lean only.
  Not ProductPathOwnershipInputsTheorems.lean. That file's theorem is not here.
  No import line in the live file.

  Spec (readable):
  - parseLiveProductPathOwnershipInputsSource turns live
    ProductPathOwnershipInputs.lean text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathOwnershipInputs even without a
    module line.
  - kernelCheckLiveProductPathOwnershipInputsSource is HostKernel.kernelCheck
    of that parse. Not a Bool defined as := true.
  - Kept commands are namespace, the kernel-checkable defs, and end.
    String cites and the Bool folds productPathOwnershipInputsOk and
    productPathOwnershipInputsPartialReady stay. Theorem and example text
    is not in this file.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not ProductPathOwnershipInputsTheorems.

  Unique needles (own line, no THEOREMS suffix):
  HostFrontLiveProductPathOwnershipInputs
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_INPUTS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProductPathOwnershipInputsSource,
  kernelCheckLiveProductPathOwnershipInputsSource,
  hostFrontLiveProductPathOwnershipInputsReady,
  liveProductPathOwnershipInputsSource,
  liveProductPathOwnershipInputsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipInputs
  Red/green: closed lean --run on horizon.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathOwnershipInputsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathOwnershipInputs

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_INPUTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS"

/-- Live file relative to repo root. -/
def liveProductPathOwnershipInputsRel : String :=
  "src/systems/SystemsLean/ProductPathOwnershipInputs.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "ProductPathOwnershipInputs.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathOwnershipInputsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathOwnershipInputsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathOwnershipInputsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathOwnershipInputsParseFuel : Nat := 256

/-- Skip fuel for un-kernelable tails. -/
def liveProductPathOwnershipInputsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProductPathOwnershipInputs has block comments. HostFrontLiveMult.stripComments
    is not in-string safe. Backslash keeps the next char inside a string.
    Ppoi: ProductPathOwnershipInputs. -/
def stripCommentsPpoiN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPpoiN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPpoiN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPpoiN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPpoiN n nest false false ('"' :: acc) rest
        else
          stripCommentsPpoiN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPpoiN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPpoiN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPpoiN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPpoiN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPpoiN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPpoiN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPpoiN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPpoiN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live ProductPathOwnershipInputs.lean bytes. -/
def stripCommentsPpoi (src : String) : String :=
  String.ofList (stripCommentsPpoiN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProductPathOwnershipInputs`. -/
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
def cmdAddsProductPathOwnershipInputs (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathOwnershipInputs (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathOwnershipInputsParseFuel body
        && termNoAppN liveProductPathOwnershipInputsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathOwnershipInputsParseFuel body
        && termNoAppN liveProductPathOwnershipInputsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathOwnershipInputs (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPathOwnershipInputs : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathOwnershipInputs liveProductPathOwnershipInputsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathOwnershipInputsSkipFuel rest
      if cmdBodyKnownProductPathOwnershipInputs kn c then
        parseCmdsProductPathOwnershipInputs n rest2
          (kn ++ cmdAddsProductPathOwnershipInputs c) (acc ++ [c])
      else
        parseCmdsProductPathOwnershipInputs n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathOwnershipInputsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathOwnershipInputs n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live ProductPathOwnershipInputs.lean text.
    Greppable: parseLiveProductPathOwnershipInputsSource,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS. -/
def parseLiveProductPathOwnershipInputsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPpoi src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathOwnershipInputs liveProductPathOwnershipInputsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathOwnershipInputs"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathOwnershipInputs parse. Not a fixture.
    Not := true.
    Greppable: kernelCheckLiveProductPathOwnershipInputsSource,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS. -/
def kernelCheckLiveProductPathOwnershipInputsSource (src : String) : Bool :=
  match parseLiveProductPathOwnershipInputsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathOwnershipInputsParsed? : Option Module :=
  match parseLiveProductPathOwnershipInputsSource liveProductPathOwnershipInputsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathOwnershipInputsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count.
    Namespace, twenty-two defs, and end. Exact count, not a constant true.
    This file has no import. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathOwnershipInputsParsed? with
  | some m => m.commands.length == 24
  | none => false

/-- Wrap module lastSeg is ProductPathOwnershipInputs (no module line in the live file). -/
def liveParseHasProductPathOwnershipInputsModule : Bool :=
  match liveProductPathOwnershipInputsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathOwnershipInputs"

/-- Live parse has the ProductPathOwnershipInputs namespace command. -/
def liveParseHasProductPathOwnershipInputsNs : Bool :=
  match liveProductPathOwnershipInputsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathOwnershipInputs"
      | _ => false

/-- Live file has no import. The parse must not keep an import command. -/
def liveParseHasNoImport : Bool :=
  match liveProductPathOwnershipInputsParsed? with
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
    Names are the defs declared in ProductPathOwnershipInputs.lean.
    Not productPathOwnershipInputsPartialReady_true (that theorem is not in this file). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathOwnershipInputsParsed? with
  | none => false
  | some m =>
    cmdsHaveDef m.commands "stageId"
      && cmdsHaveDef m.commands "hostId"
      && cmdsHaveDef m.commands "selfHostId"
      && cmdsHaveDef m.commands "ownershipInputsModuleCite"
      && cmdsHaveDef m.commands "productPathOwnershipSsotMult"
      && cmdsHaveDef m.commands "productPathOwnershipSsotLinear"
      && cmdsHaveDef m.commands "productPathOwnershipSsotErasure"
      && cmdsHaveDef m.commands "productPathOwnershipSsotExtract"
      && cmdsHaveDef m.commands "productPathOwnershipSsotTypes"
      && cmdsHaveDef m.commands "productPathOwnershipSsotProgram"
      && cmdsHaveDef m.commands "productPathOwnershipSsotGraph"
      && cmdsHaveDef m.commands "productPathOwnershipSsotCompose"
      && cmdsHaveDef m.commands "productPathOwnershipSsotPlan"
      && cmdsHaveDef m.commands "productPathOwnershipSsotApply"
      && cmdsHaveDef m.commands "productPathOwnershipSsotBody"
      && cmdsHaveDef m.commands "productPathOwnershipEmitH"
      && cmdsHaveDef m.commands "productPathOwnershipEmitC"
      && cmdsHaveDef m.commands "productPathOwnershipDualSsotCite"
      && cmdsHaveDef m.commands "productPathOwnershipOutPath"
      && cmdsHaveDef m.commands "productPathOwnershipAcceptancePath"
      && cmdsHaveDef m.commands "productPathOwnershipInputsOk"
      && cmdsHaveDef m.commands "productPathOwnershipInputsPartialReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathOwnershipInputsReady,
    PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS,
    HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty pins.
    Not a Bool defined as := true. -/
def hostFrontLiveProductPathOwnershipInputsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_INPUTS_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS")
    && (liveProductPathOwnershipInputsRel
      == "src/systems/SystemsLean/ProductPathOwnershipInputs.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathOwnershipInputsFullHost
    && !hostFrontLiveProductPathOwnershipInputsResidualFreeClaimed
    && !hostFrontLiveProductPathOwnershipInputsProvablyUnlocked
    && kernelCheckLiveProductPathOwnershipInputsSource liveProductPathOwnershipInputsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathOwnershipInputsModule
    && liveParseHasProductPathOwnershipInputsNs
    && liveParseHasNoImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathOwnershipInputsSource "" with
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

def runLiveProductPathOwnershipInputs (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS =="
  IO.println s!"  host={hostId} file={liveProductPathOwnershipInputsRel}"
  IO.println s!"liveRel=ProductPathOwnershipInputs.lean"
  let path := root / liveProductPathOwnershipInputsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathOwnershipInputsRel}"
    throw (IO.userError s!"missing {liveProductPathOwnershipInputsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathOwnershipInputsSource then
    IO.eprintln "error: on-disk ProductPathOwnershipInputs.lean != liveProductPathOwnershipInputsSource"
    throw (IO.userError "on-disk mismatch live ProductPathOwnershipInputs.lean")
  let r := parseLiveProductPathOwnershipInputsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS ACCEPT liveRel=ProductPathOwnershipInputs.lean cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"checkedDefs={String.intercalate " " (cmdDefNames m.commands)}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathOwnershipInputs parse false"
      throw (IO.userError "kernelCheck live ProductPathOwnershipInputs parse false")
    unless hostFrontLiveProductPathOwnershipInputsReady do
      IO.eprintln "error: hostFrontLiveProductPathOwnershipInputsReady false"
      throw (IO.userError "hostFrontLiveProductPathOwnershipInputsReady false")
    IO.println s!"GREEN {stageId}: live ProductPathOwnershipInputs.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathOwnershipInputs root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathOwnershipInputs
