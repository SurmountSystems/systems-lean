/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/IrNodeLayout.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveIrNodeLayout. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe comment strip
  (cites contain i32/i8 and slash-align text), termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on IrNodeLayout text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not IrNodeLayoutTerm.
  Not IrGraph.lean. Not HostFrontLiveGraph (that wrap is HostGraph).

  Spec (readable):
  - parseLiveIrNodeLayoutSource turns live IrNodeLayout.lean text into HostTerm.Module.
  - Module name is SystemsLean.IrNodeLayout even without a module line.
  - kernelCheckLiveIrNodeLayoutSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; IrNodeLayout imports Mult / Types / LlvmHold).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO/Int typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool defs, const aliases, first-conjunct decideEq atoms,
    imports, namespace, end.
  - toksHaveDefNamed still sees irNodeLayoutReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not IrNodeLayoutTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not LinearForeignLink wrap.
  - Not wrapping IrGraph.lean. Not HostFrontLiveGraph (that wrap is HostGraph).

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IR-NODE-LAYOUT,
  SLAKE_HOST_FRONT_LIVE_IR_NODE_LAYOUT_V0,
  PARSE-LIVE-IR-NODE-LAYOUT, parseLiveIrNodeLayoutSource,
  kernelCheckLiveIrNodeLayoutSource,
  hostFrontLiveIrNodeLayoutReady, liveIrNodeLayoutSource, liveIrNodeLayoutRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveIrNodeLayout
  Red/green: just slake-typecheck-irnodelayout; dests skipped (sibling wrap lock);
  lake build SystemsLean.HostFrontLiveIrNodeLayout on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveIrNodeLayoutSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveIrNodeLayout

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IR_NODE_LAYOUT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IR-NODE-LAYOUT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IR-NODE-LAYOUT"

/-- Bare product basename. No slash. -/
def liveRel : String := "IrNodeLayout.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrNodeLayoutRel : String := "src/systems/SystemsLean/IrNodeLayout.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveIrNodeLayoutFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveIrNodeLayoutResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveIrNodeLayoutProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveIrNodeLayoutParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveIrNodeLayoutSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    IrNodeLayout cites contain i32/i8 slash text; HostFrontLiveMult.stripComments is
    not in-string safe and would eat `def irNodeLayoutReady`. -/
def stripCommentsInlN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsInlN n nest false false ('\n' :: acc) rest
        else
          stripCommentsInlN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsInlN n nest false false ('"' :: acc) rest
        else
          stripCommentsInlN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsInlN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsInlN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsInlN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsInlN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsInlN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsInlN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsInlN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsInlN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live IrNodeLayout.lean bytes. -/
def stripCommentsInl (src : String) : String :=
  String.ofList (stripCommentsInlN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . IrNodeLayout`. -/
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
def cmdAddsIrNodeLayout (c : Cmd) : List String :=
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
def cmdBodyKnownIrNodeLayout (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveIrNodeLayoutParseFuel body
        && termNoAppN liveIrNodeLayoutParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveIrNodeLayoutParseFuel body
        && termNoAppN liveIrNodeLayoutParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. IrNodeLayout kernelable defs are
    atoms (string / bool / nat / const / first-conjunct decideEq). do / IO
    bodies fail closed. -/
def parseDefIrNodeLayout (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveIrNodeLayoutSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdIrNodeLayout (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefIrNodeLayout fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsIrNodeLayout : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdIrNodeLayout liveIrNodeLayoutParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveIrNodeLayoutSkipFuel rest
      if cmdBodyKnownIrNodeLayout kn c then
        parseCmdsIrNodeLayout n rest2 (kn ++ cmdAddsIrNodeLayout c) (acc ++ [c])
      else
        parseCmdsIrNodeLayout n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveIrNodeLayoutSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsIrNodeLayout n rest2 kn acc
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

/-- Parse live IrNodeLayout.lean text.
    Greppable: parseLiveIrNodeLayoutSource, PARSE-LIVE-IR-NODE-LAYOUT. -/
def parseLiveIrNodeLayoutSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsInl src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsIrNodeLayout liveIrNodeLayoutParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.IrNodeLayout", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live IrNodeLayout parse.
    Greppable: kernelCheckLiveIrNodeLayoutSource, PARSE-LIVE-IR-NODE-LAYOUT. -/
def kernelCheckLiveIrNodeLayoutSource (src : String) : Bool :=
  match parseLiveIrNodeLayoutSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveIrNodeLayoutParsed? : Option Module :=
  match parseLiveIrNodeLayoutSource liveIrNodeLayoutSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveIrNodeLayoutParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveIrNodeLayoutParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.Types. -/
def liveParseHasTypesImport : Bool :=
  match liveIrNodeLayoutParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Types"
      | _ => false

/-- Live parse has the IrNodeLayout namespace command. -/
def liveParseHasIrNodeLayoutNs : Bool :=
  match liveIrNodeLayoutParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "IrNodeLayout"
      | _ => false

/-- Live parse has core IrNodeLayout defs (def_ or defBind).
    irNodeLayoutReady may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveIrNodeLayoutParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsInl liveIrNodeLayoutSource)
    has "stageId" && has "hostId" && has "i32SizeBytes"
      && (has "irNodeLayoutReady"
        || toksHaveDefNamed liveIrNodeLayoutSkipFuel toks "irNodeLayoutReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveIrNodeLayoutReady, PARSE-LIVE-IR-NODE-LAYOUT,
    HOST-FRONT-LIVE-IR-NODE-LAYOUT.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveIrNodeLayoutReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IR_NODE_LAYOUT_V0")
    && (hostId == "HOST-FRONT-LIVE-IR-NODE-LAYOUT")
    && (parseId == "PARSE-LIVE-IR-NODE-LAYOUT")
    && (liveRel == "IrNodeLayout.lean")
    && (liveIrNodeLayoutRel == "src/systems/SystemsLean/IrNodeLayout.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveIrNodeLayoutFullHost
    && !hostFrontLiveIrNodeLayoutResidualFreeClaimed
    && !hostFrontLiveIrNodeLayoutProvablyUnlocked
    && kernelCheckLiveIrNodeLayoutSource liveIrNodeLayoutSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasTypesImport
    && liveParseHasIrNodeLayoutNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveIrNodeLayoutSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveIrNodeLayout (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IR-NODE-LAYOUT =="
  IO.println s!"  host={hostId} file={liveIrNodeLayoutRel}"
  let path := root / liveIrNodeLayoutRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveIrNodeLayoutRel}"
    throw (IO.userError s!"missing {liveIrNodeLayoutRel}")
  let disk <- IO.FS.readFile path
  if disk != liveIrNodeLayoutSource then
    IO.eprintln "error: dual-pin mismatch: on-disk IrNodeLayout.lean != liveIrNodeLayoutSource"
    throw (IO.userError "dual-pin mismatch live IrNodeLayout.lean")
  let r := parseLiveIrNodeLayoutSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IR-NODE-LAYOUT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IR-NODE-LAYOUT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IR-NODE-LAYOUT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live IrNodeLayout parse false"
      throw (IO.userError "kernelCheck live IrNodeLayout parse false")
    unless hostFrontLiveIrNodeLayoutReady do
      IO.eprintln "error: hostFrontLiveIrNodeLayoutReady false"
      throw (IO.userError "hostFrontLiveIrNodeLayoutReady false")
    IO.println s!"GREEN {stageId}: live IrNodeLayout.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveIrNodeLayout root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveIrNodeLayout
