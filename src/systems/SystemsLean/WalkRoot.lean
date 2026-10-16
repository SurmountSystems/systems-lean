/-
  Module: SystemsLean.WalkRoot
  --walk-root DIR is the module root for one --slake-check NAME.
  Dots in the name become directories. The last segment gets .lean.
  One process checks one file. This module does not collect the
  SystemsLean library and does not read the directory.
  Does not call Lean.Elab.processCommands.
  No SystemsLean import. slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.WalkRoot

def badNameChar (c : Char) : Bool :=
  c == '/' || c == '\\' || c == '\x00'

def fileOfParts (dir : System.FilePath) : List String -> System.FilePath
  | [] => dir / "missing.lean"
  | [stem] => dir / (stem ++ ".lean")
  | seg :: rest => fileOfParts (dir / seg) rest

/-- Directory after `--walk-root`. none if absent, empty, or another flag. -/
def walkRootFromArgs (args : List String) : Option System.FilePath :=
  match args.dropWhile (fun a => a != "--walk-root") with
  | "--walk-root" :: p :: _ =>
    if p.isEmpty || p.startsWith "--" then none
    else some (System.FilePath.mk p)
  | _ => none

/-- `Init.Core` under `root` is `root/Init/Core.lean`. none if the name could escape root. -/
def moduleFile (root : System.FilePath) (name : String) : Option System.FilePath :=
  if name.isEmpty || name.startsWith "." || name.endsWith "." then
    none
  else if name.any badNameChar then
    none
  else
    let parts := name.splitOn "."
    if parts.any (fun p => p.isEmpty || p == "." || p == "..") then
      none
    else
      some (fileOfParts root parts)

/-- Stat that one file. Does not walk the directory. -/
def resolveModule (root : System.FilePath) (name : String) :
    IO (Option System.FilePath) := do
  match moduleFile root name with
  | none => pure none
  | some p =>
    if <- p.pathExists then
      pure (some p)
    else
      pure none

end SystemsLean.WalkRoot
