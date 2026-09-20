/-
  SYSTEMS_LEAN_HOST -- first Slake-produced ELF (not mill leanc).
  Lean printer owns a tiny wrap IR that calls generator Compose SSA
  slake_compose_ssa_mint_status. lean --run writes wrap.ll, invokes
  clang (not leanc) to dest out/slake-produced-elf/slake-hello, then
  checks ELF magic and exit 0. Dest must not live under
  build/first-host-tool. No mill inventory row. No lake exe.
  Occupancy stays 49. FullHost stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not producing the 69 host tools.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-PRODUCED-ELF,
  SLAKE_PRODUCED_ELF_V0, slake-produced-elf, slakeProducedElfWrapIr,
  slake_compose_ssa_mint_status, first-host-tool, SKELETON.
  Module: SystemsLean.SlakeProducedElf
  Checkable writer: just slake-produced-elf (lean --run; no mill; no lake).
-/

namespace SystemsLean.SlakeProducedElf

/-- Greppable stage id. -/
def stageId : String := "SLAKE_PRODUCED_ELF_V0"

/-- Named just recipe (lean --run writer; not a mill inventory row). -/
def justRecipeSlakeProducedElf : String := "slake-produced-elf"

/-- Generator SSA unit already owned by Slake emit (not mill C). -/
def composeSsaRel : String := "out/llvm-ir/slake_compose_ssa.ll"

/-- Wrap IR dest (gitignored under out/slake-produced-elf). -/
def wrapRel : String := "out/slake-produced-elf/wrap.ll"

/-- Durable ELF dest. Not build/first-host-tool. -/
def destRel : String := "out/slake-produced-elf/slake-hello"

/-- Mill directory needle. Dest containing this is dishonest. -/
def millPathNeedle : String := "first-host-tool"

/-- leanc needle. This slice links with clang, not leanc. -/
def leancNeedle : String := "leanc"

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Dest path is a mill ELF (forbidden). -/
def isMillPath (p : String) : Bool :=
  containsSub p millPathNeedle || containsSub p leancNeedle

/-- ELF magic 0x7f 'E' 'L' 'F'. -/
def elfMagic : ByteArray := ByteArray.mk #[0x7f, 0x45, 0x4c, 0x46]

/-- Lean-owned wrap IR: main calls Compose SSA mint-status 0 and returns 0. -/
def slakeProducedElfWrapIr : String :=
  "; SLAKE_PRODUCED_ELF_V0 / HOST-SLAKE-PRODUCED-ELF\n" ++
  "; Lean-owned wrap. Calls generator Compose SSA. Not mill leanc.\n" ++
  "declare i32 @slake_compose_ssa_mint_status(i32)\n" ++
  "define i32 @main() {\n" ++
  "entry:\n" ++
  "  %code = call i32 @slake_compose_ssa_mint_status(i32 0)\n" ++
  "  %ok = icmp eq i32 %code, 0\n" ++
  "  br i1 %ok, label %okret, label %fail\n" ++
  "okret:\n" ++
  "  ret i32 0\n" ++
  "fail:\n" ++
  "  ret i32 1\n" ++
  "}\n"

/-- Fail closed if dest would be a mill ELF. -/
def rejectMillPath (label dest : String) : IO Unit := do
  if isMillPath dest then
    IO.eprintln s!"error: {label}: dest is a mill path (forbidden): {dest}"
    throw (IO.userError s!"{label}: mill dest")

/-- First four bytes equal ELF magic. -/
def isElfMagic (p : System.FilePath) : IO Bool := do
  let bytes <-
    try
      IO.FS.readBinFile p
    catch _ =>
      return false
  if bytes.size < 4 then
    return false
  pure (bytes.extract 0 4 == elfMagic)

/-- clang on PATH. Fail closed (not skip-GREEN). -/
def clangPresent : IO Bool := do
  try
    let r <- IO.Process.output { cmd := "clang", args := #["--version"] }
    pure (r.exitCode == 0)
  catch _ =>
    pure false

/-- Link wrap + Compose SSA with clang. Not leanc. -/
def clangLink (wrap unit dest : System.FilePath) : IO Unit := do
  unless (<- clangPresent) do
    IO.eprintln s!"error: {stageId}: clang not on PATH (fail closed; not mill leanc)"
    throw (IO.userError s!"{stageId}: clang missing")
  let r <- IO.Process.output {
    cmd := "clang"
    args := #[
      "-O0",
      "-Wno-override-module",
      "-o", dest.toString,
      wrap.toString,
      unit.toString
    ]
  }
  if r.exitCode != 0 then
    IO.eprintln r.stderr
    IO.eprintln s!"error: {stageId}: clang link failed ({r.exitCode})"
    throw (IO.userError s!"{stageId}: clang link")

/-- Run dest ELF. Expect exit 0. -/
def runDest (dest : System.FilePath) : IO Unit := do
  let r <- IO.Process.output { cmd := dest.toString, args := #[] }
  if r.exitCode != 0 then
    IO.eprintln s!"error: {stageId}: dest ELF exit {r.exitCode}"
    throw (IO.userError s!"{stageId}: dest run")

/-- Write wrap IR, clang-link dest ELF, check magic, run. -/
def slakeProducedElfWrite (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let wrap := root / wrapRel
  let unit := root / composeSsaRel
  rejectMillPath stageId dest.toString
  unless (<- unit.pathExists) do
    IO.eprintln s!"error: {stageId}: missing generator SSA {unit}"
    throw (IO.userError s!"{stageId}: missing compose SSA")
  if let some parent := wrap.parent then
    IO.FS.createDirAll parent
  IO.FS.writeFile wrap slakeProducedElfWrapIr
  let written <- IO.FS.readFile wrap
  if written != slakeProducedElfWrapIr then
    IO.eprintln s!"error: {stageId}: wrap write mismatch"
    throw (IO.userError s!"{stageId}: wrap mismatch")
  clangLink wrap unit dest
  unless (<- dest.pathExists) do
    IO.eprintln s!"error: {stageId}: missing dest ELF {dest}"
    throw (IO.userError s!"{stageId}: missing dest")
  unless (<- isElfMagic dest) do
    IO.eprintln s!"error: {stageId}: dest is not ELF magic: {dest}"
    throw (IO.userError s!"{stageId}: not ELF")
  runDest dest
  IO.println s!"GREEN {stageId}: wrote {dest}"
  IO.println "  greppable: HOST-SLAKE-PRODUCED-ELF, slake-produced-elf"
  IO.println "  honesty: clang-linked generator Compose SSA; not mill leanc; not mill 69 of 69"

/-- Check dest ELF exists, is not mill, wrap matches printer, ELF magic, run. -/
def slakeProducedElfCheck (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let wrap := root / wrapRel
  rejectMillPath stageId dest.toString
  unless (<- wrap.pathExists) do
    IO.eprintln s!"error: {stageId}: missing wrap IR {wrap}"
    throw (IO.userError s!"{stageId}: missing wrap")
  let got <- IO.FS.readFile wrap
  if got != slakeProducedElfWrapIr then
    IO.eprintln s!"error: {stageId}: wrap dest bytes differ from Lean printer"
    throw (IO.userError s!"{stageId}: wrap mismatch")
  unless (<- dest.pathExists) do
    IO.eprintln s!"error: {stageId}: missing dest ELF {dest}"
    throw (IO.userError s!"{stageId}: missing dest")
  unless (<- isElfMagic dest) do
    IO.eprintln s!"error: {stageId}: dest is not ELF magic: {dest}"
    throw (IO.userError s!"{stageId}: not ELF")
  runDest dest
  IO.println s!"GREEN {stageId}: check {dest}"
  IO.println "  honesty: not mill leanc; not FullHost; occupancy 49"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write dest ELF (default), check dest, or print wrap IR. -/
def slakeProducedElfMain (args : List String) : IO UInt32 := do
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
      IO.print slakeProducedElfWrapIr
      pure 0
    | "check" => do
      slakeProducedElfCheck root
      pure 0
    | "write" => do
      slakeProducedElfWrite root
      slakeProducedElfCheck root
      pure 0
    | other => do
      IO.eprintln s!"error: {stageId}: unknown mode {other} (want write|check|print)"
      pure 1
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.SlakeProducedElf

/-- lean --run entry (no mill row, no lake exe). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.SlakeProducedElf.slakeProducedElfMain args
