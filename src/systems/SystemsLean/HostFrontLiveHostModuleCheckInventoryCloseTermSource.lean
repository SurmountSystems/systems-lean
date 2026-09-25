/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckInventoryCloseTerm.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckInventoryCloseTerm.lean.
  It is not a neighbor product file.
  Kept commands are the HostFrontLiveHostTerm skip-fold of this file.
  Open lines and non-literal defs are skipped. theorem commands are
  skipped. example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_INVENTORY_CLOSE_TERM_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM, liveRel,
  kernelCheckLiveHostModuleCheckInventoryCloseTermSource,
  hostFrontLiveHostModuleCheckInventoryCloseTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_INVENTORY_CLOSE_TERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckInventoryCloseTerm.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckInventoryCloseTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckInventoryCloseTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckInventoryCloseTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckInventoryCloseTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckInventoryCloseTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept-command count from the lean --run log.
    Five imports, the namespace, five literal defs, and end. -/
def liveKeptCmds : Nat := 12

/-- theorem keyword count. Three theorem commands are skip-folded. -/
def liveTheoremCount : Nat := 3

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. Five import lines. -/
def liveImportCount : Nat := 5

/-- On-disk HostModuleCheckInventoryCloseTerm.lean bytes.
    Greppable: liveHostModuleCheckInventoryCloseTermSource. -/

def liveHostModuleCheckInventoryCloseTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- InventoryClose leftover L2 term-surface
  (InventoryClose TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: InventoryClose leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host inventory-close leftover / claim-board dialect subset (documented; not
  full Lean 4 elaborator):
  - inventoryCloseReady compose matches product (five conjuncts:
    SelfApplyFs.freestandingSelfApplyReady + LlvmHold.llvmHoldReady +
    inventoryCloseSurfaceOk + inventoryPartialCarryHonest +
    SelfApplyFs.freestandingProductSelfHostComplete).
  - residualFreeClaimed is L0 presence only (false). Not a ready conjunct.
  - inventoryCloseOk aliases inventoryCloseReady.
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No residual-free twin (not a top-level ready conjunct).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not PackageEnv / Soft J2 (later PE invents
    packageBodyImportsSelfApplyFs).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckInventoryCloseTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckInventoryCloseTermSurfaceOk.

  Intentional non-claims:
  - Host inventory-close leftover only -- not package elaborate, not FullHost
    re-true.
  - Not ProductPathBars. Not InventoryCloseTheorems. Not emit*Ready.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Does not flip residualFreeClaimed (stays false).
  - Does not flip SelfApplyFs.freestandingProductSelfHostComplete.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckInventoryCloseTerm, TERM-SURFACE, InventoryClose-only,
  ILL-TYPED-TERM, checkInventoryCloseTermDialect,
  hostModuleCheckInventoryCloseTermDialectOk,
  hostModuleCheckInventoryCloseTermSurfaceDualOk,
  hostModuleCheckInventoryCloseTermSurfaceOk,
  inventoryCloseReady,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckInventoryCloseTerm
  Red/green: lake build SystemsLean.HostModuleCheckInventoryCloseTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckRequiredDecls
import SystemsLean.HostModuleCheckRequiredDeclsProduct
import SystemsLean.HostModuleCheckRequiredDeclsLater

namespace SystemsLean.HostModuleCheck

/-! ### InventoryClose leftover L2 term-surface dual-ok pins (InventoryClose-only) -/

def checkDepthInventoryCloseTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthInventoryCloseTermSurfaceScope : String := "InventoryClose-only"
def hostModuleCheckInventoryCloseTermSurfaceDualOk : Bool := true

/-- Product inventoryCloseReady fold (five conjuncts only). Same string
    as the collapsed on-disk InventoryClose leftover body so L0 fixtures and
    product match. No Lake / residual-free / llvm / dominance conjuncts. -/
def inventoryCloseReadyTermBody : String :=
  "SelfApplyFs.freestandingSelfApplyReady && LlvmHold.llvmHoldReady && inventoryCloseSurfaceOk && inventoryPartialCarryHonest && SelfApplyFs.freestandingProductSelfHostComplete"

def inventoryCloseReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "inventoryCloseReady" with
  | none => false
  | some body => body == inventoryCloseReadyTermBody

def checkInventoryCloseTermDialect (content : String) : Option String :=
  if !inventoryCloseReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineInventoryCloseWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkInventoryCloseTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckInventoryCloseTermSkeletonPrefix : String :=
  "import SystemsLean.SelfApplyFs\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "namespace SystemsLean.InventoryClose\n"

def hostModuleCheckInventoryCloseTermSkeletonSuffix : String :=
  "end SystemsLean.InventoryClose\n"

/-- Honest InventoryClose leftover TERM mid: required L0 decls. Stage /
    host ids match product InventoryClose leftover. residualFreeClaimed
    stays false (L0 presence only; not a DualResidual ILL). -/
def inventoryCloseTermGoodPins (readyBody : String) : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_INVENTORY_CLOSE_V0\"\n" ++
  "def hostInventoryCloseId : String := \"HOST-INVENTORY-CLOSE\"\n" ++
  "def residualFreeClaimed : Bool := false\n" ++
  "def inventoryCloseReady : Bool := " ++ readyBody ++ "\n" ++
  "def inventoryCloseOk : Bool := inventoryCloseReady\n"

def hostModuleCheckInventoryCloseTermGoodMid : String :=
  inventoryCloseTermGoodPins inventoryCloseReadyTermBody

def hostModuleCheckGoodInventoryCloseTermText : String :=
  hostModuleCheckInventoryCloseTermSkeletonPrefix
    ++ hostModuleCheckInventoryCloseTermGoodMid
    ++ hostModuleCheckInventoryCloseTermSkeletonSuffix

def hostModuleCheckBadInventoryCloseReadyText : String :=
  hostModuleCheckInventoryCloseTermSkeletonPrefix
    ++ inventoryCloseTermGoodPins "true"
    ++ hostModuleCheckInventoryCloseTermSkeletonSuffix

def inventoryCloseTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.InventoryClose"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def inventoryCloseTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (inventoryCloseTermSurfaceFrom content)
    inventoryCloseExpectedNamespace inventoryCloseRequiredDecls
    (some "SystemsLean.SelfApplyFs")).isAccept

def inventoryCloseTermDialectReject (content : String) : Bool :=
  match checkInventoryCloseTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadInventoryCloseReadyL0Accept : Bool :=
  inventoryCloseTermL0Accept hostModuleCheckBadInventoryCloseReadyText

def hostModuleCheckBadInventoryCloseReadyDialectReject : Bool :=
  inventoryCloseTermDialectReject hostModuleCheckBadInventoryCloseReadyText

def hostModuleCheckInventoryCloseTermDialectOk : Bool :=
  (checkInventoryCloseTermDialect hostModuleCheckGoodInventoryCloseTermText).isNone

/-- On-disk InventoryClose leftover inventoryCloseReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodInventoryCloseReadyMultilineText : String :=
  "def inventoryCloseReady : Bool :=\n" ++
  "  SelfApplyFs.freestandingSelfApplyReady\n" ++
  "    && LlvmHold.llvmHoldReady\n" ++
  "    && inventoryCloseSurfaceOk\n" ++
  "    && inventoryPartialCarryHonest\n" ++
  "    && SelfApplyFs.freestandingProductSelfHostComplete\n"

/-- Collapse of the on-disk multi-line inventoryCloseReady body. -/
def hostModuleCheckInventoryCloseReadyMultilineOk : Bool :=
  inventoryCloseReadyBodyOk hostModuleCheckGoodInventoryCloseReadyMultilineText

def hostModuleCheckInventoryCloseTermSurfaceOk : Bool :=
  hostModuleCheckInventoryCloseTermSurfaceDualOk
    && (checkDepthInventoryCloseTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthInventoryCloseTermSurfaceScope == "InventoryClose-only")
    && hostModuleCheckInventoryCloseTermDialectOk
    && hostModuleCheckBadInventoryCloseReadyDialectReject
    && hostModuleCheckBadInventoryCloseReadyL0Accept
    && hostModuleCheckInventoryCloseReadyMultilineOk

theorem hostModuleCheckInventoryCloseTermSurfaceOk_true :
    hostModuleCheckInventoryCloseTermSurfaceOk = true := by native_decide

theorem hostModuleCheckInventoryCloseReadyMultilineOk_true :
    hostModuleCheckInventoryCloseReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_inventoryClose_term_surface_ids_eq :
    checkDepthInventoryCloseTermSurfaceBar = "TERM-SURFACE"
      && checkDepthInventoryCloseTermSurfaceScope = "InventoryClose-only"
      && hostModuleCheckInventoryCloseTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#
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
def cmdAddsGk (c : Cmd) : List String :=
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
def cmdBodyKnownGk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdGk (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip open, theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsGk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdGk liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      if cmdBodyKnownGk kn c then
        parseCmdsGk n rest2 (kn ++ cmdAddsGk c) (acc ++ [c])
      else
        parseCmdsGk n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsGk n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live HostModuleCheckInventoryCloseTerm.lean text.
    Greppable: parseLiveHostModuleCheckInventoryCloseTermSource. -/
def parseLiveHostModuleCheckInventoryCloseTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGk liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckInventoryCloseTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckInventoryCloseTermSource. -/
def kernelCheckLiveHostModuleCheckInventoryCloseTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckInventoryCloseTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckInventoryCloseTermSource
      liveHostModuleCheckInventoryCloseTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count is the kept set, not a neighbor count. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "checkDepthInventoryCloseTermSurfaceBar"
      && has "checkDepthInventoryCloseTermSurfaceScope"
      && has "hostModuleCheckInventoryCloseTermSurfaceDualOk"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckInventoryCloseTerm"

/-- Live parse has namespace SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostModuleCheck. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse keeps the five imports. -/
def liveParseImportCountOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let n := m.commands.foldl (fun acc c =>
      match c with
      | Cmd.importModule _ => acc + 1
      | _ => acc) 0
    n == liveImportCount

/-- Keyword counts: three theorem commands, no example, no set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveHostModuleCheckInventoryCloseTermSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthInventoryCloseTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckInventoryCloseTermSurfaceDualOk : Bool := true\n"

/-- Skipped non-literal def needle with a trailing newline. -/
def needleParseOk : String :=
  "def hostModuleCheckInventoryCloseTermDialectOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckInventoryCloseTermSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleParseOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckInventoryCloseTermReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckInventoryCloseTermReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_INVENTORY_CLOSE_TERM_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM")
    && (liveRel == "HostModuleCheckInventoryCloseTerm.lean")
    && (liveHostModuleCheckInventoryCloseTermRel ==
      "src/systems/SystemsLean/HostModuleCheckInventoryCloseTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckInventoryCloseTermFullHost
    && !hostFrontLiveHostModuleCheckInventoryCloseTermFullBackend
    && !hostFrontLiveHostModuleCheckInventoryCloseTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckInventoryCloseTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckInventoryCloseTermSource
      liveHostModuleCheckInventoryCloseTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasModuleName
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseImportCountOk
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckInventoryCloseTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- One kept command, for a failure line. -/
def cmdTag : Cmd -> String
  | Cmd.importModule x => s!"import {x.raw}"
  | Cmd.namespace x => s!"namespace {x.raw}"
  | Cmd.endNamespace x => s!"end {x.raw}"
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => s!"inductive {x.raw}"
  | Cmd.def_ x _ _ => s!"def {x.raw}"
  | Cmd.defBind x _ _ _ => s!"defBind {x.raw}"
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => s!"structure {x.raw}"

/-- Which ready conjuncts failed. Empty when ready holds. -/
def readyFailures : List String :=
  let bad (name : String) (ok : Bool) : List String :=
    if ok then [] else [name]
  bad "stageId" (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_INVENTORY_CLOSE_TERM_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM")
    ++ bad "liveRel" (liveRel == "HostModuleCheckInventoryCloseTerm.lean")
    ++ bad "rel" (liveHostModuleCheckInventoryCloseTermRel ==
      "src/systems/SystemsLean/HostModuleCheckInventoryCloseTerm.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckInventoryCloseTermFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckInventoryCloseTermFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckInventoryCloseTermResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckInventoryCloseTermProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckInventoryCloseTermSource
      liveHostModuleCheckInventoryCloseTermSource)
    ++ bad "noCheck" liveParseHasNoCheckCmd
    ++ bad "count" liveParseCmdCountOk
    ++ bad "literals" liveParseHasLiteralDefs
    ++ bad "module" liveParseHasModuleName
    ++ bad "ns" liveParseHasNs
    ++ bad "endNs" liveParseHasEnd
    ++ bad "imports" liveParseImportCountOk
    ++ bad "kw" liveParseKwCountsOk
    ++ bad "needles" liveNeedlesOk

/-! ### Driver (short banners; on-disk bytes must match the embedded source). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: {parseId} =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckInventoryCloseTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckInventoryCloseTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckInventoryCloseTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckInventoryCloseTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckInventoryCloseTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckInventoryCloseTerm.lean != liveHostModuleCheckInventoryCloseTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckInventoryCloseTerm.lean")
  let r := parseLiveHostModuleCheckInventoryCloseTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckInventoryCloseTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckInventoryCloseTerm parse false")
    unless hostFrontLiveHostModuleCheckInventoryCloseTermReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckInventoryCloseTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckInventoryCloseTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckInventoryCloseTerm source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource
