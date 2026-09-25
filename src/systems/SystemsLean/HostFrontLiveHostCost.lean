/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostCost.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostCost. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostCost.lean.
  Unique needles use trailing newline so HostFrontLiveHostCost is not a
  prefix hit on HostFrontLiveHostCostSource or the HostCostTheorems peel.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostCostTheorems wrap. Not HostFrontLiveHostCostTheorems.

  Spec (readable):
  - parseLiveHostCostSource turns live HostCost.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostCost even without a module line.
  - kernelCheckLiveHostCostSource is HostKernel.kernelCheck of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app) are
    skip-folded. Kernelable string/Nat/Bool atom defs plus namespace / end
    remain. This live file has four dotted import lines. Skip-head still
    sees def costMintStep and def costConsumeStep.
  - Skip-fold ALL theorems and examples. Structure HostCostTokenState skips.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is HostCost.
  - Wrap-assigned module lastSeg is HostCost.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not the HostCostTheorems peel.

  Unique needles (trailing newline so HostFrontLiveHostCost is not a prefix):
  HostFrontLiveHostCost
  PARSE-LIVE-HOST-COST
  HOST-FRONT-LIVE-HOST-COST
  SLAKE_HOST_FRONT_LIVE_HOST_COST_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostCostSource,
  kernelCheckLiveHostCostSource,
  hostFrontLiveHostCostReady, liveHostCostSource,
  liveRel, liveHostCostRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostCost
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveHostCost on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostCostSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostCost

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_COST_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-COST"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-COST"

/-- Live basename. Greppable: liveRel. Must be HostCost.lean. -/
def liveRel : String := "HostCost.lean"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostCostRel : String :=
  "src/systems/SystemsLean/HostCost.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostCostFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostCostResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostCostProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostCostParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostCostSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostCost has quoted phrases in comments and module section heads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsHcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHcN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsHcN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsHcN n nest false false ('"' :: acc) rest
        else
          stripCommentsHcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostCost.lean bytes. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostCost`. -/
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
def cmdAddsHostCost (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Skip any Term.app. -/
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

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownHostCost (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostCostParseFuel body
        && termNoAppN liveHostCostParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostCostParseFuel body
        && termNoAppN liveHostCostParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostCost (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            let ty := addBinderArrows bs retTy
            let bnames := bs.map (fun p => p.fst)
            let dn := HostTerm.n dname
            match parseAtomHt liveHostTermParseFuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              match rest4 with
              | [] =>
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, [])
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, [])
              | t :: _ =>
                if isCmdKw t then
                  let rest5 := skipNonCmd liveHostCostSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostCost (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostCost fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsHostCost : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostCost liveHostCostParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostCostSkipFuel rest
      if cmdBodyKnownHostCost kn c then
        parseCmdsHostCost n rest2
          (kn ++ cmdAddsHostCost c) (acc ++ [c])
      else
        parseCmdsHostCost n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostCostSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostCost n rest2 kn acc
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

/-- Parse live HostCost.lean text.
    Greppable: parseLiveHostCostSource,
    PARSE-LIVE-HOST-COST. -/
def parseLiveHostCostSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostCost liveHostCostParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostCost"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostCost parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostCostSource,
    PARSE-LIVE-HOST-COST. -/
def kernelCheckLiveHostCostSource (src : String) : Bool :=
  match parseLiveHostCostSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostCostParsed? : Option Module :=
  match parseLiveHostCostSource liveHostCostSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostCostParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=16: four imports, namespace, ten kernelable Nat
    atoms, end. Do not copy a no-import bound of 8. -/
def liveParseCmdCountOk : Bool :=
  match liveHostCostParsed? with
  | some m => m.commands.length >= 16
  | none => false

/-- Wrap module lastSeg is HostCost (no module line in the live file). -/
def liveParseHasHostCostModule : Bool :=
  match liveHostCostParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostCost"

/-- Live parse has the living HostCost namespace command. -/
def liveParseHasHostCostNs : Bool :=
  match liveHostCostParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostCost"
      | _ => false

/-- Honesty: live product has dotted import lines; parse keeps HostCompose. -/
def liveParseHasHostComposeImport : Bool :=
  match liveHostCostParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostCompose"
      | _ => false

/-- Skip-head: def costMintStep and def costConsumeStep are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostCostParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostCostSource)
    toksHaveDefNamed liveHostCostSkipFuel toks "costMintStep"
      && toksHaveDefNamed liveHostCostSkipFuel toks "costConsumeStep"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostCostReady,
    PARSE-LIVE-HOST-COST,
    HOST-FRONT-LIVE-HOST-COST.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostCostReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_COST_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-COST")
    && (parseId == "PARSE-LIVE-HOST-COST")
    && (liveHostCostRel
      == "src/systems/SystemsLean/HostCost.lean")
    && (liveRel == "HostCost.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostCostFullHost
    && !hostFrontLiveHostCostResidualFreeClaimed
    && !hostFrontLiveHostCostProvablyUnlocked
    && kernelCheckLiveHostCostSource liveHostCostSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostCostModule
    && liveParseHasHostCostNs
    && liveParseHasHostComposeImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostCostSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostCost (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-COST =="
  IO.println s!"  host={hostId} file={liveHostCostRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostCost.lean") do
    IO.eprintln "error: liveRel must be HostCost.lean"
    throw (IO.userError "liveRel must be HostCost.lean")
  let path := root / liveHostCostRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostCostRel}"
    throw (IO.userError s!"missing {liveHostCostRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostCostSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostCost.lean != liveHostCostSource"
    throw (IO.userError "dual-pin mismatch live HostCost.lean")
  let r := parseLiveHostCostSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-COST reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-COST reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-COST ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostCost parse false"
      throw (IO.userError "kernelCheck live HostCost parse false")
    unless hostFrontLiveHostCostReady do
      IO.eprintln "error: hostFrontLiveHostCostReady false"
      throw (IO.userError "hostFrontLiveHostCostReady false")
    IO.println s!"GREEN {stageId}: live HostCost.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostCost root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostCost
