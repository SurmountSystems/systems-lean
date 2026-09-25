/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathReadSsotTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathReadSsotTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses ProductPathReadSsotTheorems.lean only.
  Do not steal the library wrap of ProductPathReadSsot.lean.
  Do not steal the mill-Main wrap of ProductPathReadSsotMain.lean.

  Spec (readable):
  - parseLiveProductPathReadSsotTheoremsSource turns live
    ProductPathReadSsotTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathReadSsotTheorems even without a
    module line.
  - kernelCheckLiveProductPathReadSsotTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem stageId_eq.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not the ProductPathReadSsot.lean library wrap.
  - Not the ProductPathReadSsotMain.lean mill wrap.

  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveProductPathReadSsotTheorems
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProductPathReadSsotTheoremsSource,
  kernelCheckLiveProductPathReadSsotTheoremsSource,
  hostFrontLiveProductPathReadSsotTheoremsReady,
  liveProductPathReadSsotTheoremsSource,
  liveProductPathReadSsotTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductPathReadSsotTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveProductPathReadSsotTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathReadSsotTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathReadSsotTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathReadSsotTheoremsRel : String :=
  "src/systems/SystemsLean/ProductPathReadSsotTheorems.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "ProductPathReadSsotTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathReadSsotTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathReadSsotTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathReadSsotTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathReadSsotTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveProductPathReadSsotTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProductPathReadSsotTheorems has quoted phrases in comments and theorem
    statements. HostFrontLiveMult.stripComments is not in-string safe.
    Backslash keeps the next char inside a string. -/
def stripCommentsPprsstN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPprsstN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPprsstN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPprsstN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPprsstN n nest false false ('"' :: acc) rest
        else
          stripCommentsPprsstN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPprsstN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPprsstN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPprsstN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPprsstN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPprsstN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPprsstN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPprsstN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPprsstN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live ProductPathReadSsotTheorems.lean bytes. -/
def stripCommentsPprsst (src : String) : String :=
  String.ofList (stripCommentsPprsstN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProductPathReadSsot`. -/
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
def cmdAddsProductPathReadSsotTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathReadSsotTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathReadSsotTheoremsParseFuel body
        && termNoAppN liveProductPathReadSsotTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathReadSsotTheoremsParseFuel body
        && termNoAppN liveProductPathReadSsotTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathReadSsotTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPathReadSsotTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathReadSsotTheorems liveProductPathReadSsotTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathReadSsotTheoremsSkipFuel rest
      if cmdBodyKnownProductPathReadSsotTheorems kn c then
        parseCmdsProductPathReadSsotTheorems n rest2
          (kn ++ cmdAddsProductPathReadSsotTheorems c) (acc ++ [c])
      else
        parseCmdsProductPathReadSsotTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathReadSsotTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathReadSsotTheorems n rest2 kn acc
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

/-- Parse live ProductPathReadSsotTheorems.lean text.
    Greppable: parseLiveProductPathReadSsotTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS. -/
def parseLiveProductPathReadSsotTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPprsst src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathReadSsotTheorems liveProductPathReadSsotTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathReadSsotTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathReadSsotTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveProductPathReadSsotTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS. -/
def kernelCheckLiveProductPathReadSsotTheoremsSource (src : String) : Bool :=
  match parseLiveProductPathReadSsotTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathReadSsotTheoremsParsed? : Option Module :=
  match parseLiveProductPathReadSsotTheoremsSource liveProductPathReadSsotTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathReadSsotTheoremsParsed? with
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
  match liveProductPathReadSsotTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is ProductPathReadSsotTheorems (no module line in the live file). -/
def liveParseHasProductPathReadSsotTheoremsModule : Bool :=
  match liveProductPathReadSsotTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathReadSsotTheorems"

/-- Live parse has the living ProductPathReadSsot namespace command. -/
def liveParseHasProductPathReadSsotNs : Bool :=
  match liveProductPathReadSsotTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathReadSsot"
      | _ => false

/-- Live parse imports SystemsLean.ProductPathReadSsot (kept marker). -/
def liveParseHasProductPathReadSsotImport : Bool :=
  match liveProductPathReadSsotTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "ProductPathReadSsot"
      | _ => false

/-- Skip-head: theorems unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathReadSsotTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsPprsst liveProductPathReadSsotTheoremsSource)
    toksHaveTheoremNamed liveProductPathReadSsotTheoremsSkipFuel toks
      "stageId_eq"
      && toksHaveTheoremNamed liveProductPathReadSsotTheoremsSkipFuel toks
        "productPathPerformReadOk_true"
      && toksHaveTheoremNamed liveProductPathReadSsotTheoremsSkipFuel toks
        "readModuleCite_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathReadSsotTheoremsReady,
    PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS,
    HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveProductPathReadSsotTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS")
    && (liveProductPathReadSsotTheoremsRel
      == "src/systems/SystemsLean/ProductPathReadSsotTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathReadSsotTheoremsFullHost
    && !hostFrontLiveProductPathReadSsotTheoremsResidualFreeClaimed
    && !hostFrontLiveProductPathReadSsotTheoremsProvablyUnlocked
    && kernelCheckLiveProductPathReadSsotTheoremsSource liveProductPathReadSsotTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathReadSsotTheoremsModule
    && liveParseHasProductPathReadSsotNs
    && liveParseHasProductPathReadSsotImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathReadSsotTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductPathReadSsotTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveProductPathReadSsotTheoremsRel}"
  let path := root / liveProductPathReadSsotTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathReadSsotTheoremsRel}"
    throw (IO.userError s!"missing {liveProductPathReadSsotTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathReadSsotTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathReadSsotTheorems.lean != liveProductPathReadSsotTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathReadSsotTheorems.lean")
  let r := parseLiveProductPathReadSsotTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS ACCEPT liveRel=ProductPathReadSsotTheorems.lean cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathReadSsotTheorems parse false"
      throw (IO.userError "kernelCheck live ProductPathReadSsotTheorems parse false")
    unless hostFrontLiveProductPathReadSsotTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductPathReadSsotTheoremsReady false"
      throw (IO.userError "hostFrontLiveProductPathReadSsotTheoremsReady false")
    IO.println s!"GREEN {stageId}: live ProductPathReadSsotTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathReadSsotTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathReadSsotTheorems
