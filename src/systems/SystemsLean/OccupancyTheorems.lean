/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet native_decide theorems for the
  smaller HostModuleCheckParityProgramTerm isolation.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetTheorems so that file stays
  under the line cap. Same namespace SystemsLean.ElabMeet.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - native_decide theorems for smaller Program isolation drive Bools.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 50. Living tip stays 49 of about 206. This extract
    does not fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  ELAB-MEET-THEOREM, OccupancyTheorems,
  SystemsLean.OccupancyTheorems,
  theorem elabMeetDrivesNamedHostModuleCheckParityProgramTermSmallSubset_true,
  theorem elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSmallSubset_true,
  theorem elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSmallSubset_true,
  theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSmallSubset_true,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.OccupancyTheorems
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build
  SystemsLean.OccupancyTheorems;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
  Named subset: occupancy 49 (Mult plus MultTheorems, Types,
  TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems,
  IrProgram, IrProgramTheorems plus HostFront band plus HostGraph
  plus HostPackageWrite plus HostPackageWriteTheorems plus
  HostPackageRoots plus HostImportGraph closed band plus
  Program import closure plus Checkers through Kernel / Parity
  term-surface members plus ProgramTerm). Compile order 164
  (eight Proof extras plus seven MultTerm-layer unit Terms plus
  eight Emit*Scaffold Terms plus three Emit apply Term extras
  plus three Kernel compile Term extras plus three Join host
  Surface Term extras plus three Spec Dual CompilePathMult
  Term extras plus three CompilePath Linear Types Program
  Term extras plus three CompilePath Graph Compose Erasure
  Term extras plus three CompilePath Extract Plan Apply
  Term extras plus three CompilePath Body FirstSurface
  LinearSubsetEmit Term extras plus three Types Program
  Graph SubsetEmit Term extras plus three Compose Erasure
  Extract SubsetEmit Term extras plus three Mult Rebuild
  Linear Rebuild Term extras plus three Types Program
  Graph Rebuild Term extras plus three Compose Erasure
  Extract Rebuild Term extras plus three Host Front Llvm
  Mult Host Check Term extras plus three Host Graph Llvm
  Linear Mult Fs Write Term extras plus three Front Mult
  Subset Join Llvm Types Term extras plus three Mult Fs
  Deepen Host Package Llvm Program Term extras plus three
  Llvm Graph Compose Self Apply Term extras plus three
  Inventory Close Product Path Term extras plus two
  Probe Wire Self Host Body Term extras plus the one
  LoadOkCompilePathUnits occupancy extra
  on compile order only plus the one LoadOkLaterTerm occupancy
  extra on compile order only after ParityProgramTerm plus
  the one AcceptsGoodsTerm occupancy extra on compile order
  only after LoadOkLaterTerm;
  names stay 49).
  Not the 49-set. HostFront is in. HostPackageRoots is in.
  Import-graph is in. HostPackageWrite is in. RealModule stays
  out. Not full-package typecheck. leakEnv stays false.
  Do not skip to HostModuleCheckParityEmitTerm.
-/

import Lean
import SystemsLean.OccupancyProbe

namespace SystemsLean.ElabMeet

/-- Drive fold for the smaller HostModuleCheckParityProgramTerm isolation.
    Greppable: elabMeetDrivesNamedHostModuleCheckParityProgramTermSmallSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckParityProgramTermSmallSubset_true :
    elabMeetDrivesNamedHostModuleCheckParityProgramTermSmallSubset = true := by
  native_decide

/-- Good path typechecks Mult plus Program's HostModuleCheck import
    closure plus Checkers through Kernel / Parity occupancy members
    plus HostModuleCheckParityProgramTerm. -/
theorem elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSmallSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSmallSubset =
      true := by
  native_decide

/-- Bad path is a planted type error on a HostModuleCheckParityProgramTerm copy. -/
theorem elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSmallSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSmallSubset =
      true := by
  native_decide

/-- Isolation: leftover temp good.lean, leftover fake package
    lean_lib ElabMeetRichLib, live Mult still compiles, and this list
    is not the 49-set (names length 49, HostFront is in, HostPackageRoots
    is in, import-graph is in, HostPackageWrite is in, RealModule
    stays out). -/
theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSmallSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSmallSubset =
      true := by
  native_decide

end SystemsLean.ElabMeet
