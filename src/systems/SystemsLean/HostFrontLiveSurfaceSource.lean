/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckSurface.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSurfaceSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-SURFACE, liveSurfaceSource,
  HOST-FRONT-LIVE-SURFACE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSurfaceSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSurface

/-- Dual-pinned live HostModuleCheckSurface.lean bytes (must match on-disk file).
    Greppable: liveSurfaceSource, PARSE-LIVE-SURFACE. -/
def liveSurfaceSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck structural surface model + helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split: per-seed check*Surface roles and checkRealModule live in
  HostModuleCheckCheckers (+ Later companion). This tip keeps reject reasons,
  surface model, line helpers, expected namespaces, and checkNamedSurface.
  Same namespace SystemsLean.HostModuleCheck.

  Spec (readable):
  - RealModuleSurface + ModuleCheckResult structural model.
  - ASCII line helpers (import/namespace/key-decl extract).
  - Expected namespaces + checkNamedSurface helper.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckSurface,
  RealModuleSurface, ModuleCheckResult, checkNamedSurface, extractImports,
  extractKeyDecls, reasonMissingDecl, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckSurface
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckSurface;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckFixtures

namespace SystemsLean.HostModuleCheck

/-! ### Reject reasons (greppable fail-closed tokens) -/

def reasonMissingFile : String := "MISSING-FILE"
def reasonMissingNamespace : String := "MISSING-NAMESPACE"
def reasonMissingDecl : String := "MISSING-DECL"
def reasonEmptyModule : String := "EMPTY-MODULE"
def reasonSeedMismatch : String := "SEED-MISMATCH"
def reasonMissingImport : String := "MISSING-IMPORT"

/-! ### Surface model (structural decls from real .lean text) -/

/-- One real host module surface (name + imports + key decls found).
    Greppable: RealModuleSurface. -/
structure RealModuleSurface where
  name : String
  imports : List String
  namespaceName : Option String
  keyDecls : List String
  deriving Repr, DecidableEq

/-- Module check result: accept surface, or reject with reason. -/
inductive ModuleCheckResult where
  | accept (surf : RealModuleSurface)
  | reject (reason : String)
  deriving Repr

/-- True when accept. -/
def ModuleCheckResult.isAccept : ModuleCheckResult -> Bool
  | ModuleCheckResult.accept _ => true
  | ModuleCheckResult.reject _ => false

/-- True when reject with exact reason. -/
def ModuleCheckResult.isRejectWith (r : ModuleCheckResult) (reason : String) :
    Bool :=
  match r with
  | ModuleCheckResult.reject r' => r' == reason
  | ModuleCheckResult.accept _ => false

/-! ### Line helpers (ASCII; same spirit as HostImportGraph) -/

/-- Whitespace? -/
def isWs (c : Char) : Bool := c == ' ' || c == '\t' || c == '\r'

/-- Drop leading ASCII whitespace. -/
def trimLeft (s : String) : String :=
  let rec go (cs : List Char) : List Char :=
    match cs with
    | [] => []
    | c :: rest => if isWs c then go rest else c :: rest
  String.ofList (go s.toList)

/-- Drop trailing ASCII whitespace. -/
def trimRight (s : String) : String :=
  let rec dropEnd (cs : List Char) : List Char :=
    match cs with
    | [] => []
    | c :: rest =>
      if isWs c then dropEnd rest else c :: rest
  String.ofList (dropEnd s.toList.reverse).reverse

/-- Trim both ends. -/
def trim (s : String) : String :=
  trimRight (trimLeft s)

/-- True when string starts with prefix. -/
def hasPrefix (s pref : String) : Bool :=
  s.startsWith pref

/-- Strip line comment from first `--`. -/
def stripLineComment (s : String) : String :=
  match s.splitOn "--" with
  | [] => s
  | h :: _ => h

/-- True when token is a package-local SystemsLean import target. -/
def isPackageLocalImport (name : String) : Bool :=
  hasPrefix name "SystemsLean."

/-- Parse one line for `import SystemsLean.X`.
    Greppable: parseImportLine. -/
def parseImportLine (line : String) : Option String :=
  let t := trim (stripLineComment line)
  if !(hasPrefix t "import ") then none
  else
    let rest := trim (String.Slice.toString (t.drop "import ".length))
    let name :=
      match rest.splitOn " " with
      | [] => ""
      | h :: _ =>
        match h.splitOn "\t" with
        | [] => h
        | n :: _ => n
    let name := trimRight name
    if name.isEmpty then none
    else if isPackageLocalImport name then some name
    else none

/-- Extract package-local imports from full file content (block-comment aware).
    Greppable: extractImports. -/
def extractImports (content : String) : List String :=
  let rec go (inBlock : Bool) (acc : List String) :
      List String -> List String
    | [] => acc.reverse
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false acc rest
        else
          go true acc rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false acc rest
          else
            go true acc rest
        else
          match parseImportLine line with
          | none => go false acc rest
          | some n =>
            if acc.any (fun x => x == n) then go false acc rest
            else go false (n :: acc) rest
  go false [] (content.splitOn "\n")

/-- First token after keyword on a non-comment line (def/inductive/theorem/namespace).
    Returns (kind, name) when line starts with kind. -/
def parseKindName (line : String) (kind : String) : Option String :=
  let t := trim (stripLineComment line)
  let pref := kind ++ " "
  if !(hasPrefix t pref) then none
  else
    let rest := trim (String.Slice.toString (t.drop pref.length))
    let name :=
      match rest.splitOn " " with
      | [] => ""
      | h :: _ =>
        match h.splitOn "\t" with
        | [] => h
        | n :: _ => n
    let name := trimRight name
    -- Strip trailing punctuation that may appear (e.g. where, :).
    let name :=
      match name.splitOn ":" with
      | [] => name
      | h :: _ => h
    let name := trimRight name
    if name.isEmpty then none else some name

/-- Extract first namespace name found (outside block comments).
    Greppable: extractNamespace. -/
def extractNamespace (content : String) : Option String :=
  let rec go (inBlock : Bool) : List String -> Option String
    | [] => none
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false rest
        else
          go true rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false rest
          else
            go true rest
        else
          match parseKindName line "namespace" with
          | some n => some n
          | none => go false rest
  go false (content.splitOn "\n")

/-- Extract key decl names for kinds inductive / structure / axiom / def / theorem
    (unique, order of first see). A56 Check depth deepen adds structure + axiom
    so Mult..Types FOUNDATION-KIND-SURFACE can require Token/TypeTag/IrNode.
    Greppable: extractKeyDecls, FOUNDATION-KIND-SURFACE, Check depth deepen. -/
def extractKeyDecls (content : String) : List String :=
  let rec go (inBlock : Bool) (acc : List String) :
      List String -> List String
    | [] => acc.reverse
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false acc rest
        else
          go true acc rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false acc rest
          else
            go true acc rest
        else
          let found : Option String :=
            match parseKindName line "inductive" with
            | some n => some ("inductive:" ++ n)
            | none =>
              match parseKindName line "structure" with
              | some n => some ("structure:" ++ n)
              | none =>
                match parseKindName line "axiom" with
                | some n => some ("axiom:" ++ n)
                | none =>
                  match parseKindName line "def" with
                  | some n => some ("def:" ++ n)
                  | none =>
                    match parseKindName line "theorem" with
                    | some n => some ("theorem:" ++ n)
                    | none => none
          match found with
          | none => go false acc rest
          | some d =>
            if acc.any (fun x => x == d) then go false acc rest
            else go false (d :: acc) rest
  go false [] (content.splitOn "\n")

/-- True when keyDecls list contains exact token. -/
def hasKey (keys : List String) (tok : String) : Bool :=
  keys.any (fun k => k == tok)

/-- True when content has no non-comment non-blank lines after strip. -/
def isEffectivelyEmpty (content : String) : Bool :=
  let rec go (inBlock : Bool) : List String -> Bool
    | [] => true
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false rest
        else
          go true rest
      else
        let t := trim line
        if t.isEmpty then go false rest
        else if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false rest
          else
            go true rest
        else if hasPrefix t "--" then
          go false rest
        else
          false
  go false (content.splitOn "\n")

/-! ### Expected Mult surface (required decl lists in HostModuleCheckFixtures)
    Greppable: multRequiredDecls, hostComposeRequiredDecls, HostModuleCheckFixtures. -/

/-- Expected namespaces for seed roles. -/
def multExpectedNamespace : String := "SystemsLean.Mult"
def linearExpectedNamespace : String := "SystemsLean.Linear"
def typesExpectedNamespace : String := "SystemsLean.Types"
def irProgramExpectedNamespace : String := "SystemsLean.IrProgram"
def irGraphExpectedNamespace : String := "SystemsLean.IrGraph"
def hostComposeExpectedNamespace : String := "SystemsLean.HostCompose"
def erasureExpectedNamespace : String := "SystemsLean.Erasure"
def extractExpectedNamespace : String := "SystemsLean.Extract"
def compilePathExpectedNamespace : String := "SystemsLean.CompilePath"
def kernelMultExpectedNamespace : String := "SystemsLean.KernelMult"
def kernelLinearExpectedNamespace : String := "SystemsLean.KernelLinear"
def kernelTypesExpectedNamespace : String := "SystemsLean.KernelTypes"
def kernelProgramExpectedNamespace : String := "SystemsLean.KernelProgram"
def joinMapExpectedNamespace : String := "SystemsLean.JoinMap"
def selfHostExpectedNamespace : String := "SystemsLean.SelfHost"
def surfaceMatrixExpectedNamespace : String := "SystemsLean.SurfaceMatrix"
def emitMultExpectedNamespace : String := "SystemsLean.EmitMult"
def emitLinearExpectedNamespace : String := "SystemsLean.EmitLinear"
def emitTypesExpectedNamespace : String := "SystemsLean.EmitTypes"
def emitProgramExpectedNamespace : String := "SystemsLean.EmitProgram"
def emitGraphExpectedNamespace : String := "SystemsLean.EmitGraph"
def emitComposeExpectedNamespace : String := "SystemsLean.EmitCompose"
def emitPlanExpectedNamespace : String := "SystemsLean.EmitPlan"
def emitApplyExpectedNamespace : String := "SystemsLean.EmitApply"
def emitBodyExpectedNamespace : String := "SystemsLean.EmitBody"
def emitErasureExpectedNamespace : String := "SystemsLean.EmitErasure"
def emitExtractExpectedNamespace : String := "SystemsLean.EmitExtract"
def emitBannerExpectedNamespace : String := "SystemsLean.EmitBanner"
def kernelSelfApplyExpectedNamespace : String := "SystemsLean.KernelSelfApply"
def kernelEmitExpectedNamespace : String := "SystemsLean.KernelEmit"
def parityMultExpectedNamespace : String := "SystemsLean.ParityMult"
def parityLinearExpectedNamespace : String := "SystemsLean.ParityLinear"
def parityTypesExpectedNamespace : String := "SystemsLean.ParityTypes"
def parityProgramExpectedNamespace : String := "SystemsLean.ParityProgram"
def parityEmitExpectedNamespace : String := "SystemsLean.ParityEmit"
def selfApplyExpectedNamespace : String := "SystemsLean.SelfApply"
def productOutKernelExpectedNamespace : String := "SystemsLean.ProductOutKernel"
def bootstrapHonestyExpectedNamespace : String := "SystemsLean.BootstrapHonesty"
def productPathWriterSurfaceExpectedNamespace : String := "SystemsLean.ProductPathWriterSurface"
def productPathWriterPathPlanExpectedNamespace : String := "SystemsLean.ProductPathWriterPathPlan"
def productPathWriterPathExecExpectedNamespace : String := "SystemsLean.ProductPathWriterPathExec"
def productPathOwnershipInputsExpectedNamespace : String := "SystemsLean.ProductPathOwnershipInputs"
def productPathPerformExpectedNamespace : String := "SystemsLean.ProductPathPerform"
def productPathPerformStepExpectedNamespace : String := "SystemsLean.ProductPathPerformStep"
def productPathReadSsotExpectedNamespace : String := "SystemsLean.ProductPathReadSsot"
def productPathComposePlanExpectedNamespace : String := "SystemsLean.ProductPathComposePlan"
def capableExpectedNamespace : String := "SystemsLean.Capable"
def capableStepContractExpectedNamespace : String := "SystemsLean.CapableStepContract"
def installOutExpectedNamespace : String := "SystemsLean.InstallOut"
def officialPathExpectedNamespace : String := "SystemsLean.OfficialPath"
def performEvidenceExpectedNamespace : String := "SystemsLean.PerformEvidence"
def capableReadExpectedNamespace : String := "SystemsLean.CapableRead"
def capableComposeExpectedNamespace : String := "SystemsLean.CapableCompose"
def capableFullBarExpectedNamespace : String := "SystemsLean.CapableFullBar"
def dualEqWriteCapableGapExpectedNamespace : String := "SystemsLean.DualEqWriteCapableGap"
def dualEqWriteClosePathExpectedNamespace : String := "SystemsLean.DualEqWriteClosePath"
def dualEqWriteParityExpectedNamespace : String := "SystemsLean.DualEqWriteParity"
def officialRetireExpectedNamespace : String := "SystemsLean.OfficialRetire"
def ownershipClaimedExpectedNamespace : String := "SystemsLean.OwnershipClaimed"
def performClaimedExpectedNamespace : String := "SystemsLean.PerformClaimed"
def stepContractFullExpectedNamespace : String := "SystemsLean.StepContractFull"
def selfHostCompleteExpectedNamespace : String := "SystemsLean.SelfHostComplete"
def officialPathAlternateExpectedNamespace : String := "SystemsLean.OfficialPathAlternate"
def productPathOwnershipRegenerateExpectedNamespace : String :=
  "SystemsLean.ProductPathOwnershipRegenerate"
def capableWriteHcExpectedNamespace : String := "SystemsLean.CapableWriteHc"
def dualEqWriteApiExpectedNamespace : String := "SystemsLean.DualEqWriteApi"
def llvmHoldExpectedNamespace : String := "SystemsLean.LlvmHold"
def capableRegenerateExpectedNamespace : String := "SystemsLean.CapableRegenerate"
/-- Load modules share FreestandingEmit namespace (on-disk split). -/
def freestandingEmitExpectedNamespace : String := "SystemsLean.FreestandingEmit"
def lakeRetireInventoryExpectedNamespace : String := "SystemsLean.LakeRetireInventory"
def hostPackageRootsExpectedNamespace : String := "SystemsLean.HostPackageRoots"
def productPathWriteHcExpectedNamespace : String := "SystemsLean.ProductPathWriteHc"
def productWireWriteToolExpectedNamespace : String := "SystemsLean.ProductWireWriteTool"
def hostTermExpectedNamespace : String := "SystemsLean.HostTerm"
def llvmEmitPathExpectedNamespace : String := "SystemsLean.LlvmEmitPath"
def subsetFrontExpectedNamespace : String := "SystemsLean.SubsetFront"
def firstSurfaceExpectedNamespace : String := "SystemsLean.FirstSurface"
def linearSubsetEmitExpectedNamespace : String := "SystemsLean.LinearSubsetEmit"
def typesSubsetEmitExpectedNamespace : String := "SystemsLean.TypesSubsetEmit"
def programSubsetEmitExpectedNamespace : String := "SystemsLean.ProgramSubsetEmit"
def graphSubsetEmitExpectedNamespace : String := "SystemsLean.GraphSubsetEmit"
def composeSubsetEmitExpectedNamespace : String := "SystemsLean.ComposeSubsetEmit"
def erasureSubsetEmitExpectedNamespace : String := "SystemsLean.ErasureSubsetEmit"
def extractSubsetEmitExpectedNamespace : String := "SystemsLean.ExtractSubsetEmit"
def multSubsetEmitExpectedNamespace : String := "SystemsLean.MultSubsetEmit"
def multSubsetRebuildExpectedNamespace : String := "SystemsLean.MultSubsetRebuild"
def linearSubsetRebuildExpectedNamespace : String := "SystemsLean.LinearSubsetRebuild"
def typesSubsetRebuildExpectedNamespace : String := "SystemsLean.TypesSubsetRebuild"
def programSubsetRebuildExpectedNamespace : String := "SystemsLean.ProgramSubsetRebuild"
def graphSubsetRebuildExpectedNamespace : String := "SystemsLean.GraphSubsetRebuild"
def composeSubsetRebuildExpectedNamespace : String := "SystemsLean.ComposeSubsetRebuild"
def erasureSubsetRebuildExpectedNamespace : String := "SystemsLean.ErasureSubsetRebuild"
def extractSubsetRebuildExpectedNamespace : String := "SystemsLean.ExtractSubsetRebuild"
def hostFrontExpectedNamespace : String := "SystemsLean.HostFront"
def llvmMultTextExpectedNamespace : String := "SystemsLean.LlvmMultText"
def hostFrontTheoremsExpectedNamespace : String := "SystemsLean.HostFront"
def hostCheckExpectedNamespace : String := "SystemsLean.HostCheck"
def hostGraphExpectedNamespace : String := "SystemsLean.HostGraph"
def llvmLinearTextExpectedNamespace : String := "SystemsLean.LlvmLinearText"
def multFsWriteToolExpectedNamespace : String := "SystemsLean.MultFsWriteTool"
def frontMultPackageExpectedNamespace : String := "SystemsLean.FrontMultPackage"
def subsetPackageJoinExpectedNamespace : String := "SystemsLean.SubsetPackageJoin"
def hostGraphTheoremsExpectedNamespace : String := "SystemsLean.HostGraph"
def llvmTypesTextExpectedNamespace : String := "SystemsLean.LlvmTypesText"
def multFsDeepenExpectedNamespace : String := "SystemsLean.MultFsDeepen"
def hostPackageWriteExpectedNamespace : String := "SystemsLean.HostPackageWrite"
def hostPackageWriteTheoremsExpectedNamespace : String := "SystemsLean.HostPackageWrite"
def llvmProgramTextExpectedNamespace : String := "SystemsLean.LlvmProgramText"
def llvmGraphTextExpectedNamespace : String := "SystemsLean.LlvmGraphText"
def llvmComposeTextExpectedNamespace : String := "SystemsLean.LlvmComposeText"
def selfApplyFsExpectedNamespace : String := "SystemsLean.SelfApplyFs"
def inventoryCloseExpectedNamespace : String := "SystemsLean.InventoryClose"
def productPathBarsExpectedNamespace : String := "SystemsLean.ProductPath"
def productPathExpectedNamespace : String := "SystemsLean.ProductPath"
def dualResidualExpectedNamespace : String := "SystemsLean.DualResidual"
def dualResidualTheoremsExpectedNamespace : String := "SystemsLean.DualResidual"
def probeWireExpectedNamespace : String := "SystemsLean.ProbeWire"
def selfHostBodyExpectedNamespace : String := "SystemsLean.SelfHostBody"
def probeWireTheoremsExpectedNamespace : String := "SystemsLean.ProbeWire"
def selfHostBodyTheoremsExpectedNamespace : String := "SystemsLean.SelfHostBody"
def specProofExpectedNamespace : String := "SystemsLean.SpecProof"
def specProofTheoremsExpectedNamespace : String := "SystemsLean.SpecProof"

/-- Shared surface check: expected namespace + required decls + optional import.
    Greppable: checkNamedSurface. -/
def checkNamedSurface (surf : RealModuleSurface) (expectedNs : String)
    (required : List String) (needImport : Option String) :
    ModuleCheckResult :=
  match surf.namespaceName with
  | none => ModuleCheckResult.reject reasonMissingNamespace
  | some ns =>
    if ns != expectedNs then
      ModuleCheckResult.reject reasonMissingNamespace
    else
      match needImport with
      | some imp =>
        if !(surf.imports.any (fun i => i == imp)) then
          ModuleCheckResult.reject reasonMissingImport
        else if required.any (fun d => !(hasKey surf.keyDecls d)) then
          ModuleCheckResult.reject reasonMissingDecl
        else
          ModuleCheckResult.accept surf
      | none =>
        if required.any (fun d => !(hasKey surf.keyDecls d)) then
          ModuleCheckResult.reject reasonMissingDecl
        else
          ModuleCheckResult.accept surf

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveSurface
