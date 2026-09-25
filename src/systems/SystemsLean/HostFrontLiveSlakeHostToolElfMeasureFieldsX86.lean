/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is SlakeHostToolElfMeasureFieldsX86.lean.
  It is not SlakeHostToolElfMeasure.lean.
  It is not SlakeHostToolElfMeasureFields.lean.
  It is not SlakeHostToolElfMeasureX86.lean.
  Literal defs stay. List, match, app, and proj bodies are skipped.
  theorem count is 2. example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86,
  HOST-HOST-TOOL-MEASURE-FIELDS-X86, liveRel,
  kernelCheckLiveSlakeHostToolElfMeasureFieldsX86Source,
  hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86Source
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86"

/-- Live file basename. -/
def liveRel : String := "SlakeHostToolElfMeasureFieldsX86.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureFieldsX86Rel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsX86FullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsX86FullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsX86ResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsX86ProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeHostToolElfMeasureFieldsX86ParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSlakeHostToolElfMeasureFieldsX86SkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, two literal string defs, and end.
    List, match, app, and proj bodies are skip-folded.
    From SlakeHostToolElfMeasureFieldsX86.lean.
    A count of 4 would drop a literal def. -/
def liveSlakeHostToolElfMeasureFieldsX86KeptCmds : Nat := 5

/-- theorem keyword count. Two theorems in the live file. -/
def liveSlakeHostToolElfMeasureFieldsX86TheoremCount : Nat := 2

/-- example keyword count. The live file has no example. -/
def liveSlakeHostToolElfMeasureFieldsX86ExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option. -/
def liveSlakeHostToolElfMeasureFieldsX86SetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . SlakeHostToolElfMeasureFieldsX86`. -/
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
def cmdAddsSlakeHostToolElfMeasureFieldsX86 (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
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

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownSlakeHostToolElfMeasureFieldsX86 (kn : List String) :
    Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureFieldsX86ParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureFieldsX86ParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureFieldsX86ParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureFieldsX86ParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdSlakeHostToolElfMeasureFieldsX86 (fuel : Nat)
    (toks : List String) : Option (Prod Cmd (List String)) :=
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

/-- Fold commands. Skip open, list bodies, match, and un-kernelable defs. -/
def parseCmdsSlakeHostToolElfMeasureFieldsX86 : Nat -> List String ->
    List String -> List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeHostToolElfMeasureFieldsX86
        liveSlakeHostToolElfMeasureFieldsX86ParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeHostToolElfMeasureFieldsX86SkipFuel rest
      if cmdBodyKnownSlakeHostToolElfMeasureFieldsX86 kn c then
        parseCmdsSlakeHostToolElfMeasureFieldsX86 n rest2
          (kn ++ cmdAddsSlakeHostToolElfMeasureFieldsX86 c) (acc ++ [c])
      else
        parseCmdsSlakeHostToolElfMeasureFieldsX86 n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 :=
            skipUntilCmd liveSlakeHostToolElfMeasureFieldsX86SkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSlakeHostToolElfMeasureFieldsX86 n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live SlakeHostToolElfMeasureFieldsX86.lean text.
    Greppable: parseLiveSlakeHostToolElfMeasureFieldsX86Source,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86. -/
def parseLiveSlakeHostToolElfMeasureFieldsX86Source (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeHostToolElfMeasureFieldsX86
        liveSlakeHostToolElfMeasureFieldsX86ParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name :=
              HostTerm.n "SystemsLean.SlakeHostToolElfMeasureFieldsX86"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeHostToolElfMeasureFieldsX86 parse. Not a fixture.
    Greppable: kernelCheckLiveSlakeHostToolElfMeasureFieldsX86Source,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86. -/
def kernelCheckLiveSlakeHostToolElfMeasureFieldsX86Source (src : String) :
    Bool :=
  match parseLiveSlakeHostToolElfMeasureFieldsX86Source src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeHostToolElfMeasureFieldsX86Parsed? : Option Module :=
  match parseLiveSlakeHostToolElfMeasureFieldsX86Source
      liveSlakeHostToolElfMeasureFieldsX86Source with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | some m =>
    m.commands.length == liveSlakeHostToolElfMeasureFieldsX86KeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "measureFieldsX86Rel"

/-- Wrap module lastSeg is SlakeHostToolElfMeasureFieldsX86. -/
def liveParseHasSlakeHostToolElfMeasureFieldsX86Module : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.SlakeHostToolElfMeasureFieldsX86"
      && lastSeg m.name.raw == "SlakeHostToolElfMeasureFieldsX86"

/-- Live parse has namespace SystemsLean.SlakeHostToolElfMeasureFieldsX86. -/
def liveParseHasFieldsX86Ns : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x =>
        x.raw == "SystemsLean.SlakeHostToolElfMeasureFieldsX86"
      | _ => false

/-- Live parse ends namespace SystemsLean.SlakeHostToolElfMeasureFieldsX86. -/
def liveParseHasFieldsX86End : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x =>
        x.raw == "SystemsLean.SlakeHostToolElfMeasureFieldsX86"
      | _ => false

/-- Live parse imports the one live module. -/
def liveParseHasFieldsX86Import : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x =>
        x.raw == "SystemsLean.SlakeHostToolElfMeasureX86"
      | _ => false

/-- Keyword counts: theorem is 2. example and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveSlakeHostToolElfMeasureFieldsX86Parsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveSlakeHostToolElfMeasureFieldsX86Source)
    let fuel := liveSlakeHostToolElfMeasureFieldsX86SkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveSlakeHostToolElfMeasureFieldsX86TheoremCount
      && toksCountKw fuel toks "example" 0
        == liveSlakeHostToolElfMeasureFieldsX86ExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveSlakeHostToolElfMeasureFieldsX86SetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportMeasureX86 : String :=
  "import SystemsLean.SlakeHostToolElfMeasureX86\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String :=
  "namespace SystemsLean.SlakeHostToolElfMeasureFieldsX86\n"

/-- Stage id def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_HOST_TOOL_ELF_V0\"\n"

/-- Dest rel def needle with a trailing newline. -/
def needleDestRel : String :=
  "def destRel : String := SystemsLean.SlakeHostToolElfMeasure.destRel\n"

/-- Measure fields x86 rel def needle with a trailing newline. -/
def needleMeasureFieldsX86Rel : String :=
  "def measureFieldsX86Rel : String :=\n"

/-- Leftover string def needle with a trailing newline. -/
def needleLeftover : String :=
  "def leftoverAfterFieldsX86 : String :=\n"

/-- Remaining-line def needle with a trailing newline. -/
def needleIsRemainingLine : String :=
  "def isRemainingLine (line : String) : Bool :=\n"

/-- Encode print line def needle with a trailing newline. -/
def needleEncodePrintLine : String :=
  "def encodePrintLine (line : String) : ByteArray :=\n"

/-- Write def needle with a trailing newline. -/
def needleWrite : String :=
  "def writeMeasureFieldsX86 (root : System.FilePath) : IO Unit := do\n"

/-- End needle with a trailing newline. -/
def needleEnd : String :=
  "end SystemsLean.SlakeHostToolElfMeasureFieldsX86\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveSlakeHostToolElfMeasureFieldsX86Source
  (src.splitOn needleImportMeasureX86).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleDestRel).length > 1
    && (src.splitOn needleMeasureFieldsX86Rel).length > 1
    && (src.splitOn needleLeftover).length > 1
    && (src.splitOn needleIsRemainingLine).length > 1
    && (src.splitOn needleEncodePrintLine).length > 1
    && (src.splitOn needleWrite).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86")
    && (parseId ==
      "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86")
    && (liveRel == "SlakeHostToolElfMeasureFieldsX86.lean")
    && (liveSlakeHostToolElfMeasureFieldsX86Rel ==
      "src/systems/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsX86FullHost
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsX86FullBackend
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsX86ResidualFreeClaimed
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsX86ProvablyUnlocked
    && kernelCheckLiveSlakeHostToolElfMeasureFieldsX86Source
      liveSlakeHostToolElfMeasureFieldsX86Source
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasSlakeHostToolElfMeasureFieldsX86Module
    && liveParseHasFieldsX86Ns
    && liveParseHasFieldsX86End
    && liveParseHasFieldsX86Import
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeHostToolElfMeasureFieldsX86Source "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveSlakeHostToolElfMeasureFieldsX86 (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86 =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureFieldsX86Rel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveSlakeHostToolElfMeasureFieldsX86Rel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeHostToolElfMeasureFieldsX86Rel}"
    throw (IO.userError s!"missing {liveSlakeHostToolElfMeasureFieldsX86Rel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeHostToolElfMeasureFieldsX86Source then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeHostToolElfMeasureFieldsX86.lean != liveSlakeHostToolElfMeasureFieldsX86Source"
    throw (IO.userError "dual-pin mismatch live SlakeHostToolElfMeasureFieldsX86.lean")
  let r := parseLiveSlakeHostToolElfMeasureFieldsX86Source disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86 reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86 reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86 ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeHostToolElfMeasureFieldsX86 parse false"
      throw (IO.userError "kernelCheck live SlakeHostToolElfMeasureFieldsX86 parse false")
    unless hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready do
      IO.eprintln "error: hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready false"
      throw (IO.userError "hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty SlakeHostToolElfMeasureFieldsX86 source was accepted"
      throw (IO.userError "empty SlakeHostToolElfMeasureFieldsX86 source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeHostToolElfMeasureFieldsX86 root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86
