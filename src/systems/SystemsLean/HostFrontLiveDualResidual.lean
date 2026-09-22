/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/DualResidual.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveDualResidual. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe comment strip
  (path cites contain /), termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on DualResidual text.
  Not occupancy leftover HostModuleCheckDualResidualTerm. Not DualResidualTerm.
  Not DualResidualTheorems wrap. Not HostFrontLiveDualResidualTheorems.

  Spec (readable):
  - parseLiveDualResidualSource turns live DualResidual.lean text into HostTerm.Module.
  - Module name is SystemsLean.DualResidual even without a module line.
  - kernelCheckLiveDualResidualSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; DualResidual imports ProductPath /
    InventoryClose / SelfApplyFs / LlvmHold).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO/Int typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool defs, imports, namespace, end.
  - toksHaveDefNamed still sees dualResidualReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not DualResidualTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not DualResidualTheorems wrap.

  Unique needles (trailing newline so DualResidualTheorems wrap is not a prefix):
  HostFrontLiveDualResidual
  PARSE-LIVE-DUAL-RESIDUAL
  HOST-FRONT-LIVE-DUAL-RESIDUAL
  SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_V0

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-DUAL-RESIDUAL,
  SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_V0,
  PARSE-LIVE-DUAL-RESIDUAL, parseLiveDualResidualSource,
  kernelCheckLiveDualResidualSource,
  hostFrontLiveDualResidualReady, liveDualResidualSource, liveDualResidualRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveDualResidual
  Red/green: just slake-typecheck-dualresidual; dests skipped (sibling wrap lock);
  lake build SystemsLean.HostFrontLiveDualResidual on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveDualResidualSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveDualResidual

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-DUAL-RESIDUAL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-DUAL-RESIDUAL"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualResidualRel : String := "src/systems/SystemsLean/DualResidual.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveDualResidualFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveDualResidualResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveDualResidualProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveDualResidualParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveDualResidualSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    DualResidual path cites contain /; HostFrontLiveMult.stripComments is
    not in-string safe. -/
def stripCommentsDrN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsDrN n nest false false ('\n' :: acc) rest
        else
          stripCommentsDrN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsDrN n nest false false ('"' :: acc) rest
        else
          stripCommentsDrN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsDrN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsDrN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsDrN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsDrN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsDrN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsDrN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsDrN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsDrN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live DualResidual.lean bytes. -/
def stripCommentsDr (src : String) : String :=
  String.ofList (stripCommentsDrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . DualResidual`. -/
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
def cmdAddsDualResidual (c : Cmd) : List String :=
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
def cmdBodyKnownDualResidual (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualResidualParseFuel body
        && termNoAppN liveDualResidualParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualResidualParseFuel body
        && termNoAppN liveDualResidualParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. DualResidual kernelable defs are
    atoms (string / bool / nat / const). Compound && bodies fail closed. -/
def parseDefDualResidual (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveDualResidualSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdDualResidual (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefDualResidual fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsDualResidual : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdDualResidual liveDualResidualParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveDualResidualSkipFuel rest
      if cmdBodyKnownDualResidual kn c then
        parseCmdsDualResidual n rest2 (kn ++ cmdAddsDualResidual c) (acc ++ [c])
      else
        parseCmdsDualResidual n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveDualResidualSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsDualResidual n rest2 kn acc
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

/-- Parse live DualResidual.lean text.
    Greppable: parseLiveDualResidualSource, PARSE-LIVE-DUAL-RESIDUAL. -/
def parseLiveDualResidualSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsDr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsDualResidual liveDualResidualParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.DualResidual", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live DualResidual parse.
    Greppable: kernelCheckLiveDualResidualSource, PARSE-LIVE-DUAL-RESIDUAL. -/
def kernelCheckLiveDualResidualSource (src : String) : Bool :=
  match parseLiveDualResidualSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveDualResidualParsed? : Option Module :=
  match parseLiveDualResidualSource liveDualResidualSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveDualResidualParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveDualResidualParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.ProductPath. -/
def liveParseHasProductPathImport : Bool :=
  match liveDualResidualParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "ProductPath"
      | _ => false

/-- Live parse has the DualResidual namespace command. -/
def liveParseHasDualResidualNs : Bool :=
  match liveDualResidualParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "DualResidual"
      | _ => false

/-- Wrap module lastSeg is DualResidual (no module line in the live file). -/
def liveParseHasDualResidualModule : Bool :=
  match liveDualResidualParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "DualResidual"

/-- Live parse has core DualResidual defs (def_ or defBind).
    dualResidualReady may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveDualResidualParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsDr liveDualResidualSource)
    has "stageId" && has "hostDualResidualId" && has "selfHostDualResidualId"
      && (has "dualResidualReady"
        || toksHaveDefNamed liveDualResidualSkipFuel toks "dualResidualReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveDualResidualReady, PARSE-LIVE-DUAL-RESIDUAL,
    HOST-FRONT-LIVE-DUAL-RESIDUAL.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveDualResidualReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_V0")
    && (hostId == "HOST-FRONT-LIVE-DUAL-RESIDUAL")
    && (parseId == "PARSE-LIVE-DUAL-RESIDUAL")
    && (liveDualResidualRel == "src/systems/SystemsLean/DualResidual.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveDualResidualFullHost
    && !hostFrontLiveDualResidualResidualFreeClaimed
    && !hostFrontLiveDualResidualProvablyUnlocked
    && kernelCheckLiveDualResidualSource liveDualResidualSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathImport
    && liveParseHasDualResidualNs
    && liveParseHasDualResidualModule
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveDualResidualSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveDualResidual (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-DUAL-RESIDUAL =="
  IO.println s!"  host={hostId} file={liveDualResidualRel}"
  let path := root / liveDualResidualRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveDualResidualRel}"
    throw (IO.userError s!"missing {liveDualResidualRel}")
  let disk <- IO.FS.readFile path
  if disk != liveDualResidualSource then
    IO.eprintln "error: dual-pin mismatch: on-disk DualResidual.lean != liveDualResidualSource"
    throw (IO.userError "dual-pin mismatch live DualResidual.lean")
  let r := parseLiveDualResidualSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-DUAL-RESIDUAL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-DUAL-RESIDUAL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-DUAL-RESIDUAL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live DualResidual parse false"
      throw (IO.userError "kernelCheck live DualResidual parse false")
    unless hostFrontLiveDualResidualReady do
      IO.eprintln "error: hostFrontLiveDualResidualReady false"
      throw (IO.userError "hostFrontLiveDualResidualReady false")
    IO.println s!"GREEN {stageId}: live DualResidual.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveDualResidual root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveDualResidual
