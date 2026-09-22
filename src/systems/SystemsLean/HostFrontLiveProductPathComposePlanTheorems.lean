/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathComposePlanTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathComposePlanTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses ProductPathComposePlanTheorems.lean only.
  Do not steal the library wrap of ProductPathComposePlan.lean.
  Do not steal the mill-Main wrap of ProductPathComposePlanMain.lean.

  Spec (readable):
  - parseLiveProductPathComposePlanTheoremsSource turns live
    ProductPathComposePlanTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathComposePlanTheorems even without a
    module line.
  - kernelCheckLiveProductPathComposePlanTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem stageId_eq.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - liveRel is the basename ProductPathComposePlanTheorems.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not the ProductPathComposePlan.lean library wrap.
  - Not the ProductPathComposePlanMain.lean mill wrap.

  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveProductPathComposePlanTheorems
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProductPathComposePlanTheoremsSource,
  kernelCheckLiveProductPathComposePlanTheoremsSource,
  hostFrontLiveProductPathComposePlanTheoremsReady,
  liveProductPathComposePlanTheoremsSource,
  liveProductPathComposePlanTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductPathComposePlanTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveProductPathComposePlanTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathComposePlanTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathComposePlanTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathComposePlanTheoremsRel : String :=
  "src/systems/SystemsLean/ProductPathComposePlanTheorems.lean"

/-- Live basename. Greppable: liveRel. Must be ProductPathComposePlanTheorems.lean. -/
def liveRel : String := "ProductPathComposePlanTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathComposePlanTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathComposePlanTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathComposePlanTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathComposePlanTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveProductPathComposePlanTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProductPathComposePlanTheorems has quoted phrases in comments and theorem
    statements. HostFrontLiveMult.stripComments is not in-string safe.
    Backslash keeps the next char inside a string. -/
def stripCommentsPpcptN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPpcptN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPpcptN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPpcptN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPpcptN n nest false false ('"' :: acc) rest
        else
          stripCommentsPpcptN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPpcptN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPpcptN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPpcptN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPpcptN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPpcptN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPpcptN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPpcptN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPpcptN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live ProductPathComposePlanTheorems.lean bytes. -/
def stripCommentsPpcpt (src : String) : String :=
  String.ofList (stripCommentsPpcptN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProductPathComposePlan`. -/
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
def cmdAddsProductPathComposePlanTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathComposePlanTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathComposePlanTheoremsParseFuel body
        && termNoAppN liveProductPathComposePlanTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathComposePlanTheoremsParseFuel body
        && termNoAppN liveProductPathComposePlanTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathComposePlanTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPathComposePlanTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathComposePlanTheorems liveProductPathComposePlanTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathComposePlanTheoremsSkipFuel rest
      if cmdBodyKnownProductPathComposePlanTheorems kn c then
        parseCmdsProductPathComposePlanTheorems n rest2
          (kn ++ cmdAddsProductPathComposePlanTheorems c) (acc ++ [c])
      else
        parseCmdsProductPathComposePlanTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathComposePlanTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathComposePlanTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live ProductPathComposePlanTheorems.lean text.
    Greppable: parseLiveProductPathComposePlanTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS. -/
def parseLiveProductPathComposePlanTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPpcpt src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathComposePlanTheorems liveProductPathComposePlanTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathComposePlanTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathComposePlanTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveProductPathComposePlanTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS. -/
def kernelCheckLiveProductPathComposePlanTheoremsSource (src : String) : Bool :=
  match parseLiveProductPathComposePlanTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathComposePlanTheoremsParsed? : Option Module :=
  match parseLiveProductPathComposePlanTheoremsSource liveProductPathComposePlanTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathComposePlanTheoremsParsed? with
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
  match liveProductPathComposePlanTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is ProductPathComposePlanTheorems (no module line in the live file). -/
def liveParseHasProductPathComposePlanTheoremsModule : Bool :=
  match liveProductPathComposePlanTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathComposePlanTheorems"

/-- Live parse has the living ProductPathComposePlan namespace command. -/
def liveParseHasProductPathComposePlanNs : Bool :=
  match liveProductPathComposePlanTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathComposePlan"
      | _ => false

/-- Live parse imports SystemsLean.ProductPathComposePlan (kept marker). -/
def liveParseHasProductPathComposePlanImport : Bool :=
  match liveProductPathComposePlanTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "ProductPathComposePlan"
      | _ => false

/-- Skip-head: theorems unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathComposePlanTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsPpcpt liveProductPathComposePlanTheoremsSource)
    toksHaveTheoremNamed liveProductPathComposePlanTheoremsSkipFuel toks
      "stageId_eq"
      && toksHaveTheoremNamed liveProductPathComposePlanTheoremsSkipFuel toks
        "productPathPerformComposeOk_true"
      && toksHaveTheoremNamed liveProductPathComposePlanTheoremsSkipFuel toks
        "composeModuleCite_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathComposePlanTheoremsReady,
    PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS,
    HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveProductPathComposePlanTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS")
    && (liveProductPathComposePlanTheoremsRel
      == "src/systems/SystemsLean/ProductPathComposePlanTheorems.lean")
    && (liveRel == "ProductPathComposePlanTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathComposePlanTheoremsFullHost
    && !hostFrontLiveProductPathComposePlanTheoremsResidualFreeClaimed
    && !hostFrontLiveProductPathComposePlanTheoremsProvablyUnlocked
    && kernelCheckLiveProductPathComposePlanTheoremsSource liveProductPathComposePlanTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathComposePlanTheoremsModule
    && liveParseHasProductPathComposePlanNs
    && liveParseHasProductPathComposePlanImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathComposePlanTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductPathComposePlanTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS =="
  IO.println s!"  host={hostId} file={liveProductPathComposePlanTheoremsRel} liveRel={liveRel}"
  unless (liveRel == "ProductPathComposePlanTheorems.lean") do
    IO.eprintln "error: liveRel must be ProductPathComposePlanTheorems.lean"
    throw (IO.userError "liveRel basename")
  let path := root / liveProductPathComposePlanTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathComposePlanTheoremsRel}"
    throw (IO.userError s!"missing {liveProductPathComposePlanTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathComposePlanTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathComposePlanTheorems.lean != liveProductPathComposePlanTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathComposePlanTheorems.lean")
  let r := parseLiveProductPathComposePlanTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathComposePlanTheorems parse false"
      throw (IO.userError "kernelCheck live ProductPathComposePlanTheorems parse false")
    unless hostFrontLiveProductPathComposePlanTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductPathComposePlanTheoremsReady false"
      throw (IO.userError "hostFrontLiveProductPathComposePlanTheoremsReady false")
    IO.println s!"GREEN {stageId}: live ProductPathComposePlanTheorems.lean parse kernelCheck; mill stays 69; occupancy stays 49"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathComposePlanTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathComposePlanTheorems
