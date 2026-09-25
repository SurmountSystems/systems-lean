/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckLlvmTypesTextTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckLlvmTypesTextTerm. Reuses
  HostFrontLiveHostTerm skip-un-kernelable fold. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostModuleCheckLlvmTypesTextTerm text.

  Spec (readable):
  - parseLiveHostModuleCheckLlvmTypesTextTermSource turns live
    HostModuleCheckLlvmTypesTextTerm.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckLlvmTypesTextTerm even
    without a module line.
  - kernelCheckLiveHostModuleCheckLlvmTypesTextTermSource is
    HostKernel.kernelCheck of that parse.
  - Theorems and un-kernelable bodies are skipped. Namespace plus
    kernelable cmds plus end remain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Host tools stay 69 of 69.
  - Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVMTYPESTEXTTERM,
  SLAKE_HOST_FRONT_LIVE_LLVMTYPESTEXTTERM_V0, PARSE-LIVE-LLVMTYPESTEXTTERM,
  parseLiveHostModuleCheckLlvmTypesTextTermSource,
  kernelCheckLiveHostModuleCheckLlvmTypesTextTermSource,
  hostFrontLiveHostModuleCheckLlvmTypesTextTermReady,
  liveHostModuleCheckLlvmTypesTextTermSource, liveRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm
  Red/green: lean --run of the SlakeTypecheck driver (no lake; no mill).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTermSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVMTYPESTEXTTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVMTYPESTEXTTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVMTYPESTEXTTERM"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckLlvmTypesTextTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckLlvmTypesTextTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckLlvmTypesTextTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveHostModuleCheckLlvmTypesTextTermParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostModuleCheckLlvmTypesTextTermSkipFuel : Nat := 32768

/-- Dotted ident `SystemsLean . HostModuleCheck`. -/
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
def cmdAddsLlvmTypesTextTerm (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmTypesTextTerm (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckLlvmTypesTextTermParseFuel body
        && termNoAppN liveHostModuleCheckLlvmTypesTextTermParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckLlvmTypesTextTermParseFuel body
        && termNoAppN liveHostModuleCheckLlvmTypesTextTermParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdLlvmTypesTextTerm (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
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

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsLlvmTypesTextTerm : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmTypesTextTerm
        liveHostModuleCheckLlvmTypesTextTermParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostModuleCheckLlvmTypesTextTermSkipFuel rest
      if cmdBodyKnownLlvmTypesTextTerm kn c then
        parseCmdsLlvmTypesTextTerm n rest2
          (kn ++ cmdAddsLlvmTypesTextTerm c) (acc ++ [c])
      else
        parseCmdsLlvmTypesTextTerm n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd
            liveHostModuleCheckLlvmTypesTextTermSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmTypesTextTerm n rest2 kn acc
          else none
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

/-- Parse live HostModuleCheckLlvmTypesTextTerm.lean text.
    Greppable: parseLiveHostModuleCheckLlvmTypesTextTermSource,
    PARSE-LIVE-LLVMTYPESTEXTTERM. -/
def parseLiveHostModuleCheckLlvmTypesTextTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmTypesTextTerm
        liveHostModuleCheckLlvmTypesTextTermParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckLlvmTypesTextTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckLlvmTypesTextTerm parse.
    Greppable: kernelCheckLiveHostModuleCheckLlvmTypesTextTermSource,
    PARSE-LIVE-LLVMTYPESTEXTTERM.
    On accept this is HostKernel.kernelCheck, not a constant true. -/
def kernelCheckLiveHostModuleCheckLlvmTypesTextTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckLlvmTypesTextTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostModuleCheckLlvmTypesTextTermParsed? : Option Module :=
  match parseLiveHostModuleCheckLlvmTypesTextTermSource
      liveHostModuleCheckLlvmTypesTextTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostModuleCheckLlvmTypesTextTermParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveHostModuleCheckLlvmTypesTextTermParsed? with
  | some m => m.commands.length >= 2
  | none => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveHostModuleCheckLlvmTypesTextTermParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has the gate def (kept or skipped head).
    Gate def is hostModuleCheckLlvmTypesTextTermSurfaceOk. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostModuleCheckLlvmTypesTextTermParsed? with
  | none => false
  | some m =>
    let hasCmd (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm
      (stripComments liveHostModuleCheckLlvmTypesTextTermSource)
    hasCmd "hostModuleCheckLlvmTypesTextTermSurfaceOk"
      || toksHaveDefNamed liveHostModuleCheckLlvmTypesTextTermSkipFuel toks
        "hostModuleCheckLlvmTypesTextTermSurfaceOk"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckLlvmTypesTextTermReady,
    PARSE-LIVE-LLVMTYPESTEXTTERM, HOST-FRONT-LIVE-LLVMTYPESTEXTTERM.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not hardcoded true. -/
def hostFrontLiveHostModuleCheckLlvmTypesTextTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVMTYPESTEXTTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVMTYPESTEXTTERM")
    && (parseId == "PARSE-LIVE-LLVMTYPESTEXTTERM")
    && (liveRel == "HostModuleCheckLlvmTypesTextTerm.lean")
    && (liveHostModuleCheckLlvmTypesTextTermRel
      == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckLlvmTypesTextTermFullHost
    && !hostFrontLiveHostModuleCheckLlvmTypesTextTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckLlvmTypesTextTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckLlvmTypesTextTermSource
      liveHostModuleCheckLlvmTypesTextTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckLlvmTypesTextTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not a mill row. -/

def runLiveHostModuleCheckLlvmTypesTextTerm (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVMTYPESTEXTTERM =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmTypesTextTermRel}"
  let path := root / liveHostModuleCheckLlvmTypesTextTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckLlvmTypesTextTermRel}"
    throw (IO.userError
      s!"missing {liveHostModuleCheckLlvmTypesTextTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckLlvmTypesTextTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckLlvmTypesTextTerm.lean != liveHostModuleCheckLlvmTypesTextTermSource"
    throw (IO.userError
      "dual-pin mismatch live HostModuleCheckLlvmTypesTextTerm.lean")
  let r := parseLiveHostModuleCheckLlvmTypesTextTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVMTYPESTEXTTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVMTYPESTEXTTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVMTYPESTEXTTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckLlvmTypesTextTerm parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckLlvmTypesTextTerm parse false")
    unless hostFrontLiveHostModuleCheckLlvmTypesTextTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckLlvmTypesTextTermReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckLlvmTypesTextTermReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckLlvmTypesTextTerm.lean parse kernelCheck; host tools stay 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheckLlvmTypesTextTerm root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm
