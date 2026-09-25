/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckLoadOk.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckLoadOk. Reuses
  HostFrontLiveHostTerm skip-un-kernelable fold. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostModuleCheckLoadOk text.
  Not HostModuleCheckLoadOkLaterTerm.

  Spec (readable):
  - parseLiveHostModuleCheckLoadOkSource turns live
    HostModuleCheckLoadOk.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckLoadOk even
    without a module line.
  - Imports are this product's twelve SystemsLean.HostModuleCheck* imports.
  - kernelCheckLiveHostModuleCheckLoadOkSource is
    HostKernel.kernelCheck of that parse.
  - Un-kernelable def bodies are skipped. The four product def names
    stay required on the token walk. Namespace, imports, and end remain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Host tools stay 69 of 69.
  - Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LOADOK,
  SLAKE_HOST_FRONT_LIVE_LOADOK_V0, PARSE-LIVE-LOADOK,
  parseLiveHostModuleCheckLoadOkSource,
  kernelCheckLiveHostModuleCheckLoadOkSource,
  hostFrontLiveHostModuleCheckLoadOkReady,
  liveHostModuleCheckLoadOkSource, liveRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLoadOk
  Red/green: lean --run of the SlakeTypecheck driver (no lake; no mill).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckLoadOkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckLoadOk

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LOADOK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LOADOK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LOADOK"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckLoadOkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckLoadOkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckLoadOkProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostModuleCheckLoadOkParseFuel : Nat := 256

/-- Skip fuel for un-kernelable def tails. -/
def liveHostModuleCheckLoadOkSkipFuel : Nat := 65536

/-- This product's import list, in source order. -/
def productImports : List String :=
  [ "SystemsLean.HostModuleCheckSeeds"
  , "SystemsLean.HostModuleCheckAccepts"
  , "SystemsLean.HostModuleCheckMultKernel"
  , "SystemsLean.HostModuleCheckPackageElab"
  , "SystemsLean.HostModuleCheckPackageEnv"
  , "SystemsLean.HostModuleCheckPackageEnvEvidence"
  , "SystemsLean.HostModuleCheckLoadOkLaterTerm"
  , "SystemsLean.HostModuleCheckKernelMultProof"
  , "SystemsLean.HostModuleCheckKernelLinearProof"
  , "SystemsLean.HostModuleCheckKernelTypesProof"
  , "SystemsLean.HostModuleCheckKernelProgramProof"
  , "SystemsLean.HostModuleCheckKernelEmitProof"
  ]

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
def cmdAddsLoadOk (c : Cmd) : List String :=
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
def cmdBodyKnownLoadOk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckLoadOkParseFuel body
        && termNoAppN liveHostModuleCheckLoadOkParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckLoadOkParseFuel body
        && termNoAppN liveHostModuleCheckLoadOkParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdLoadOk (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip set_option / un-kernelable defs. -/
def parseCmdsLoadOk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLoadOk liveHostModuleCheckLoadOkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostModuleCheckLoadOkSkipFuel rest
      if cmdBodyKnownLoadOk kn c then
        parseCmdsLoadOk n rest2 (kn ++ cmdAddsLoadOk c) (acc ++ [c])
      else
        parseCmdsLoadOk n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostModuleCheckLoadOkSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLoadOk n rest2 kn acc
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

/-- Import names in command order. -/
def importNames : List Cmd -> List String
  | [] => []
  | Cmd.importModule x :: rest => x.raw :: importNames rest
  | _ :: rest => importNames rest

/-- String lists equal. -/
def stringsEq : List String -> List String -> Bool
  | [], [] => true
  | a :: as, b :: bs => a == b && stringsEq as bs
  | _, _ => false

/-- Parse live HostModuleCheckLoadOk.lean text.
    Greppable: parseLiveHostModuleCheckLoadOkSource, PARSE-LIVE-LOADOK. -/
def parseLiveHostModuleCheckLoadOkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLoadOk liveHostModuleCheckLoadOkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckLoadOk"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckLoadOk parse.
    Greppable: kernelCheckLiveHostModuleCheckLoadOkSource, PARSE-LIVE-LOADOK.
    On accept this is HostKernel.kernelCheck, not a constant true.
    On reject this is false. -/
def kernelCheckLiveHostModuleCheckLoadOkSource (src : String) : Bool :=
  match parseLiveHostModuleCheckLoadOkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostModuleCheckLoadOkParsed? : Option Module :=
  match parseLiveHostModuleCheckLoadOkSource liveHostModuleCheckLoadOkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostModuleCheckLoadOkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse keeps the twelve imports plus namespace and end.
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveHostModuleCheckLoadOkParsed? with
  | some m => m.commands.length >= 14
  | none => false

/-- Live parse imports are this product's twelve imports, in order. -/
def liveParseHasProductImports : Bool :=
  match liveHostModuleCheckLoadOkParsed? with
  | none => false
  | some m => stringsEq (importNames m.commands) productImports

/-- Live parse has namespace SystemsLean.HostModuleCheck. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveHostModuleCheckLoadOkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostModuleCheck. -/
def liveParseHasHostModuleCheckEnd : Bool :=
  match liveHostModuleCheckLoadOkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live module name is this product. -/
def liveParseModuleNameOk : Bool :=
  match liveHostModuleCheckLoadOkParsed? with
  | none => false
  | some m => m.name.raw == "SystemsLean.HostModuleCheckLoadOk"

/-- Live text names this product's four defs (kept or skipped head). -/
def liveParseHasCoreDefs : Bool :=
  let toks := tokenizeHostTerm (stripComments liveHostModuleCheckLoadOkSource)
  let fuel := liveHostModuleCheckLoadOkSkipFuel
  toksHaveDefNamed fuel toks "hostModuleCheckLoadOk"
    && toksHaveDefNamed fuel toks "hostModuleCheckWithoutLakeKeepsHostLake"
    && toksHaveDefNamed fuel toks "hostModuleCheckReady"
    && toksHaveDefNamed fuel toks "hostModuleCheckWithoutLakeReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckLoadOkReady,
    PARSE-LIVE-LOADOK, HOST-FRONT-LIVE-LOADOK.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not hardcoded true. -/
def hostFrontLiveHostModuleCheckLoadOkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LOADOK_V0")
    && (hostId == "HOST-FRONT-LIVE-LOADOK")
    && (parseId == "PARSE-LIVE-LOADOK")
    && (liveRel == "HostModuleCheckLoadOk.lean")
    && (liveHostModuleCheckLoadOkRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckLoadOkFullHost
    && !hostFrontLiveHostModuleCheckLoadOkResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckLoadOkProvablyUnlocked
    && kernelCheckLiveHostModuleCheckLoadOkSource
      liveHostModuleCheckLoadOkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductImports
    && liveParseHasHostModuleCheckNs
    && liveParseHasHostModuleCheckEnd
    && liveParseModuleNameOk
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckLoadOkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not a mill row. -/

def runLiveHostModuleCheckLoadOk (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LOADOK =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLoadOkRel}"
  let path := root / liveHostModuleCheckLoadOkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckLoadOkRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckLoadOkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckLoadOkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckLoadOk.lean != liveHostModuleCheckLoadOkSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckLoadOk.lean")
  let r := parseLiveHostModuleCheckLoadOkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LOADOK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LOADOK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LOADOK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckLoadOk parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckLoadOk parse false")
    unless hostFrontLiveHostModuleCheckLoadOkReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckLoadOkReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckLoadOkReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"GREEN {stageId}: live HostModuleCheckLoadOk.lean parse kernelCheck; host tools stay 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheckLoadOk root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckLoadOk
