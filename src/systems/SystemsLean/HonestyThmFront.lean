/-
  Module: SystemsLean.HonestyThmFront
  Front for an honesty import plus `theorem` and `example`
  of the form `lhs = rhs := by decide`.
  The import seeds the Bool and String defs HonestyFront parsed
  for SystemsLean.BootstrapHonesty. decide holds only when both
  sides reduce to the same value. A decide of false is a def
  with no type, which the kernel rejects. There is no passing
  command for a decide that was not reduced.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HonestyDecide
import SystemsLean.HonestyFront
import SystemsLean.HostKernelReduce

namespace SystemsLean.HonestyThmFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyFront
open SystemsLean.HonestyDecide

def honestyImport : String := "SystemsLean.BootstrapHonesty"

/-- Source HonestyFront already accepts. The checker reads one file,
    so the import carries this text. A drifted literal decides false. -/
def bootstrapHonestySource : String :=
  "/-\n" ++
  "  SystemsLean.BootstrapHonesty stores product-path host bootstrap\n" ++
  "  cite strings and three Bools. productPathHostLakeBootstrapRemains\n" ++
  "  is the constant true. productPathBootstrapSurfaceOk is true when\n" ++
  "  each string def equals the literal written in this file and remains\n" ++
  "  is true. productPathHostLakeBootstrapPartialReady is remains and\n" ++
  "  surfaceOk. This file has no theorem, no main, and no import. It\n" ++
  "  does not check that Lake ran.\n" ++
  "-/\n" ++
  "\n" ++
  "namespace SystemsLean.BootstrapHonesty\n" ++
  "\n" ++
  "/-- Stage id string. -/\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0\"\n" ++
  "\n" ++
  "/-- Host map id string. -/\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP\"\n" ++
  "\n" ++
  "/-- Short map id string. -/\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-PATH-BOOTSTRAP\"\n" ++
  "\n" ++
  "/-- Module cite string. The value is the basename, not a dotted module path. -/\n" ++
  "def bootstrapHonestyModuleCite : String := \"BootstrapHonesty\"\n" ++
  "\n" ++
  "/-- Output directory path string. -/\n" ++
  "def productOutPath : String := \"out/freestanding-c/\"\n" ++
  "\n" ++
  "/-- Path string for FreestandingEmit.lean. This file does not import it. -/\n" ++
  "def hostLakeEmitWriterPath : String := \"src/systems/SystemsLean/FreestandingEmit.lean\"\n" ++
  "\n" ++
  "/-- Executable name string. This file does not check that the executable exists. -/\n" ++
  "def hostLakeEmitExe : String := \"slake-emit-freestanding-c\"\n" ++
  "\n" ++
  "/-- Emit stage id string. -/\n" ++
  "def hostLakeEmitStageCite : String := \"SLAKE_EMIT_FREESTANDING_C_V0\"\n" ++
  "\n" ++
  "/-- Path string for self-host.md. This file does not check that file. -/\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "\n" ++
  "/-- Bool constant true. This file does not check that Lake bootstraps a writer. -/\n" ++
  "def productPathHostLakeBootstrapRemains : Bool := true\n" ++
  "\n" ++
  "/-- True when each string def equals the literal in this def and remains is true.\n" ++
  "    This file does not define perform, ownership, or complete. -/\n" ++
  "def productPathBootstrapSurfaceOk : Bool :=\n" ++
  "  (stageId == \"SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0\")\n" ++
  "    && (hostId == \"HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP\")\n" ++
  "    && (selfHostId == \"SELF-HOST-PRODUCT-PATH-BOOTSTRAP\")\n" ++
  "    && (bootstrapHonestyModuleCite == \"BootstrapHonesty\")\n" ++
  "    && (hostLakeEmitWriterPath == \"src/systems/SystemsLean/FreestandingEmit.lean\")\n" ++
  "    && (hostLakeEmitExe == \"slake-emit-freestanding-c\")\n" ++
  "    && (hostLakeEmitStageCite == \"SLAKE_EMIT_FREESTANDING_C_V0\")\n" ++
  "    && (productOutPath == \"out/freestanding-c/\")\n" ++
  "    && productPathHostLakeBootstrapRemains\n" ++
  "    && (acceptancePath == \"src/systems/self-host.md\")\n" ++
  "\n" ++
  "/-- True when remains and surfaceOk are both true. -/\n" ++
  "def productPathHostLakeBootstrapPartialReady : Bool :=\n" ++
  "  productPathHostLakeBootstrapRemains\n" ++
  "    && productPathBootstrapSurfaceOk\n" ++
  "\n" ++
  "end SystemsLean.BootstrapHonesty\n" ++
  "\n" ++
  "-- This file defines no main.\n"

inductive ThmMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

def thmEmitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def thmEmitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Tokens for `=`, `:=`, and a lone `:`. A lone `&` is none. Strings stay intact. -/
def thmTok : List Char -> ThmMode -> List String -> Option (List String)
  | [], ThmMode.norm, acc => some acc.reverse
  | [], ThmMode.id cur, acc => some (thmEmitId acc cur).reverse
  | [], ThmMode.str _, _ => none
  | '"' :: rest, ThmMode.str cur, acc =>
    thmTok rest ThmMode.norm (thmEmitStr acc cur)
  | c :: rest, ThmMode.str cur, acc =>
    thmTok rest (ThmMode.str (c :: cur)) acc
  | ':' :: '=' :: rest, ThmMode.norm, acc =>
    thmTok rest ThmMode.norm (":=" :: acc)
  | ':' :: rest, ThmMode.norm, acc =>
    thmTok rest ThmMode.norm (":" :: acc)
  | '=' :: rest, ThmMode.norm, acc =>
    thmTok rest ThmMode.norm ("=" :: acc)
  | '.' :: rest, ThmMode.norm, acc =>
    thmTok rest ThmMode.norm ("." :: acc)
  | '"' :: rest, ThmMode.norm, acc =>
    thmTok rest (ThmMode.str []) acc
  | c :: rest, ThmMode.norm, acc =>
    if isWs c then thmTok rest ThmMode.norm acc
    else if isLetter c || c == '_' then
      thmTok rest (ThmMode.id [c]) acc
    else
      none
  | ':' :: '=' :: rest, ThmMode.id cur, acc =>
    thmTok rest ThmMode.norm (":=" :: thmEmitId acc cur)
  | ':' :: rest, ThmMode.id cur, acc =>
    thmTok rest ThmMode.norm (":" :: thmEmitId acc cur)
  | '=' :: rest, ThmMode.id cur, acc =>
    thmTok rest ThmMode.norm ("=" :: thmEmitId acc cur)
  | '.' :: rest, ThmMode.id cur, acc =>
    thmTok rest ThmMode.norm ("." :: thmEmitId acc cur)
  | c :: rest, ThmMode.id cur, acc =>
    if isIdentChar c then
      thmTok rest (ThmMode.id (c :: cur)) acc
    else if isWs c then
      thmTok rest ThmMode.norm (thmEmitId acc cur)
    else
      none

def defCmds : List Cmd -> List Cmd
  | [] => []
  | Cmd.def_ name ty body :: rest =>
    Cmd.def_ name ty body :: defCmds rest
  | _ :: rest => defCmds rest

def envOf : List Cmd -> DefEnv
  | [] => []
  | Cmd.def_ name (some _) body :: rest =>
    (name.raw, { binder := defBinder body, body := body }) :: envOf rest
  | _ :: rest => envOf rest

/-- Passing decide is a Bool def of the reduced true.
    A false decide has no type, so the kernel rejects that name. -/
def emitDecide (nm : String) (defs : DefEnv) (lhs rhs : Term) : Cmd :=
  if decideHolds defs lhs rhs then
    Cmd.def_ (n nm) (some HostType.bool) (Term.litBool true)
  else
    Cmd.def_ (n nm) none (Term.litBool true)

def parseSide (ts : List String) : Option (Prod Term (List String)) :=
  match ts with
  | "true" :: rest => some (Term.litBool true, rest)
  | "false" :: rest => some (Term.litBool false, rest)
  | lit :: rest =>
    match unquote lit with
    | some s => some (Term.litString s, rest)
    | none =>
      if isIdent lit then some (Term.var (n lit), rest) else none
  | [] => none

def parseDecide (defs : DefEnv) (nm : String) (ts : List String) :
    Option (Prod Cmd (List String)) :=
  match parseSide ts with
  | some (lhs, "=" :: rest) =>
    match parseSide rest with
    | some (rhs, ":=" :: "by" :: "decide" :: rest2) =>
      some (emitDecide nm defs lhs rhs, rest2)
    | _ => none
  | _ => none

def parseItems (fuel : Nat) (defs : DefEnv) (acc : List Cmd)
    (ts : List String) : Option (Prod (List Cmd) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "theorem" :: name :: ":" :: rest =>
      if isIdent name then
        match parseDecide defs name rest with
        | some (cmd, rest2) => parseItems k defs (cmd :: acc) rest2
        | none => none
      else
        none
    | "example" :: ":" :: rest =>
      match parseDecide defs "example" rest with
      | some (cmd, rest2) => parseItems k defs (cmd :: acc) rest2
      | none => none
    | "end" :: _ => some (acc.reverse, ts)
    | _ => none
termination_by fuel

def thmFinish (ns : String) (seeded : List Cmd) (thms : List Cmd)
    (ts : List String) : Option Module :=
  if thms.isEmpty || seeded.isEmpty then
    none
  else
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && rest2.isEmpty then
          let cmds :=
            [Cmd.namespace (n ns), Cmd.importModule (n honestyImport)]
            ++ seeded ++ thms ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none
        else
          none
      | none => none
    | _ => none

def seedOf : Option (Prod DefEnv (List Cmd)) :=
  match parseHonestyText bootstrapHonestySource with
  | none => none
  | some m =>
    let cmds := defCmds m.commands
    if cmds.isEmpty then none else some (envOf cmds, cmds)

/-- Parse this surface. none means not this front. -/
def parseHonestyThmText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match thmTok kept ThmMode.norm [] with
    | none => none
    | some ts =>
      match ts with
      | "import" :: rest =>
        match parseDotted parseFuel rest with
        | some (imp, rest2) =>
          if imp == honestyImport then
            match seedOf with
            | none => none
            | some (defs, seeded) =>
              match rest2 with
              | "namespace" :: rest3 =>
                match parseDotted parseFuel rest3 with
                | some (ns, rest4) =>
                  match parseItems parseFuel defs [] rest4 with
                  | some (thms, rest5) => thmFinish ns seeded thms rest5
                  | none => none
                | none => none
              | _ => none
          else
            none
        | none => none
      | _ => none

def cmdRejects (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ none _ => true
  | _ => false

def thmToy : String :=
  "import SystemsLean.BootstrapHonesty\n" ++
  "namespace SystemsLean.BootstrapHonesty\n" ++
  "theorem productPathHostLakeBootstrapRemains_true :\n" ++
  "    productPathHostLakeBootstrapRemains = true := by\n" ++
  "  decide\n" ++
  "example : stageId = \"SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0\" := by\n" ++
  "  decide\n" ++
  "end SystemsLean.BootstrapHonesty\n"

def thmToyAccepts : Bool :=
  match parseHonestyThmText thmToy with
  | some m => !m.commands.any cmdRejects
  | none => false

def thmFalseToy : String :=
  "import SystemsLean.BootstrapHonesty\n" ++
  "namespace SystemsLean.BootstrapHonesty\n" ++
  "theorem productPathHostLakeBootstrapRemains_true :\n" ++
  "    productPathHostLakeBootstrapRemains = false := by\n" ++
  "  decide\n" ++
  "end SystemsLean.BootstrapHonesty\n"

/-- A decide of false is not accepted. The kernel sees a typeless def. -/
def thmFalseRejects : Bool :=
  match parseHonestyThmText thmFalseToy with
  | some m => m.commands.any cmdRejects
  | none => false

def thmWrongToy : String :=
  "import SystemsLean.BootstrapHonesty\n" ++
  "namespace SystemsLean.BootstrapHonesty\n" ++
  "example : stageId = \"NOPE\" := by\n" ++
  "  decide\n" ++
  "end SystemsLean.BootstrapHonesty\n"

def thmWrongStringRejects : Bool :=
  match parseHonestyThmText thmWrongToy with
  | some m => m.commands.any cmdRejects
  | none => false

end SystemsLean.HonestyThmFront
