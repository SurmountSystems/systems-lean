# Grow IrProgram subset -- docs lockstep

Name 135 is closed. Named closed subset typechecks **9 of about 206**
live modules (Mult, Types, MultTheorems, TypesTheorems, Erasure,
ErasureTheorems, Extract, ExtractTheorems, IrProgram).

Product: leftover three-through-eight wrappers moved to
ElabMeetNamedWalkLater (namespace SystemsLean.ElabMeet). Lake
ElabMeetTheorems green (exit 0). TDD: four theorems first (red lake
EXIT 1 free variables), then extract, then impl, then green. Theorems
not rewritten.

Line counts after land: ElabMeetSubset 878; ElabMeetNamedWalk 322;
ElabMeetNamedWalkLater 776; ElabMeet 643; ElabMeetTheorems 486;
ElabMeetCompile 916 (unchanged).

Pins stay put. Next: Grow IrProgramTheorems subset. Extract first if
adding a wrapper would pass about 880 on Subset (878, about 988) or
Later (776, about 886). NamedWalk is 322. Inventory first. Do not
invent a leftover-walk Name. Do not open Linear.
