/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostKernel.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostKernel. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on HostKernel text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not HostKernelTerm.

  Spec (readable):
  - parseLiveHostKernelSource turns live HostKernel.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostKernel even without a module line.
  - kernelCheckLiveHostKernelSource is HostKernel.kernelCheck of that parse.
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app
    bodies, and abbrev leftovers (not isCmdKw). Keep kernelable string/Nat/Bool
    defs, imports, namespace, end.
  - toksHaveDefNamed still sees hostKernelReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not HostKernelTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOSTKERNEL,
  SLAKE_HOST_FRONT_LIVE_HOSTKERNEL_V0,
  PARSE-LIVE-HOSTKERNEL, parseLiveHostKernelSource, kernelCheckLiveHostKernelSource,
  hostFrontLiveHostKernelReady, liveHostKernelSource, liveHostKernelRel,
  liveRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostKernel
  Red/green: just slake-typecheck-hostkernel; just systems-host dest rows;
  lake build SystemsLean.HostFrontLiveHostKernel on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostKernelSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostKernel

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOSTKERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTKERNEL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTKERNEL"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostKernelRel : String := "src/systems/SystemsLean/HostKernel.lean"

/-- Live basename. Greppable: liveRel. Must be HostKernel.lean. -/
def liveRel : String := "HostKernel.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostKernelFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostKernelResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostKernelProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostKernelParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveHostKernelSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . HostKernel`. -/
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
def cmdAddsHostKernel (c : Cmd) : List String :=
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

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownHostKernel (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostKernelParseFuel body
        && termNoAppN liveHostKernelParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostKernelParseFuel body
        && termNoAppN liveHostKernelParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdHostKernel (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsHostKernel : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostKernel liveHostKernelParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostKernelSkipFuel rest
      if cmdBodyKnownHostKernel kn c then
        parseCmdsHostKernel n rest2 (kn ++ cmdAddsHostKernel c) (acc ++ [c])
      else
        parseCmdsHostKernel n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostKernelSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostKernel n rest2 kn acc
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

/-- Parse live HostKernel.lean text.
    Greppable: parseLiveHostKernelSource, PARSE-LIVE-HOSTKERNEL. -/
def parseLiveHostKernelSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostKernel liveHostKernelParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostKernel", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostKernel parse.
    Greppable: kernelCheckLiveHostKernelSource, PARSE-LIVE-HOSTKERNEL. -/
def kernelCheckLiveHostKernelSource (src : String) : Bool :=
  match parseLiveHostKernelSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostKernelParsed? : Option Module :=
  match parseLiveHostKernelSource liveHostKernelSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostKernelParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveHostKernelParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Live parse imports SystemsLean.HostTerm. -/
def liveParseHasHostTermImport : Bool :=
  match liveHostKernelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostTerm"
      | _ => false

/-- Live parse has the HostKernel namespace command. -/
def liveParseHasHostKernelNs : Bool :=
  match liveHostKernelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostKernel"
      | _ => false

/-- Live parse has core HostKernel defs (def_ or defBind). hostKernelReady
    may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostKernelParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveHostKernelSource)
    has "stageId" && has "hostId"
      && (has "hostKernelReady"
        || toksHaveDefNamed liveHostKernelSkipFuel toks "hostKernelReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostKernelReady, PARSE-LIVE-HOSTKERNEL,
    HOST-FRONT-LIVE-HOSTKERNEL.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostKernelReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOSTKERNEL_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTKERNEL")
    && (parseId == "PARSE-LIVE-HOSTKERNEL")
    && (liveHostKernelRel == "src/systems/SystemsLean/HostKernel.lean")
    && (liveRel == "HostKernel.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostKernelFullHost
    && !hostFrontLiveHostKernelResidualFreeClaimed
    && !hostFrontLiveHostKernelProvablyUnlocked
    && kernelCheckLiveHostKernelSource liveHostKernelSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostTermImport
    && liveParseHasHostKernelNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostKernelSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostKernel (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTKERNEL =="
  IO.println s!"  host={hostId} file={liveHostKernelRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostKernel.lean") do
    IO.eprintln "error: liveRel must be HostKernel.lean"
    throw (IO.userError "liveRel must be HostKernel.lean")
  let path := root / liveHostKernelRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostKernelRel}"
    throw (IO.userError s!"missing {liveHostKernelRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostKernelSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostKernel.lean != liveHostKernelSource"
    throw (IO.userError "dual-pin mismatch live HostKernel.lean")
  let r := parseLiveHostKernelSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTKERNEL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTKERNEL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTKERNEL ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostKernel parse false"
      throw (IO.userError "kernelCheck live HostKernel parse false")
    unless hostFrontLiveHostKernelReady do
      IO.eprintln "error: hostFrontLiveHostKernelReady false"
      throw (IO.userError "hostFrontLiveHostKernelReady false")
    IO.println s!"GREEN {stageId}: live HostKernel.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostKernel root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostKernel
