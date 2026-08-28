APPROVE WITH NITS

Grow HostImportGraphModel landed as named subset 22 of about 206. New probe
ElabMeetNamedHostImportGraphModelProbe.lean is 206 lines with isolation
#elabMeetNamedHostImportGraphModelSubsetProbe. Model wrappers grew the
existing Seeds walk to 305 (under about 780). No new Model walk file. Live
product HostImportGraphModel.lean (236, mtime Aug 11) was not planted with a
type error. Four theorems still use = true := by native_decide. ElabMeetCompile
stayed 916. ElabMeetSubset stayed 865 (under about 880). Pins unchanged.
TDD red then green is on disk. Verify-green lake from src/systems is exit 0.

## Blockers

None.

## Nits

1. AGENTS.md still says 13 of about 206. Allowed lag. This slice left that file
   alone on purpose.
2. Next-slice Mods brief line counts are one higher than live wc: probe 207 vs
   206, ElabMeetSubset 866 vs 865, ElabMeetCompile 917 vs 916. Use the live
   counts when Mods starts.

## Evidence

- Probe exists: src/systems/SystemsLean/ElabMeetNamedHostImportGraphModelProbe.lean
  (206). Isolation command at line 94 and invocation at line 199:
  #elabMeetNamedHostImportGraphModelSubsetProbe.
- Seeds walk: src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean
  (305). Ten Model wrappers start at findLiveHostImportGraphModelPath (line 198).
  ElabMeetNamedWalkHostImportGraphModel.lean does not exist.
  HostImportGraphModelTheorems.lean does not exist.
- Live product HostImportGraphModel.lean exists (236). No plantedTypeError in
  that file. Planting is only on a temp sidecar in the probe (line 116).
- Theorems in ElabMeetTheorems.lean 748-765, each
  = true := by native_decide:
  elabMeetDrivesNamedHostImportGraphModelSubset_true,
  elabMeetAcceptsGoodNamedHostImportGraphModelSubset_true,
  elabMeetRejectsBadNamedHostImportGraphModelSubset_true,
  elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset_true.
- ElabMeetCompile.lean 916 (not grown). ElabMeetSubset.lean 865 (not past 880).
  ElabMeet.lean 766. ElabMeetTheorems.lean 767. HostPackageWrite walk 622.
  HostTerm walk 841. NamedWalk 322. Tail 863. Later 785.
- Drive fold: probe lines 154-157 and 186 set
  drive = good && !badCompiled && isolation. ElabMeet.lean 739-742 folds the
  four Model Bools, including isolation
  elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset.
- Isolation vs twenty-first is real: distinct Seeds probe
  #elabMeetNamedHostImportGraphSeedsSubsetProbe, distinct Model probe token,
  notAliasOfTwentyFirst vs Seeds names and compile order, prior walker
  tryCompileNamedHostImportGraphSeedsSubset still required.
- HostImportGraph hub not opened. Living Open is Grow HostImportGraphMods.
  No leftover-walk Name invented.
- Pins: slakeOwnsPackageTypecheck false (ElabMeet.lean:432);
  elabMeetFullHostElaborateRemains false (ElabMeet.lean:436);
  hostResidualShrinkFullHostElaborateRemains false (HostResidualShrink.lean:227);
  llvmCfgFixtureDominanceClaimed false (LlvmCfgHonesty.lean:86);
  llvmMultSsaFullBackendClaimed false (LlvmMultSsa.lean:142);
  DualResidual residualFreeClaimed true (DualResidual.lean:227);
  SpecProof residualFreeClaimed false (SpecProof.lean:406);
  SpecProof proofCompleteClaimed true (SpecProof.lean:389).
- TDD: red log /tmp/grok-1000/grok-red-grow-hostimportgraphmodel-20260816.md.
  cwd /home/hunter/Projects/ai/iso/src/systems.
  Command: lake build SystemsLean.ElabMeetTheorems.
  Exit 1 at 2026-08-16T14:35:07Z. Fail: missing
  ElabMeetNamedHostImportGraphModelProbe.lean (bad import). Theorems existed
  first. Green same theorems: lake exit 0 at 2026-08-16T15:04:12Z.
  Reviewer verify-green only (not a new red): same lake command exit 0,
  31 jobs.

## May Grow HostImportGraphMods start?

yes

## Counts

blockers=0 nits=2
