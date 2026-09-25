/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TraitObjectVtable.lean bytes.
  Part 08 of the pinned source. Not occupancy name 50. Not mill 70.
  Greppable: liveTraitObjectVtableSourcePart08, PARSE-LIVE-TRAIT-OBJECT-VTABLE.
  Module: SystemsLean.HostFrontLiveTraitObjectVtableSource08
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTraitObjectVtable

/-- Dual-pinned live TraitObjectVtable.lean bytes, part 08.
    Greppable: liveTraitObjectVtableSourcePart08. -/
def liveTraitObjectVtableSourcePart08 : String := r#"  unless traitObjectVtableIrPackageOk do
    IO.eprintln s!"error: {stageId}: traitObjectVtableIrPackageOk false"
    throw (IO.userError "traitObjectVtableIrPackageOk false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / traitObjectVtableIrBasename
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl traitObjectVtableIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing vtable IR after write: {outLl}"
    throw (IO.userError "missing vtable IR")
  if written != traitObjectVtableIrPackage then
    IO.eprintln "error: vtable IR written content mismatch"
    throw (IO.userError "vtable IR mismatch")
  validateTraitObjectVtableIrPackage traitObjectVtableIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-TRAIT-OBJECT-VTABLE, HOST-TRAIT-OBJECT-FAT, TRAIT-OBJECT-VTABLE-IR"
  IO.println "  honesty: fixture path; production emit claimed false; not FullBackend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write fixture IR under repo root (default .) or check dest matches
    the Lean printer. Mode is write (default), check, or print (stdout IR).
    Greppable: traitObjectVtableMain. -/
def traitObjectVtableMain (args : List String) : IO UInt32 := do
  let rest := filterArgs args
  let root : System.FilePath :=
    match rest with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  let mode : String :=
    match rest with
    | _ :: m :: _ => m
    | _ => "write"
  try
    match mode with
    | "print" => do
      IO.print traitObjectVtableIrPackage
      pure 0
    | "check" => do
      traitObjectVtableLlvmCheck root
      pure 0
    | "write" => do
      traitObjectVtableLlvmWrite root
      traitObjectVtableLlvmCheck root
      pure 0
    | other => do
      IO.eprintln s!"error: {stageId}: unknown mode {other} (want write|check|print)"
      pure 1
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.TraitObjectVtable

/-- lean --run entry (no mill row, no lake exe). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.TraitObjectVtable.traitObjectVtableMain args

"#

end SystemsLean.HostFrontLiveTraitObjectVtable
