/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/ProductOutKernelTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductOutKernelTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses ProductOutKernelTheorems.lean only.
  Do not steal the library wrap of ProductOutKernel.lean.

  Spec (readable):
  - parseLiveProductOutKernelTheoremsSource turns live
    ProductOutKernelTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.ProductOutKernelTheorems even without a
    module line.
  - kernelCheckLiveProductOutKernelTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem
    productOutKernelEvidencePartialReady_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not the ProductOutKernel.lean library wrap.

  Unique needles (THEOREMS suffix plus trailing newline so a grep of a shorter
  ProductOutKernel needle is not a prefix hit):
  HostFrontLiveProductOutKernelTheorems
  PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProductOutKernelTheoremsSource,
  kernelCheckLiveProductOutKernelTheoremsSource,
  hostFrontLiveProductOutKernelTheoremsReady,
  liveProductOutKernelTheoremsSource,
  liveProductOutKernelTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductOutKernelTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveProductOutKernelTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductOutKernelTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductOutKernelTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductOutKernelTheoremsRel : String :=
  "src/systems/SystemsLean/ProductOutKernelTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductOutKernelTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductOutKernelTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductOutKernelTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductOutKernelTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveProductOutKernelTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProductOutKernelTheorems has quoted phrases in comments and theorem
    statements. HostFrontLiveMult.stripComments is not in-string safe.
    Backslash keeps the next char inside a string. -/
def stripCommentsPoktN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPoktN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPoktN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPoktN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPoktN n nest false false ('"' :: acc) rest
        else
          stripCommentsPoktN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPoktN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPoktN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPoktN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPoktN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPoktN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPoktN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPoktN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPoktN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live ProductOutKernelTheorems.lean bytes. -/
def stripCommentsPokt (src : String) : String :=
  String.ofList (stripCommentsPoktN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProductOutKernel`. -/
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
def cmdAddsProductOutKernelTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownProductOutKernelTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductOutKernelTheoremsParseFuel body
        && termNoAppN liveProductOutKernelTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductOutKernelTheoremsParseFuel body
        && termNoAppN liveProductOutKernelTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductOutKernelTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsProductOutKernelTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductOutKernelTheorems liveProductOutKernelTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductOutKernelTheoremsSkipFuel rest
      if cmdBodyKnownProductOutKernelTheorems kn c then
        parseCmdsProductOutKernelTheorems n rest2
          (kn ++ cmdAddsProductOutKernelTheorems c) (acc ++ [c])
      else
        parseCmdsProductOutKernelTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductOutKernelTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductOutKernelTheorems n rest2 kn acc
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

/-- Parse live ProductOutKernelTheorems.lean text.
    Greppable: parseLiveProductOutKernelTheoremsSource,
    PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS. -/
def parseLiveProductOutKernelTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPokt src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductOutKernelTheorems liveProductOutKernelTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductOutKernelTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductOutKernelTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveProductOutKernelTheoremsSource,
    PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS. -/
def kernelCheckLiveProductOutKernelTheoremsSource (src : String) : Bool :=
  match parseLiveProductOutKernelTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductOutKernelTheoremsParsed? : Option Module :=
  match parseLiveProductOutKernelTheoremsSource liveProductOutKernelTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductOutKernelTheoremsParsed? with
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
  match liveProductOutKernelTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is ProductOutKernelTheorems (no module line in the live file). -/
def liveParseHasProductOutKernelTheoremsModule : Bool :=
  match liveProductOutKernelTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductOutKernelTheorems"

/-- Live parse has the living ProductOutKernel namespace command. -/
def liveParseHasProductOutKernelNs : Bool :=
  match liveProductOutKernelTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductOutKernel"
      | _ => false

/-- Live parse imports SystemsLean.ProductOutKernel (kept marker). -/
def liveParseHasProductOutKernelImport : Bool :=
  match liveProductOutKernelTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "ProductOutKernel"
      | _ => false

/-- Skip-head: theorem unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductOutKernelTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsPokt liveProductOutKernelTheoremsSource)
    toksHaveTheoremNamed liveProductOutKernelTheoremsSkipFuel toks
      "productOutKernelEvidencePartialReady_true"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductOutKernelTheoremsReady,
    PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS,
    HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveProductOutKernelTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL-THEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS")
    && (liveProductOutKernelTheoremsRel
      == "src/systems/SystemsLean/ProductOutKernelTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductOutKernelTheoremsFullHost
    && !hostFrontLiveProductOutKernelTheoremsResidualFreeClaimed
    && !hostFrontLiveProductOutKernelTheoremsProvablyUnlocked
    && kernelCheckLiveProductOutKernelTheoremsSource liveProductOutKernelTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductOutKernelTheoremsModule
    && liveParseHasProductOutKernelNs
    && liveParseHasProductOutKernelImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductOutKernelTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductOutKernelTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS =="
  IO.println s!"  host={hostId} file={liveProductOutKernelTheoremsRel}"
  let path := root / liveProductOutKernelTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductOutKernelTheoremsRel}"
    throw (IO.userError s!"missing {liveProductOutKernelTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductOutKernelTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductOutKernelTheorems.lean != liveProductOutKernelTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductOutKernelTheorems.lean")
  let r := parseLiveProductOutKernelTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS ACCEPT liveRel=ProductOutKernelTheorems.lean cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductOutKernelTheorems parse false"
      throw (IO.userError "kernelCheck live ProductOutKernelTheorems parse false")
    unless hostFrontLiveProductOutKernelTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductOutKernelTheoremsReady false"
      throw (IO.userError "hostFrontLiveProductOutKernelTheoremsReady false")
    IO.println s!"GREEN {stageId}: live ProductOutKernelTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductOutKernelTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductOutKernelTheorems
