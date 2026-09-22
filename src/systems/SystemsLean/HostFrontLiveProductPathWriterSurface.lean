/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathWriterSurface.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Not a remill. Not occupancy name 50. Not FullHost.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Theorems live in ProductPathWriterSurfaceTheorems and are not in this file.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE, liveRel,
  kernelCheckLiveProductPathWriterSurfaceSource,
  hostFrontLiveProductPathWriterSurfaceReady.
  Module: SystemsLean.HostFrontLiveProductPathWriterSurface
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathWriterSurfaceSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathWriterSurface

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE"

/-- Live file basename. -/
def liveRel : String := "ProductPathWriterSurface.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterSurfaceRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathWriterSurfaceFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathWriterSurfaceResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathWriterSurfaceProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathWriterSurfaceParseFuel : Nat := 256

/-- Skip fuel for doc tails the kernel does not keep. -/
def liveProductPathWriterSurfaceSkipFuel : Nat := 8192

/-- Namespace plus 19 defs plus end. -/
def liveProductPathWriterSurfaceCmdCount : Nat := 21

/-- Dotted ident `SystemsLean . ProductPathWriterSurface`. -/
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
def cmdAddsProductPathWriterSurface (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app (this surface has no string-concat app). -/
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
def cmdBodyKnownProductPathWriterSurface (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterSurfaceParseFuel body
        && termNoAppN liveProductPathWriterSurfaceParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterSurfaceParseFuel body
        && termNoAppN liveProductPathWriterSurfaceParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathWriterSurface (fuel : Nat) (toks : List String) :
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

/-- Fold commands. This file has no theorem, example, or import. -/
def parseCmdsProductPathWriterSurface : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathWriterSurface
        liveProductPathWriterSurfaceParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathWriterSurfaceSkipFuel rest
      if cmdBodyKnownProductPathWriterSurface kn c then
        parseCmdsProductPathWriterSurface n rest2
          (kn ++ cmdAddsProductPathWriterSurface c) (acc ++ [c])
      else
        parseCmdsProductPathWriterSurface n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathWriterSurfaceSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathWriterSurface n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live ProductPathWriterSurface.lean text.
    Greppable: parseLiveProductPathWriterSurfaceSource,
    PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE. -/
def parseLiveProductPathWriterSurfaceSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathWriterSurface
        liveProductPathWriterSurfaceParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathWriterSurface"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathWriterSurface parse. Not a fixture.
    Not occupancy Term. Greppable:
    kernelCheckLiveProductPathWriterSurfaceSource,
    PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE. -/
def kernelCheckLiveProductPathWriterSurfaceSource (src : String) : Bool :=
  match parseLiveProductPathWriterSurfaceSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathWriterSurfaceParsed? : Option Module :=
  match parseLiveProductPathWriterSurfaceSource
      liveProductPathWriterSurfaceSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathWriterSurfaceParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count: namespace, 19 defs, end. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathWriterSurfaceParsed? with
  | some m => m.commands.length == liveProductPathWriterSurfaceCmdCount
  | none => false

/-- Wrap module lastSeg is ProductPathWriterSurface (no module line). -/
def liveParseHasProductPathWriterSurfaceModule : Bool :=
  match liveProductPathWriterSurfaceParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathWriterSurface"

/-- Live parse has the living ProductPathWriterSurface namespace command. -/
def liveParseHasProductPathWriterSurfaceNs : Bool :=
  match liveProductPathWriterSurfaceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathWriterSurface"
      | _ => false

/-- Live parse has the living end command. -/
def liveParseHasProductPathWriterSurfaceEnd : Bool :=
  match liveProductPathWriterSurfaceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "ProductPathWriterSurface"
      | _ => false

/-- True when the accepted commands include a def of this name. -/
def cmdsHaveDefNamed (cmds : List Cmd) (nm : String) : Bool :=
  cmds.any fun c =>
    match c with
    | Cmd.def_ x _ _ => x.raw == nm
    | Cmd.defBind x _ _ _ => x.raw == nm
    | _ => false

/-- Cite defs and the two Bool folds are in the kernel-checked module.
    This file has no theorem. -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathWriterSurfaceParsed? with
  | none => false
  | some m =>
    cmdsHaveDefNamed m.commands "stageId"
      && cmdsHaveDefNamed m.commands "hostId"
      && cmdsHaveDefNamed m.commands "selfHostId"
      && cmdsHaveDefNamed m.commands "writerSurfaceModuleCite"
      && cmdsHaveDefNamed m.commands "productOutPath"
      && cmdsHaveDefNamed m.commands "productWriterApiPlan"
      && cmdsHaveDefNamed m.commands "productWriterApiApply"
      && cmdsHaveDefNamed m.commands "productWriterApiBody"
      && cmdsHaveDefNamed m.commands "productWriterOwnPlan"
      && cmdsHaveDefNamed m.commands "productWriterOwnApply"
      && cmdsHaveDefNamed m.commands "productWriterOwnBody"
      && cmdsHaveDefNamed m.commands "productOutApiMult"
      && cmdsHaveDefNamed m.commands "productOutApiLinear"
      && cmdsHaveDefNamed m.commands "productOutApiErasure"
      && cmdsHaveDefNamed m.commands "productOutApiTypes"
      && cmdsHaveDefNamed m.commands "productOutApiProgram"
      && cmdsHaveDefNamed m.commands "acceptancePath"
      && cmdsHaveDefNamed m.commands "productWriterSurfaceOk"
      && cmdsHaveDefNamed m.commands "productWriterSurfacePartialReady"

/-- Unique needle. Trailing newline. -/
def needleNamespace : String :=
  "namespace SystemsLean.ProductPathWriterSurface\n"

/-- def stageId needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0\"\n"

/-- def productWriterSurfaceOk needle with a trailing newline. -/
def needleSurfaceOk : String :=
  "def productWriterSurfaceOk : Bool :=\n"

/-- def productWriterSurfacePartialReady needle with a trailing newline. -/
def needlePartialReady : String :=
  "def productWriterSurfacePartialReady : Bool :=\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveProductPathWriterSurfaceSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleSurfaceOk).length > 1
    && (src.splitOn needlePartialReady).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathWriterSurfaceReady,
    PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE,
    HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. -/
def hostFrontLiveProductPathWriterSurfaceReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE")
    && (liveRel == "ProductPathWriterSurface.lean")
    && (liveProductPathWriterSurfaceRel
      == "src/systems/SystemsLean/ProductPathWriterSurface.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathWriterSurfaceFullHost
    && !hostFrontLiveProductPathWriterSurfaceResidualFreeClaimed
    && !hostFrontLiveProductPathWriterSurfaceProvablyUnlocked
    && kernelCheckLiveProductPathWriterSurfaceSource
      liveProductPathWriterSurfaceSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathWriterSurfaceNs
    && liveParseHasProductPathWriterSurfaceEnd
    && liveParseHasProductPathWriterSurfaceModule
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathWriterSurfaceSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductPathWriterSurface (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE =="
  IO.println s!"  host={hostId} file={liveProductPathWriterSurfaceRel}"
  let path := root / liveProductPathWriterSurfaceRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathWriterSurfaceRel}"
    throw (IO.userError s!"missing {liveProductPathWriterSurfaceRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathWriterSurfaceSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathWriterSurface.lean != liveProductPathWriterSurfaceSource"
    throw (IO.userError "dual-pin mismatch live ProductPathWriterSurface.lean")
  let r := parseLiveProductPathWriterSurfaceSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE ACCEPT cmds={m.commands.length} kernelCheck={k} liveRel={liveRel}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathWriterSurface parse false"
      throw (IO.userError "kernelCheck live ProductPathWriterSurface parse false")
    unless hostFrontLiveProductPathWriterSurfaceReady do
      IO.eprintln s!"error: hostFrontLiveProductPathWriterSurfaceReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} core={liveParseHasCoreDefs} ns={liveParseHasProductPathWriterSurfaceNs} endNs={liveParseHasProductPathWriterSurfaceEnd} mod={liveParseHasProductPathWriterSurfaceModule} needles={liveNeedlesOk} nocheck={liveParseHasNoCheckCmd} empty={liveParseRejectsEmpty}"
      throw (IO.userError "hostFrontLiveProductPathWriterSurfaceReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"GREEN {stageId}: live ProductPathWriterSurface.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathWriterSurface root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathWriterSurface
