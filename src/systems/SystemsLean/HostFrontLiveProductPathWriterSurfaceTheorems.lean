/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProductPathWriterSurfaceTheorems.lean.
  It is not ProductPathWriterSurface.lean.
  The live file has no kernel-checkable def. Import, namespace, and end
  are kept. theorem, example, and set_option are skip-folded.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS, WRITER-SURFACE-THEOREM,
  liveRel, kernelCheckLiveProductPathWriterSurfaceTheoremsSource,
  hostFrontLiveProductPathWriterSurfaceTheoremsReady.
  Module: SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems
  liveRel is the bare basename in
  HostFrontLiveProductPathWriterSurfaceTheoremsSource.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathWriterSurfaceTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is the bare basename from the Source module. -/
def liveProductPathWriterSurfaceTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathWriterSurfaceTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveProductPathWriterSurfaceTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathWriterSurfaceTheoremsResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProductPathWriterSurfaceTheoremsProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathWriterSurfaceTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem, example, and set_option. -/
def liveProductPathWriterSurfaceTheoremsSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, and end.
    From ProductPathWriterSurfaceTheorems.lean. No def is kept. -/
def liveProductPathWriterSurfaceTheoremsKeptCmds : Nat := 3

/-- theorem keyword count. ProductPathWriterSurfaceTheorems.lean has 13. -/
def liveProductPathWriterSurfaceTheoremsTheoremCount : Nat := 13

/-- example keyword count. ProductPathWriterSurfaceTheorems.lean has 11. -/
def liveProductPathWriterSurfaceTheoremsExampleCount : Nat := 11

/-- set_option keyword count. ProductPathWriterSurfaceTheorems.lean has 0. -/
def liveProductPathWriterSurfaceTheoremsSetOptionCount : Nat := 0

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
def cmdAddsProductPathWriterSurfaceTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathWriterSurfaceTheorems (kn : List String) :
    Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterSurfaceTheoremsParseFuel body
        && termNoAppN liveProductPathWriterSurfaceTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterSurfaceTheoremsParseFuel body
        && termNoAppN liveProductPathWriterSurfaceTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductPathWriterSurfaceTheorems (fuel : Nat)
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

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsProductPathWriterSurfaceTheorems : Nat -> List String ->
    List String -> List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathWriterSurfaceTheorems
        liveProductPathWriterSurfaceTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathWriterSurfaceTheoremsSkipFuel rest
      if cmdBodyKnownProductPathWriterSurfaceTheorems kn c then
        parseCmdsProductPathWriterSurfaceTheorems n rest2
          (kn ++ cmdAddsProductPathWriterSurfaceTheorems c) (acc ++ [c])
      else
        parseCmdsProductPathWriterSurfaceTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 :=
            skipUntilCmd liveProductPathWriterSurfaceTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathWriterSurfaceTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live ProductPathWriterSurfaceTheorems.lean text.
    Greppable: parseLiveProductPathWriterSurfaceTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS. -/
def parseLiveProductPathWriterSurfaceTheoremsSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathWriterSurfaceTheorems
        liveProductPathWriterSurfaceTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathWriterSurfaceTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathWriterSurfaceTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveProductPathWriterSurfaceTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS.
    The check constant is HostKernel.kernelCheck. -/
def kernelCheckLiveProductPathWriterSurfaceTheoremsSource (src : String) :
    Bool :=
  match parseLiveProductPathWriterSurfaceTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathWriterSurfaceTheoremsParsed? : Option Module :=
  match parseLiveProductPathWriterSurfaceTheoremsSource
      liveProductPathWriterSurfaceTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Not a count that invents defs. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | some m =>
    m.commands.length == liveProductPathWriterSurfaceTheoremsKeptCmds
  | none => false

/-- This theorems file keeps no def. -/
def liveParseHasNoDefCmd : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is ProductPathWriterSurfaceTheorems
    (no module line in the live file). -/
def liveParseHasProductPathWriterSurfaceTheoremsModule : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductPathWriterSurfaceTheorems"
      && lastSeg m.name.raw == "ProductPathWriterSurfaceTheorems"

/-- Live parse has namespace SystemsLean.ProductPathWriterSurface. -/
def liveParseHasProductPathWriterSurfaceNs : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPathWriterSurface"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductPathWriterSurface. -/
def liveParseHasProductPathWriterSurfaceEnd : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductPathWriterSurface"
      | _ => false

/-- Live parse imports SystemsLean.ProductPathWriterSurface. -/
def liveParseHasImports : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x =>
        x.raw == "SystemsLean.ProductPathWriterSurface"
      | _ => false

/-- Keyword counts from the live text. -/
def liveParseKwCountsOk : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveProductPathWriterSurfaceTheoremsSource)
    let fuel := liveProductPathWriterSurfaceTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveProductPathWriterSurfaceTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveProductPathWriterSurfaceTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductPathWriterSurfaceTheoremsSetOptionCount

/-- Skip-head: named theorems are in the live text. -/
def liveParseHasCoreTheorems : Bool :=
  match liveProductPathWriterSurfaceTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveProductPathWriterSurfaceTheoremsSource)
    let fuel := liveProductPathWriterSurfaceTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "productWriterSurfaceOk_true"
      && toksHaveTheoremNamed fuel toks
        "productWriterSurfacePartialReady_true"

/-- Import needle. Trailing newline. -/
def needleImport : String :=
  "import SystemsLean.ProductPathWriterSurface\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String :=
  "namespace SystemsLean.ProductPathWriterSurface\n"

/-- stageId_eq theorem head needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- hostId_eq theorem head needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- productWriterSurfaceOk_true theorem head needle. Trailing newline. -/
def needleSurfaceOk : String := "theorem productWriterSurfaceOk_true :\n"

/-- productWriterSurfacePartialReady_true theorem head needle.
    Trailing newline. -/
def needlePartialReady : String :=
  "theorem productWriterSurfacePartialReady_true :\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProductPathWriterSurface\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ProductPathWriterSurfaceTheorems.
    Needles are lines in the live file. -/
def liveNeedlesOk : Bool :=
  let src := liveProductPathWriterSurfaceTheoremsSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleSurfaceOk).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathWriterSurfaceTheoremsReady,
    PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS,
    HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductPathWriterSurfaceTheoremsReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_THEOREMS_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS")
    && (liveRel == "ProductPathWriterSurfaceTheorems.lean")
    && (liveProductPathWriterSurfaceTheoremsRel
      == "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathWriterSurfaceTheoremsFullHost
    && !hostFrontLiveProductPathWriterSurfaceTheoremsFullBackend
    && !hostFrontLiveProductPathWriterSurfaceTheoremsResidualFreeClaimed
    && !hostFrontLiveProductPathWriterSurfaceTheoremsProvablyUnlocked
    && kernelCheckLiveProductPathWriterSurfaceTheoremsSource
      liveProductPathWriterSurfaceTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoDefCmd
    && liveParseHasProductPathWriterSurfaceTheoremsModule
    && liveParseHasProductPathWriterSurfaceNs
    && liveParseHasProductPathWriterSurfaceEnd
    && liveParseHasImports
    && liveParseKwCountsOk
    && liveParseHasCoreTheorems
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathWriterSurfaceTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductPathWriterSurfaceTheorems (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveProductPathWriterSurfaceTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductPathWriterSurfaceTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathWriterSurfaceTheoremsRel}"
    throw (IO.userError s!"missing {liveProductPathWriterSurfaceTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathWriterSurfaceTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathWriterSurfaceTheorems.lean != liveProductPathWriterSurfaceTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathWriterSurfaceTheorems.lean")
  let r := parseLiveProductPathWriterSurfaceTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathWriterSurfaceTheorems parse false"
      throw (IO.userError "kernelCheck live ProductPathWriterSurfaceTheorems parse false")
    unless hostFrontLiveProductPathWriterSurfaceTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductPathWriterSurfaceTheoremsReady false"
      throw (IO.userError "hostFrontLiveProductPathWriterSurfaceTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductPathWriterSurfaceTheorems source was accepted"
      throw (IO.userError "empty ProductPathWriterSurfaceTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathWriterSurfaceTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems
