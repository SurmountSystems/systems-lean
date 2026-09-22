/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathWriteHcTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathWriteHcTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses ProductPathWriteHcTheorems.lean only.
  Do not steal the library wrap of ProductPathWriteHc.lean.
  Do not steal the mill-Main wrap of ProductPathWriteHcMain.lean.

  Spec (readable):
  - parseLiveProductPathWriteHcTheoremsSource turns live
    ProductPathWriteHcTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathWriteHcTheorems even without a
    module line.
  - kernelCheckLiveProductPathWriteHcTheoremsSource is HostKernel.kernelCheck
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
  - Not the ProductPathWriteHc.lean library wrap.
  - Not the ProductPathWriteHcMain.lean mill wrap.

  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveProductPathWriteHcTheorems
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITE_HC_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProductPathWriteHcTheoremsSource,
  kernelCheckLiveProductPathWriteHcTheoremsSource,
  hostFrontLiveProductPathWriteHcTheoremsReady,
  liveProductPathWriteHcTheoremsSource,
  liveProductPathWriteHcTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductPathWriteHcTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveProductPathWriteHcTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathWriteHcTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathWriteHcTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITE_HC_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriteHcTheoremsRel : String :=
  "src/systems/SystemsLean/ProductPathWriteHcTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathWriteHcTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathWriteHcTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathWriteHcTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathWriteHcTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveProductPathWriteHcTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProductPathWriteHcTheorems has quoted phrases in comments and theorem
    statements. HostFrontLiveMult.stripComments is not in-string safe.
    Backslash keeps the next char inside a string. -/
def stripCommentsPpwhctN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPpwhctN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPpwhctN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPpwhctN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPpwhctN n nest false false ('"' :: acc) rest
        else
          stripCommentsPpwhctN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPpwhctN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPpwhctN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPpwhctN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPpwhctN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPpwhctN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPpwhctN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPpwhctN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPpwhctN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live ProductPathWriteHcTheorems.lean bytes. -/
def stripCommentsPpwhct (src : String) : String :=
  String.ofList (stripCommentsPpwhctN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProductPathWriteHc`. -/
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
def cmdAddsProductPathWriteHcTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathWriteHcTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriteHcTheoremsParseFuel body
        && termNoAppN liveProductPathWriteHcTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriteHcTheoremsParseFuel body
        && termNoAppN liveProductPathWriteHcTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathWriteHcTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsProductPathWriteHcTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathWriteHcTheorems liveProductPathWriteHcTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathWriteHcTheoremsSkipFuel rest
      if cmdBodyKnownProductPathWriteHcTheorems kn c then
        parseCmdsProductPathWriteHcTheorems n rest2
          (kn ++ cmdAddsProductPathWriteHcTheorems c) (acc ++ [c])
      else
        parseCmdsProductPathWriteHcTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathWriteHcTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathWriteHcTheorems n rest2 kn acc
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

/-- Parse live ProductPathWriteHcTheorems.lean text.
    Greppable: parseLiveProductPathWriteHcTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS. -/
def parseLiveProductPathWriteHcTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPpwhct src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathWriteHcTheorems liveProductPathWriteHcTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathWriteHcTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathWriteHcTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveProductPathWriteHcTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS. -/
def kernelCheckLiveProductPathWriteHcTheoremsSource (src : String) : Bool :=
  match parseLiveProductPathWriteHcTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathWriteHcTheoremsParsed? : Option Module :=
  match parseLiveProductPathWriteHcTheoremsSource liveProductPathWriteHcTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathWriteHcTheoremsParsed? with
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
  match liveProductPathWriteHcTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is ProductPathWriteHcTheorems (no module line in the live file). -/
def liveParseHasProductPathWriteHcTheoremsModule : Bool :=
  match liveProductPathWriteHcTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathWriteHcTheorems"

/-- Live parse has the living ProductPathWriteHc namespace command. -/
def liveParseHasProductPathWriteHcNs : Bool :=
  match liveProductPathWriteHcTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathWriteHc"
      | _ => false

/-- Live parse imports SystemsLean.ProductPathWriteHc (kept marker). -/
def liveParseHasProductPathWriteHcImport : Bool :=
  match liveProductPathWriteHcTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "ProductPathWriteHc"
      | _ => false

/-- Skip-head: theorems unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathWriteHcTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsPpwhct liveProductPathWriteHcTheoremsSource)
    toksHaveTheoremNamed liveProductPathWriteHcTheoremsSkipFuel toks
      "stageId_eq"
      && toksHaveTheoremNamed liveProductPathWriteHcTheoremsSkipFuel toks
        "productPathPerformWriteHcOk_true"
      && toksHaveTheoremNamed liveProductPathWriteHcTheoremsSkipFuel toks
        "writeHcModuleCite_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathWriteHcTheoremsReady,
    PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS,
    HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveProductPathWriteHcTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITE_HC_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS")
    && (liveProductPathWriteHcTheoremsRel
      == "src/systems/SystemsLean/ProductPathWriteHcTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathWriteHcTheoremsFullHost
    && !hostFrontLiveProductPathWriteHcTheoremsResidualFreeClaimed
    && !hostFrontLiveProductPathWriteHcTheoremsProvablyUnlocked
    && kernelCheckLiveProductPathWriteHcTheoremsSource liveProductPathWriteHcTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathWriteHcTheoremsModule
    && liveParseHasProductPathWriteHcNs
    && liveParseHasProductPathWriteHcImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathWriteHcTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductPathWriteHcTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS =="
  IO.println s!"  host={hostId} file={liveProductPathWriteHcTheoremsRel}"
  let path := root / liveProductPathWriteHcTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathWriteHcTheoremsRel}"
    throw (IO.userError s!"missing {liveProductPathWriteHcTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathWriteHcTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathWriteHcTheorems.lean != liveProductPathWriteHcTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathWriteHcTheorems.lean")
  let r := parseLiveProductPathWriteHcTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS ACCEPT liveRel=ProductPathWriteHcTheorems.lean cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathWriteHcTheorems parse false"
      throw (IO.userError "kernelCheck live ProductPathWriteHcTheorems parse false")
    unless hostFrontLiveProductPathWriteHcTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductPathWriteHcTheoremsReady false"
      throw (IO.userError "hostFrontLiveProductPathWriteHcTheoremsReady false")
    IO.println s!"GREEN {stageId}: live ProductPathWriteHcTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathWriteHcTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathWriteHcTheorems
