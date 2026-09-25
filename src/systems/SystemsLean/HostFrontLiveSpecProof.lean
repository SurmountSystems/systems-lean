/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SpecProof.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSpecProof. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe comment strip
  (path cites contain slash text), termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on SpecProof text.
  Not occupancy leftover HostModuleCheckSpecProofTerm. Not SpecProofTerm.
  Not DualResidual wrap. Not IrGraph.lean. Not Linear.lean.

  Spec (readable):
  - parseLiveSpecProofSource turns live SpecProof.lean text into HostTerm.Module.
  - Module name is SystemsLean.SpecProof even without a module line.
  - kernelCheckLiveSpecProofSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; SpecProof imports ProbeWire / DualResidual).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO/Int typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool defs, const aliases, first-conjunct decideEq atoms,
    imports, namespace, end.
  - toksHaveDefNamed still sees specProofReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not SpecProofTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not LinearForeignLink wrap.
  - Not wrapping DualResidual.lean (sibling wrap). Not IrGraph.lean.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SPEC-PROOF,
  SLAKE_HOST_FRONT_LIVE_SPEC_PROOF_V0,
  PARSE-LIVE-SPEC-PROOF, parseLiveSpecProofSource,
  kernelCheckLiveSpecProofSource,
  hostFrontLiveSpecProofReady, liveSpecProofSource, liveSpecProofRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSpecProof
  Red/green: just slake-typecheck-specproof; dests skipped (sibling wrap lock);
  lake build SystemsLean.HostFrontLiveSpecProof on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSpecProofSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSpecProof

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SPEC_PROOF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SPEC-PROOF"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SPEC-PROOF"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSpecProofRel : String := "src/systems/SystemsLean/SpecProof.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "SpecProof.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSpecProofFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSpecProofResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSpecProofProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSpecProofParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSpecProofSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    SpecProof path cites contain slash text; HostFrontLiveMult.stripComments is
    not in-string safe and would eat `def specProofReady`. -/
def stripCommentsSpN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsSpN n nest false false ('\n' :: acc) rest
        else
          stripCommentsSpN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsSpN n nest false false ('"' :: acc) rest
        else
          stripCommentsSpN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsSpN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsSpN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsSpN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsSpN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsSpN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsSpN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsSpN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsSpN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live SpecProof.lean bytes. -/
def stripCommentsSp (src : String) : String :=
  String.ofList (stripCommentsSpN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . SpecProof`. -/
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
def cmdAddsSpecProof (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so `"a" ++ "b"` becomes app of two string lits.
    Kernel cannot apply String. Skip any Term.app (keep lits / const / ite). -/
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

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/IO/Int typed defs. -/
def cmdBodyKnownSpecProof (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSpecProofParseFuel body
        && termNoAppN liveSpecProofParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSpecProofParseFuel body
        && termNoAppN liveSpecProofParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. SpecProof kernelable defs are
    atoms (string / bool / nat / const / first-conjunct decideEq). do / IO
    bodies fail closed. -/
def parseDefSpecProof (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveSpecProofSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdSpecProof (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSpecProof fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsSpecProof : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSpecProof liveSpecProofParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSpecProofSkipFuel rest
      if cmdBodyKnownSpecProof kn c then
        parseCmdsSpecProof n rest2 (kn ++ cmdAddsSpecProof c) (acc ++ [c])
      else
        parseCmdsSpecProof n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSpecProofSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSpecProof n rest2 kn acc
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

/-- Parse live SpecProof.lean text.
    Greppable: parseLiveSpecProofSource, PARSE-LIVE-SPEC-PROOF. -/
def parseLiveSpecProofSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsSp src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSpecProof liveSpecProofParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SpecProof", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SpecProof parse.
    Greppable: kernelCheckLiveSpecProofSource, PARSE-LIVE-SPEC-PROOF. -/
def kernelCheckLiveSpecProofSource (src : String) : Bool :=
  match parseLiveSpecProofSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSpecProofParsed? : Option Module :=
  match parseLiveSpecProofSource liveSpecProofSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSpecProofParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveSpecProofParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.ProbeWire. -/
def liveParseHasProbeWireImport : Bool :=
  match liveSpecProofParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "ProbeWire"
      | _ => false

/-- Live parse has the SpecProof namespace command. -/
def liveParseHasSpecProofNs : Bool :=
  match liveSpecProofParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SpecProof"
      | _ => false

/-- Live parse has core SpecProof defs (def_ or defBind).
    specProofReady may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveSpecProofParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsSp liveSpecProofSource)
    has "stageId" && has "hostSpecProofId"
      && (has "specProofReady"
        || toksHaveDefNamed liveSpecProofSkipFuel toks "specProofReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSpecProofReady, PARSE-LIVE-SPEC-PROOF,
    HOST-FRONT-LIVE-SPEC-PROOF.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSpecProofReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SPEC_PROOF_V0")
    && (hostId == "HOST-FRONT-LIVE-SPEC-PROOF")
    && (parseId == "PARSE-LIVE-SPEC-PROOF")
    && (liveSpecProofRel == "src/systems/SystemsLean/SpecProof.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSpecProofFullHost
    && !hostFrontLiveSpecProofResidualFreeClaimed
    && !hostFrontLiveSpecProofProvablyUnlocked
    && kernelCheckLiveSpecProofSource liveSpecProofSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProbeWireImport
    && liveParseHasSpecProofNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSpecProofSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSpecProof (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SPEC-PROOF =="
  IO.println s!"  host={hostId} file={liveSpecProofRel}"
  let path := root / liveSpecProofRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSpecProofRel}"
    throw (IO.userError s!"missing {liveSpecProofRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSpecProofSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SpecProof.lean != liveSpecProofSource"
    throw (IO.userError "dual-pin mismatch live SpecProof.lean")
  let r := parseLiveSpecProofSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SPEC-PROOF reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SPEC-PROOF reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SPEC-PROOF ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SpecProof parse false"
      throw (IO.userError "kernelCheck live SpecProof parse false")
    unless hostFrontLiveSpecProofReady do
      IO.eprintln "error: hostFrontLiveSpecProofReady false"
      throw (IO.userError "hostFrontLiveSpecProofReady false")
    IO.println s!"GREEN {stageId}: live SpecProof.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSpecProof root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSpecProof
