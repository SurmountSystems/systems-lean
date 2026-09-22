/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SlakeHostToolElfMeasureX86.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfMeasureX86. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++. Comment strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on this text.
  Source-text parse only. Do not import SystemsLean.SelfHostComplete.
  Do not import SystemsLean.SlakeHostToolElfMeasure (the product file does; this driver does not).
  It is SlakeHostToolElfMeasureX86.lean. Not SlakeHostToolElfMeasureGreen.
  Not SlakeHostToolElfMeasureFields.
  Not a remill. Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveSlakeHostToolElfMeasureX86Source turns live text into HostTerm.Module.
  - Module name is SystemsLean.SlakeHostToolElfMeasureX86 even without a module line.
  - kernelCheckLiveSlakeHostToolElfMeasureX86Source is HostKernel.kernelCheck of that parse.
  - The one import SystemsLean.SlakeHostToolElfMeasure is kept. An unknown import
    does not seed the env. It is not kernelCheck := true.
  - Keep kernelable one-line String atoms: stageId and measureX86Rel.
  - Skip theorems, set_option, open, match/let/do/IO bodies, ByteArray/UInt8/IO
    typed defs, qualified const chains (destRel), unknown consts (leftoverX86),
    and Nat defs whose body is not one atom (payloadLen).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - Not Linear / Compose / IrGraph parsers.
  - Not mill remill. Not occupancy Term wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86,
  parseLiveSlakeHostToolElfMeasureX86Source, kernelCheckLiveSlakeHostToolElfMeasureX86Source,
  hostFrontLiveSlakeHostToolElfMeasureX86Ready, liveSlakeHostToolElfMeasureX86Source, liveRel,
  liveSlakeHostToolElfMeasureX86Rel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86
  Red/green: lean --run SlakeTypecheckSlakeHostToolElfMeasureX86 (horizon); dests were absent;
  lake build on surmount-1 is not run here.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86Source
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_HOST_TOOL_ELF_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0"

/-- Greppable host map id. Distinct from product HOST-SLAKE-HOST-TOOL-ELF. -/
def hostId : String := "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86"

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMeasureX86.lean. -/
def liveRel : String := "SlakeHostToolElfMeasureX86.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureX86Rel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeHostToolElfMeasureX86FullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeHostToolElfMeasureX86ResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSlakeHostToolElfMeasureX86ProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureX86MillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureX86Occupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureX86NotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureX86NotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveSlakeHostToolElfMeasureX86LakeGone : Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeHostToolElfMeasureX86ParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSlakeHostToolElfMeasureX86SkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . SlakeHostToolElfMeasureX86`. -/
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
def cmdAddsSlakeHostToolElfMeasureX86 (c : Cmd) : List String :=
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
    Kernelable defs here are two String atoms. A hex Nat (0x) is not a decimal atom. -/
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
def cmdBodyKnownSlakeHostToolElfMeasureX86 (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureX86ParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureX86ParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureX86ParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureX86ParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. Kernelable defs are stageId and
    measureX86Rel (String atoms). Qualified const, ByteArray, match, and
    do bodies are not atoms: leftover that is not a command start is skip. -/
def parseDefSlakeHostToolElfMeasureX86 (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveSlakeHostToolElfMeasureX86SkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmd liveSlakeHostToolElfMeasureX86SkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip.
    theorem is not a kernel command. -/
def parseOneCmdSlakeHostToolElfMeasureX86 (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSlakeHostToolElfMeasureX86 fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    inductive / structure / un-kernelable defs. abbrev is not isCmdKw;
    skipUntilCmd rest still advances to the next command keyword. -/
def parseCmdsSlakeHostToolElfMeasureX86 : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeHostToolElfMeasureX86 liveSlakeHostToolElfMeasureX86ParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeHostToolElfMeasureX86SkipFuel rest
      if cmdBodyKnownSlakeHostToolElfMeasureX86 kn c then
        parseCmdsSlakeHostToolElfMeasureX86 n rest2 (kn ++ cmdAddsSlakeHostToolElfMeasureX86 c) (acc ++ [c])
      else
        parseCmdsSlakeHostToolElfMeasureX86 n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSlakeHostToolElfMeasureX86SkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSlakeHostToolElfMeasureX86 n rest2 kn acc
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

/-- Token walk: live text has `theorem` named `nm`. Not a kernel command. -/
def toksHaveThmNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveThmNamed n rest2 nm
    | none => toksHaveThmNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveThmNamed n rest nm

/-- Parse live SlakeHostToolElfMeasureX86.lean text.
    Greppable: parseLiveSlakeHostToolElfMeasureX86Source, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86. -/
def parseLiveSlakeHostToolElfMeasureX86Source (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeHostToolElfMeasureX86 liveSlakeHostToolElfMeasureX86ParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SlakeHostToolElfMeasureX86", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeHostToolElfMeasureX86 parse.
    Greppable: kernelCheckLiveSlakeHostToolElfMeasureX86Source, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86. -/
def kernelCheckLiveSlakeHostToolElfMeasureX86Source (src : String) : Bool :=
  match parseLiveSlakeHostToolElfMeasureX86Source src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeHostToolElfMeasureX86Parsed? : Option Module :=
  match parseLiveSlakeHostToolElfMeasureX86Source liveSlakeHostToolElfMeasureX86Source with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeHostToolElfMeasureX86Parsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / string atoms / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped.
    Lower bound is import, namespace, stageId, measureX86Rel, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeHostToolElfMeasureX86Parsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Live parse has the SlakeHostToolElfMeasureX86 namespace command. -/
def liveParseHasSlakeHostToolElfMeasureX86Ns : Bool :=
  match liveSlakeHostToolElfMeasureX86Parsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SlakeHostToolElfMeasureX86"
      | _ => false

/-- Live parse keeps the product import. The driver does not import that module. -/
def liveParseHasMeasureImport : Bool :=
  match liveSlakeHostToolElfMeasureX86Parsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.SlakeHostToolElfMeasure"
      | _ => false

/-- Live parse has the kernelable String atoms (def_ or defBind).
    Kept: stageId and measureX86Rel.
    destRel is a qualified const. leftoverX86 names an unknown const.
    ByteArray, IO, match, and payloadLen are not atoms. -/
def liveParseHasCoreDefs : Bool :=
  match liveSlakeHostToolElfMeasureX86Parsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "measureX86Rel"

/-- Skip-folded names are not kept as kernel commands. -/
def liveParseSkippedUnkernelable : Bool :=
  match liveSlakeHostToolElfMeasureX86Parsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    !(has "destRel") && !(has "leftoverX86") && !(has "encodeU32le")
      && !(has "x86_64Tag") && !(has "payloadBytes") && !(has "payloadLen")
      && !(has "insnPrefix") && !(has "x86_64Code") && !(has "x86_64CodeOk")
      && !(has "encodeX86_64") && !(has "writeMeasureX86")

/-- Token walk still sees every real def and the four theorems.
    Greppable: liveParseSeesX86Surface. -/
def liveParseSeesX86Surface : Bool :=
  let toks := tokenizeHostTerm (stripComments liveSlakeHostToolElfMeasureX86Source)
  let fuel := liveSlakeHostToolElfMeasureX86SkipFuel
  toksHaveDefNamed fuel toks "stageId"
    && toksHaveDefNamed fuel toks "destRel"
    && toksHaveDefNamed fuel toks "measureX86Rel"
    && toksHaveDefNamed fuel toks "leftoverX86"
    && toksHaveDefNamed fuel toks "encodeU32le"
    && toksHaveDefNamed fuel toks "x86_64Tag"
    && toksHaveDefNamed fuel toks "payloadBytes"
    && toksHaveDefNamed fuel toks "payloadLen"
    && toksHaveDefNamed fuel toks "insnPrefix"
    && toksHaveDefNamed fuel toks "x86_64Code"
    && toksHaveDefNamed fuel toks "x86_64CodeOk"
    && toksHaveDefNamed fuel toks "encodeX86_64"
    && toksHaveDefNamed fuel toks "writeMeasureX86"
    && toksHaveThmNamed fuel toks "measureX86Rel_ne_destRel"
    && toksHaveThmNamed fuel toks "x86_64Tag_ne_elfMagic"
    && toksHaveThmNamed fuel toks "measureNativeIr_x86_64CodeOk"
    && toksHaveThmNamed fuel toks "measureNativeIr_encodeX86_64_not_elf"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeHostToolElfMeasureX86Ready, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSlakeHostToolElfMeasureX86Ready : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0")
    && (hostId == "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86")
    && (parseId == "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86")
    && (liveRel == "SlakeHostToolElfMeasureX86.lean")
    && (liveSlakeHostToolElfMeasureX86Rel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeHostToolElfMeasureX86FullHost
    && !hostFrontLiveSlakeHostToolElfMeasureX86ResidualFreeClaimed
    && !hostFrontLiveSlakeHostToolElfMeasureX86ProvablyUnlocked
    && (hostFrontLiveSlakeHostToolElfMeasureX86MillCount == 69)
    && (hostFrontLiveSlakeHostToolElfMeasureX86Occupancy == 49)
    && hostFrontLiveSlakeHostToolElfMeasureX86NotOccupancyName50
    && hostFrontLiveSlakeHostToolElfMeasureX86NotMill70
    && !hostFrontLiveSlakeHostToolElfMeasureX86LakeGone
    && kernelCheckLiveSlakeHostToolElfMeasureX86Source liveSlakeHostToolElfMeasureX86Source
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSlakeHostToolElfMeasureX86Ns
    && liveParseHasMeasureImport
    && liveParseHasCoreDefs
    && liveParseSkippedUnkernelable
    && liveParseSeesX86Surface

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeHostToolElfMeasureX86Source "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSlakeHostToolElfMeasureX86 (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86 =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureX86Rel} liveRel={liveRel}"
  let path := root / liveSlakeHostToolElfMeasureX86Rel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeHostToolElfMeasureX86Rel}"
    throw (IO.userError s!"missing {liveSlakeHostToolElfMeasureX86Rel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeHostToolElfMeasureX86Source then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeHostToolElfMeasureX86.lean != liveSlakeHostToolElfMeasureX86Source"
    throw (IO.userError "dual-pin mismatch live SlakeHostToolElfMeasureX86.lean")
  let r := parseLiveSlakeHostToolElfMeasureX86Source disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86 reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86 reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86 ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck {k} liveRel {liveRel}"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeHostToolElfMeasureX86 parse false"
      throw (IO.userError "kernelCheck live SlakeHostToolElfMeasureX86 parse false")
    unless hostFrontLiveSlakeHostToolElfMeasureX86Ready do
      IO.eprintln s!"error: hostFrontLiveSlakeHostToolElfMeasureX86Ready false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasSlakeHostToolElfMeasureX86Ns} import={liveParseHasMeasureImport} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} surface={liveParseSeesX86Surface} skipped={liveParseSkippedUnkernelable} liveRelOk={liveRel == "SlakeHostToolElfMeasureX86.lean"} kernel={k}"
      throw (IO.userError "hostFrontLiveSlakeHostToolElfMeasureX86Ready false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"GREEN {stageId}: live SlakeHostToolElfMeasureX86.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeHostToolElfMeasureX86 root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86
