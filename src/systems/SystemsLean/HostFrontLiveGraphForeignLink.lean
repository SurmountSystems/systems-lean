/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/GraphForeignLink.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGraphForeignLink. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe comment strip
  (cites contain 0 / -1), termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on GraphForeignLink text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not GraphForeignLinkTerm.

  Spec (readable):
  - parseLiveGraphForeignLinkSource turns live GraphForeignLink.lean text into HostTerm.Module.
  - Module name is SystemsLean.GraphForeignLink even without a module line.
  - kernelCheckLiveGraphForeignLinkSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; GraphForeignLink imports IrGraph / LlvmHold / LlvmGraphSsa).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO/Int typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool defs, imports, namespace, end.
  - toksHaveDefNamed still sees graphForeignLinkReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not GraphForeignLinkTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not LinearForeignLink wrap.
  - Not wrapping HostGraph.lean. Not HostFrontLiveGraph (that wrap is HostGraph).

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-GRAPH-FOREIGN-LINK,
  SLAKE_HOST_FRONT_LIVE_GRAPH_FOREIGN_LINK_V0,
  PARSE-LIVE-GRAPH-FOREIGN-LINK, parseLiveGraphForeignLinkSource,
  kernelCheckLiveGraphForeignLinkSource,
  hostFrontLiveGraphForeignLinkReady, liveGraphForeignLinkSource, liveRel,
  liveGraphForeignLinkRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveGraphForeignLink
  Red/green: just slake-typecheck-graphforeignlink; dests skipped (sibling wrap lock);
  lake build SystemsLean.HostFrontLiveGraphForeignLink on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveGraphForeignLinkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveGraphForeignLink

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_GRAPH_FOREIGN_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-GRAPH-FOREIGN-LINK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-GRAPH-FOREIGN-LINK"

/-- Live basename. Greppable: liveRel. Must be GraphForeignLink.lean. -/
def liveRel : String := "GraphForeignLink.lean"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveGraphForeignLinkRel : String := "src/systems/SystemsLean/GraphForeignLink.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveGraphForeignLinkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveGraphForeignLinkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveGraphForeignLinkProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveGraphForeignLinkParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveGraphForeignLinkSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    GraphForeignLink cites contain 0 / -1; HostFrontLiveMult.stripComments is
    not in-string safe and would eat `def graphForeignLinkReady`. -/
def stripCommentsGflN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsGflN n nest false false ('\n' :: acc) rest
        else
          stripCommentsGflN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsGflN n nest false false ('"' :: acc) rest
        else
          stripCommentsGflN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsGflN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsGflN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsGflN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsGflN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsGflN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsGflN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsGflN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsGflN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live GraphForeignLink.lean bytes. -/
def stripCommentsGfl (src : String) : String :=
  String.ofList (stripCommentsGflN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . GraphForeignLink`. -/
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
def cmdAddsGraphForeignLink (c : Cmd) : List String :=
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
def cmdBodyKnownGraphForeignLink (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveGraphForeignLinkParseFuel body
        && termNoAppN liveGraphForeignLinkParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveGraphForeignLinkParseFuel body
        && termNoAppN liveGraphForeignLinkParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. GraphForeignLink kernelable defs are
    atoms (string / bool / nat / const). do / IO bodies fail closed. -/
def parseDefGraphForeignLink (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveGraphForeignLinkSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdGraphForeignLink (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefGraphForeignLink fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsGraphForeignLink : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdGraphForeignLink liveGraphForeignLinkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveGraphForeignLinkSkipFuel rest
      if cmdBodyKnownGraphForeignLink kn c then
        parseCmdsGraphForeignLink n rest2 (kn ++ cmdAddsGraphForeignLink c) (acc ++ [c])
      else
        parseCmdsGraphForeignLink n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveGraphForeignLinkSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsGraphForeignLink n rest2 kn acc
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

/-- Parse live GraphForeignLink.lean text.
    Greppable: parseLiveGraphForeignLinkSource, PARSE-LIVE-GRAPH-FOREIGN-LINK. -/
def parseLiveGraphForeignLinkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsGfl src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGraphForeignLink liveGraphForeignLinkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.GraphForeignLink", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live GraphForeignLink parse.
    Greppable: kernelCheckLiveGraphForeignLinkSource, PARSE-LIVE-GRAPH-FOREIGN-LINK. -/
def kernelCheckLiveGraphForeignLinkSource (src : String) : Bool :=
  match parseLiveGraphForeignLinkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveGraphForeignLinkParsed? : Option Module :=
  match parseLiveGraphForeignLinkSource liveGraphForeignLinkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveGraphForeignLinkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveGraphForeignLinkParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.IrGraph. -/
def liveParseHasIrGraphImport : Bool :=
  match liveGraphForeignLinkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "IrGraph"
      | _ => false

/-- Live parse has the GraphForeignLink namespace command. -/
def liveParseHasGraphForeignLinkNs : Bool :=
  match liveGraphForeignLinkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "GraphForeignLink"
      | _ => false

/-- Live parse has core GraphForeignLink defs (def_ or defBind).
    graphForeignLinkReady may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveGraphForeignLinkParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsGfl liveGraphForeignLinkSource)
    has "stageId" && has "hostId" && has "foreignGraphTagSizeBytes"
      && (has "graphForeignLinkReady"
        || toksHaveDefNamed liveGraphForeignLinkSkipFuel toks "graphForeignLinkReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveGraphForeignLinkReady, PARSE-LIVE-GRAPH-FOREIGN-LINK,
    HOST-FRONT-LIVE-GRAPH-FOREIGN-LINK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveGraphForeignLinkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_GRAPH_FOREIGN_LINK_V0")
    && (hostId == "HOST-FRONT-LIVE-GRAPH-FOREIGN-LINK")
    && (parseId == "PARSE-LIVE-GRAPH-FOREIGN-LINK")
    && (liveGraphForeignLinkRel == "src/systems/SystemsLean/GraphForeignLink.lean")
    && (liveRel == "GraphForeignLink.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveGraphForeignLinkFullHost
    && !hostFrontLiveGraphForeignLinkResidualFreeClaimed
    && !hostFrontLiveGraphForeignLinkProvablyUnlocked
    && kernelCheckLiveGraphForeignLinkSource liveGraphForeignLinkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasIrGraphImport
    && liveParseHasGraphForeignLinkNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveGraphForeignLinkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveGraphForeignLink (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-GRAPH-FOREIGN-LINK =="
  IO.println s!"  host={hostId} file={liveGraphForeignLinkRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "GraphForeignLink.lean") do
    IO.eprintln "error: liveRel must be GraphForeignLink.lean"
    throw (IO.userError "liveRel must be GraphForeignLink.lean")
  let path := root / liveGraphForeignLinkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveGraphForeignLinkRel}"
    throw (IO.userError s!"missing {liveGraphForeignLinkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveGraphForeignLinkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk GraphForeignLink.lean != liveGraphForeignLinkSource"
    throw (IO.userError "dual-pin mismatch live GraphForeignLink.lean")
  let r := parseLiveGraphForeignLinkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-GRAPH-FOREIGN-LINK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-GRAPH-FOREIGN-LINK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-GRAPH-FOREIGN-LINK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live GraphForeignLink parse false"
      throw (IO.userError "kernelCheck live GraphForeignLink parse false")
    unless hostFrontLiveGraphForeignLinkReady do
      IO.eprintln "error: hostFrontLiveGraphForeignLinkReady false"
      throw (IO.userError "hostFrontLiveGraphForeignLinkReady false")
    IO.println s!"GREEN {stageId}: live GraphForeignLink.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveGraphForeignLink root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveGraphForeignLink
