/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SlakeHostToolElfMainCatchDest.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfMainCatchDest. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++. Comment strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on SlakeHostToolElfMainCatchDest text.
  This file imports SystemsLean.SlakeHostToolElfMainCatchX86. It is not the x86 sidecar.
  It is SlakeHostToolElfMainCatchDest.lean. Do not claim it imports SlakeHostToolElfLink.
  Unknown import is a kernel pass-through (not a Mult / Types / Erasure seed).
  Not a remill. Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not mill remill of mill 69. Not occupancy Term. Not the SlakeHostToolElfMainCatch IR wrap.

  Spec (readable):
  - parseLiveSlakeHostToolElfMainCatchDestSource turns live SlakeHostToolElfMainCatchDest.lean text into HostTerm.Module.
  - Module name is SystemsLean.SlakeHostToolElfMainCatchDest even without a module line.
  - kernelCheckLiveSlakeHostToolElfMainCatchDestSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; SlakeHostToolElfMainCatchX86 is not a seeded import).
  - isWellFormed does not require the import to resolve. The live import is kept.
  - Skip the open line, theorems, examples, set_option, abbrev, inductive, structure,
    un-kernelable match/let/app/do/IO bodies, ByteArray/UInt32/UInt8/IO/Int typed
    defs, qualified foreign consts, and ++ string concat. Keep kernelable
    String and Bool atoms, the SlakeHostToolElfMainCatchX86 import, namespace, and end.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - FullBackend stays false. slakeOwnsPackageTypecheck stays false.
  - Not Linear / Compose / IrGraph parsers. Not SlakeHostToolElfLink wrap.
  - Not mill remill. Not occupancy Term wrap. Not SlakeHostToolElfMeasureGreen.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_DEST_V0, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST,
  parseLiveSlakeHostToolElfMainCatchDestSource, kernelCheckLiveSlakeHostToolElfMainCatchDestSource,
  hostFrontLiveSlakeHostToolElfMainCatchDestReady, liveSlakeHostToolElfMainCatchDestSource, liveRel,
  liveSlakeHostToolElfMainCatchDestRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest
  Red/green: lean --run SlakeTypecheckSlakeHostToolElfMainCatchDest (horizon); dests skipped;
  lake build SystemsLean.SlakeTypecheckSlakeHostToolElfMainCatchDest on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDestSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_HOST_TOOL_ELF_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_DEST_V0"

/-- Greppable host map id. Distinct from product HOST-HOST-TOOL-MAIN-CATCH-DEST. -/
def hostId : String := "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST"

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMainCatchDest.lean. -/
def liveRel : String := "SlakeHostToolElfMainCatchDest.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMainCatchDestRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestOwnsPackageTypecheck : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestFullBackend : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestLakeGone : Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeHostToolElfMainCatchDestParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSlakeHostToolElfMainCatchDestSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . SlakeHostToolElfMainCatchDest`. -/
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
def cmdAddsSlakeHostToolElfMainCatchDest (c : Cmd) : List String :=
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

/-- UInt32 / UInt8 / ByteArray / IO / Int types poison kernelCheck of the skip-fold.
    Int is HostType.named, and litNat infers HostType.nat.
    A hex Nat (0x) is not a decimal atom. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
        || lastSeg x.raw == "Int" || lastSeg x.raw == "UInt8"
        || lastSeg x.raw == "ByteArray"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/UInt8/ByteArray/IO/Int typed defs. -/
def cmdBodyKnownSlakeHostToolElfMainCatchDest (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMainCatchDestParseFuel body
        && termNoAppN liveSlakeHostToolElfMainCatchDestParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMainCatchDestParseFuel body
        && termNoAppN liveSlakeHostToolElfMainCatchDestParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. SlakeHostToolElfMainCatchDest kernelable
    defs are atoms (string / bool). Qualified foreign const and ++ leftovers
    are skip, not a truncated keep. ByteArray bodies and let/app bodies fail closed. -/
def parseDefSlakeHostToolElfMainCatchDest (fuel : Nat) (dname : String) (rest : List String) :
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
              | t :: _ =>
                if !isCmdKw t then none
                else
                  let rest5 := skipNonCmd liveSlakeHostToolElfMainCatchDestSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmd liveSlakeHostToolElfMainCatchDestSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdSlakeHostToolElfMainCatchDest (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSlakeHostToolElfMainCatchDest fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    inductive / structure / un-kernelable defs. abbrev is not isCmdKw;
    skipUntilCmd rest still advances to the next command keyword. -/
def parseCmdsSlakeHostToolElfMainCatchDest : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeHostToolElfMainCatchDest liveSlakeHostToolElfMainCatchDestParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeHostToolElfMainCatchDestSkipFuel rest
      if cmdBodyKnownSlakeHostToolElfMainCatchDest kn c then
        parseCmdsSlakeHostToolElfMainCatchDest n rest2 (kn ++ cmdAddsSlakeHostToolElfMainCatchDest c) (acc ++ [c])
      else
        parseCmdsSlakeHostToolElfMainCatchDest n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSlakeHostToolElfMainCatchDestSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSlakeHostToolElfMainCatchDest n rest2 kn acc
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

/-- Parse live SlakeHostToolElfMainCatchDest.lean text.
    Greppable: parseLiveSlakeHostToolElfMainCatchDestSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST. -/
def parseLiveSlakeHostToolElfMainCatchDestSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeHostToolElfMainCatchDest liveSlakeHostToolElfMainCatchDestParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SlakeHostToolElfMainCatchDest", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeHostToolElfMainCatchDest parse.
    Greppable: kernelCheckLiveSlakeHostToolElfMainCatchDestSource,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST.
    HostKernel.kernelCheck, not a literal true. -/
def kernelCheckLiveSlakeHostToolElfMainCatchDestSource (src : String) : Bool :=
  match parseLiveSlakeHostToolElfMainCatchDestSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeHostToolElfMainCatchDestParsed? : Option Module :=
  match parseLiveSlakeHostToolElfMainCatchDestSource liveSlakeHostToolElfMainCatchDestSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeHostToolElfMainCatchDestParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / atoms / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped.
    Lower bound is the SlakeHostToolElfMainCatchX86 import, namespace,
    six atoms, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeHostToolElfMainCatchDestParsed? with
  | some m => m.commands.length >= 9
  | none => false

/-- Live parse has the SlakeHostToolElfMainCatchDest namespace command. -/
def liveParseHasSlakeHostToolElfMainCatchDestNs : Bool :=
  match liveSlakeHostToolElfMainCatchDestParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SlakeHostToolElfMainCatchDest"
      | _ => false

/-- Live parse keeps import SystemsLean.SlakeHostToolElfMainCatchX86. Not a kernel seed. -/
def liveParseHasSlakeHostToolElfMainCatchX86Import : Bool :=
  match liveSlakeHostToolElfMainCatchDestParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "SlakeHostToolElfMainCatchX86"
      | _ => false

/-- Live parse has core atoms (def_ or defBind).
    ByteArray defs, let/app Ok predicates, ++ strings, open, and theorems
    skip-fold. Kept atoms passed to HostKernel.kernelCheck:
    stageId, destCatchStage, destRel, catchX86Rel, writesDest, sidecarStaysX64I.
    Skipped names: the open line, sidecarTag, abortSyscall, cmpArgcOne,
    encodeJeRel8, destCatchEprint, destCatchReturn1, extraArgvCatch,
    destCatchEprintOk, extraArgvCatchOk, leftoverAfterDestCatch,
    set_option, and the theorems. -/
def liveParseHasCoreDefs : Bool :=
  match liveSlakeHostToolElfMainCatchDestParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "destCatchStage" && has "destRel" && has "catchX86Rel"
      && has "writesDest" && has "sidecarStaysX64I"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeHostToolElfMainCatchDestReady,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST.
    Real conjunction: parse plus HostKernel.kernelCheck. Not a literal true. -/
def hostFrontLiveSlakeHostToolElfMainCatchDestReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_DEST_V0")
    && (hostId == "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST")
    && (parseId == "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST")
    && (liveRel == "SlakeHostToolElfMainCatchDest.lean")
    && (liveSlakeHostToolElfMainCatchDestRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeHostToolElfMainCatchDestFullHost
    && !hostFrontLiveSlakeHostToolElfMainCatchDestResidualFreeClaimed
    && !hostFrontLiveSlakeHostToolElfMainCatchDestProvablyUnlocked
    && !hostFrontLiveSlakeHostToolElfMainCatchDestOwnsPackageTypecheck
    && !hostFrontLiveSlakeHostToolElfMainCatchDestFullBackend
    && (hostFrontLiveSlakeHostToolElfMainCatchDestMillCount == 69)
    && (hostFrontLiveSlakeHostToolElfMainCatchDestOccupancy == 49)
    && hostFrontLiveSlakeHostToolElfMainCatchDestNotOccupancyName50
    && hostFrontLiveSlakeHostToolElfMainCatchDestNotMill70
    && !hostFrontLiveSlakeHostToolElfMainCatchDestLakeGone
    && kernelCheckLiveSlakeHostToolElfMainCatchDestSource liveSlakeHostToolElfMainCatchDestSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSlakeHostToolElfMainCatchDestNs
    && liveParseHasSlakeHostToolElfMainCatchX86Import
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeHostToolElfMainCatchDestSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSlakeHostToolElfMainCatchDest (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMainCatchDestRel} liveRel={liveRel}"
  let path := root / liveSlakeHostToolElfMainCatchDestRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeHostToolElfMainCatchDestRel}"
    throw (IO.userError s!"missing {liveSlakeHostToolElfMainCatchDestRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeHostToolElfMainCatchDestSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeHostToolElfMainCatchDest.lean != liveSlakeHostToolElfMainCatchDestSource"
    throw (IO.userError "dual-pin mismatch live SlakeHostToolElfMainCatchDest.lean")
  let r := parseLiveSlakeHostToolElfMainCatchDestSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    IO.println "  checked stageId destCatchStage destRel catchX86Rel writesDest sidecarStaysX64I"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeHostToolElfMainCatchDest parse false"
      throw (IO.userError "kernelCheck live SlakeHostToolElfMainCatchDest parse false")
    unless hostFrontLiveSlakeHostToolElfMainCatchDestReady do
      IO.eprintln s!"error: hostFrontLiveSlakeHostToolElfMainCatchDestReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasSlakeHostToolElfMainCatchDestNs} import={liveParseHasSlakeHostToolElfMainCatchX86Import} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} liveRelOk={liveRel == "SlakeHostToolElfMainCatchDest.lean"} kernel={k}"
      throw (IO.userError "hostFrontLiveSlakeHostToolElfMainCatchDestReady false")
    IO.println s!"GREEN {stageId}: live SlakeHostToolElfMainCatchDest.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeHostToolElfMainCatchDest root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest
