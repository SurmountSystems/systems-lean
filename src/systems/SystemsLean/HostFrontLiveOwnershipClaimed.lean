/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OwnershipClaimed.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveOwnershipClaimed. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses OwnershipClaimed.lean only.
  Unique needles use trailing newline so HostFrontLiveOwnershipClaimed is not a
  prefix hit on HostFrontLiveOwnershipClaimedSource or a Theorems peel.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not OwnershipClaimedTheorems wrap (do not invent that peel wrap).
  Not CapableWrite.lean. Not DualEqWrite.lean (those files do not exist).
  Occupancy stays 49. Mill stays 69 of 69. FullHost false.
  slakeOwnsPackageTypecheck stays false. Not Lake-gone.

  Spec (readable):
  - parseLiveOwnershipClaimedSource turns live OwnershipClaimed.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.OwnershipClaimed even without a module line.
  - kernelCheckLiveOwnershipClaimedSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. Kernelable string/Nat/Bool atom defs plus namespace /
    end remain. This live file has no import lines. Skip-head still sees
    def productPathFreestandingOwnershipClaimedMeasured and
    def productPathFreestandingOwnershipClaimedPartialReady.
  - Skip-fold ALL theorems and examples. Compound && Ok / PartialReady skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - private peel then skip or drop.
  - Living namespace lastSeg is OwnershipClaimed.
  - Wrap-assigned module lastSeg is OwnershipClaimed.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not an OwnershipClaimedTheorems peel wrap.

  Unique needles (trailing newline so HostFrontLiveOwnershipClaimed is not a prefix):
  HostFrontLiveOwnershipClaimed
  PARSE-LIVE-OWNERSHIP-CLAIMED
  HOST-FRONT-LIVE-OWNERSHIP-CLAIMED
  SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_V0
  OWNERSHIP-CLAIMED

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveOwnershipClaimedSource,
  kernelCheckLiveOwnershipClaimedSource,
  hostFrontLiveOwnershipClaimedReady, liveOwnershipClaimedSource,
  liveOwnershipClaimedRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveOwnershipClaimed
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveOwnershipClaimed on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOwnershipClaimedSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOwnershipClaimed

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OWNERSHIP-CLAIMED"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OWNERSHIP-CLAIMED"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOwnershipClaimedRel : String :=
  "src/systems/SystemsLean/OwnershipClaimed.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "OwnershipClaimed.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOwnershipClaimedFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOwnershipClaimedResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveOwnershipClaimedProvablyUnlocked : Bool := false

/-- Honesty: occupancy stays 49. -/
def hostFrontLiveOwnershipClaimedOccupancy : Nat := 49

/-- Honesty: mill stays 69 of 69. -/
def hostFrontLiveOwnershipClaimedMill : Nat := 69

/-- Parse fuel (command fold). Inventory is namespace plus ~48 defs plus end. -/
def liveOwnershipClaimedParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveOwnershipClaimedSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    OwnershipClaimed has quoted phrases in comments and s! interpolations.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsOrN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsOrN n nest false false ('\n' :: acc) rest
        else
          stripCommentsOrN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsOrN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsOrN n nest false false ('"' :: acc) rest
        else
          stripCommentsOrN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsOrN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsOrN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsOrN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsOrN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsOrN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsOrN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsOrN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsOrN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live OwnershipClaimed.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . OwnershipClaimed`. -/
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
def cmdAddsOwnershipClaimed (c : Cmd) : List String :=
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
def cmdBodyKnownOwnershipClaimed (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOwnershipClaimedParseFuel body
        && termNoAppN liveOwnershipClaimedParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOwnershipClaimedParseFuel body
        && termNoAppN liveOwnershipClaimedParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefOwnershipClaimed (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveOwnershipClaimedSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdOwnershipClaimed (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefOwnershipClaimed fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. private peel then skipUntilCmd. -/
def parseCmdsOwnershipClaimed : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOwnershipClaimed liveOwnershipClaimedParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOwnershipClaimedSkipFuel rest
      if cmdBodyKnownOwnershipClaimed kn c then
        parseCmdsOwnershipClaimed n rest2
          (kn ++ cmdAddsOwnershipClaimed c) (acc ++ [c])
      else
        parseCmdsOwnershipClaimed n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsOwnershipClaimed n rest kn acc
      | _ :: rest =>
        let rest2 := skipUntilCmd liveOwnershipClaimedSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsOwnershipClaimed n rest2 kn acc
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

/-- Parse live OwnershipClaimed.lean text.
    Greppable: parseLiveOwnershipClaimedSource,
    PARSE-LIVE-OWNERSHIP-CLAIMED. -/
def parseLiveOwnershipClaimedSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOwnershipClaimed liveOwnershipClaimedParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OwnershipClaimed"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OwnershipClaimed parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveOwnershipClaimedSource,
    PARSE-LIVE-OWNERSHIP-CLAIMED. -/
def kernelCheckLiveOwnershipClaimedSource (src : String) : Bool :=
  match parseLiveOwnershipClaimedSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOwnershipClaimedParsed? : Option Module :=
  match parseLiveOwnershipClaimedSource liveOwnershipClaimedSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOwnershipClaimedParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Inventory
    kept commands: namespace, forty-four kernelable String/Bool atoms,
    end. OwnershipClaimed has no import lines. Do not copy a
    HostCost bound of 16. -/
def liveParseCmdCountOk : Bool :=
  match liveOwnershipClaimedParsed? with
  | some m => m.commands.length >= 46
  | none => false

/-- Wrap module lastSeg is OwnershipClaimed (no module line in the live file). -/
def liveParseHasOwnershipClaimedModule : Bool :=
  match liveOwnershipClaimedParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "OwnershipClaimed"

/-- Live parse has the living OwnershipClaimed namespace command. -/
def liveParseHasOwnershipClaimedNs : Bool :=
  match liveOwnershipClaimedParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "OwnershipClaimed"
      | _ => false

/-- Skip-head: defs unique to OwnershipClaimed.lean (not OwnershipClaimedTheorems
    theorem names). Greppable: productPathFreestandingOwnershipClaimedMeasured,
    productPathFreestandingOwnershipClaimedPartialReady. -/
def liveParseHasCoreDefs : Bool :=
  match liveOwnershipClaimedParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveOwnershipClaimedSource)
    toksHaveDefNamed liveOwnershipClaimedSkipFuel toks
      "productPathFreestandingOwnershipClaimedMeasured"
      && toksHaveDefNamed liveOwnershipClaimedSkipFuel toks
        "productPathFreestandingOwnershipClaimedPartialReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOwnershipClaimedReady,
    PARSE-LIVE-OWNERSHIP-CLAIMED,
    HOST-FRONT-LIVE-OWNERSHIP-CLAIMED.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveOwnershipClaimedReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_V0")
    && (hostId == "HOST-FRONT-LIVE-OWNERSHIP-CLAIMED")
    && (parseId == "PARSE-LIVE-OWNERSHIP-CLAIMED")
    && (liveOwnershipClaimedRel
      == "src/systems/SystemsLean/OwnershipClaimed.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOwnershipClaimedFullHost
    && !hostFrontLiveOwnershipClaimedResidualFreeClaimed
    && !hostFrontLiveOwnershipClaimedProvablyUnlocked
    && (hostFrontLiveOwnershipClaimedOccupancy == 49)
    && (hostFrontLiveOwnershipClaimedMill == 69)
    && kernelCheckLiveOwnershipClaimedSource liveOwnershipClaimedSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasOwnershipClaimedModule
    && liveParseHasOwnershipClaimedNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOwnershipClaimedSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveOwnershipClaimed (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OWNERSHIP-CLAIMED =="
  IO.println s!"  host={hostId} file={liveOwnershipClaimedRel}"
  let path := root / liveOwnershipClaimedRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOwnershipClaimedRel}"
    throw (IO.userError s!"missing {liveOwnershipClaimedRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOwnershipClaimedSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OwnershipClaimed.lean != liveOwnershipClaimedSource"
    throw (IO.userError "dual-pin mismatch live OwnershipClaimed.lean")
  let r := parseLiveOwnershipClaimedSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OWNERSHIP-CLAIMED reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OWNERSHIP-CLAIMED reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OWNERSHIP-CLAIMED ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OwnershipClaimed parse false"
      throw (IO.userError "kernelCheck live OwnershipClaimed parse false")
    unless hostFrontLiveOwnershipClaimedReady do
      IO.eprintln "error: hostFrontLiveOwnershipClaimedReady false"
      throw (IO.userError "hostFrontLiveOwnershipClaimedReady false")
    IO.println s!"GREEN {stageId}: live OwnershipClaimed.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOwnershipClaimed root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOwnershipClaimed
