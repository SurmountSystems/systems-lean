/-
SPDX-License-Identifier: Unlicense

Compare one `--slake-check` script log to a baseline.
The script end line is `WALK_DONE names=N pass=P fail=F`.
`main` reads that file. With `--wait` it polls until that line, or until
`STOP` or `SCRIPT_END`, and prints one result line.
`main --checks NAMESFILE` keeps `concurrentChecks` module checks in flight.
That constant is 32. A finish starts the next unstarted name immediately.
No flag lowers 32. Elaborating this file does not spawn those checks.
-/

namespace SlakeCheckLogCompare

structure CheckTotals where
  names : Nat
  pass : Nat
  fail : Nat
  deriving Repr, DecidableEq

structure CompareResult where
  finished : Bool
  stopped : Bool
  totals : Option CheckTotals
  baseNames : Nat
  basePass : Nat
  baseFail : Nat
  passDelta : Option Int
  failDelta : Option Int
  arithmeticOk : Bool
  deriving Repr

def parseKV (tok : String) : Option (String × String) :=
  match String.splitOn tok "=" with
  | [k, v] => some (k, v)
  | _ => none

def parseWalkDoneLine (line : String) : Option CheckTotals :=
  if !String.startsWith line "WALK_DONE " then
    none
  else
    let rec take (toks : List String) (names pass fail : Option Nat) : Option CheckTotals :=
      match toks with
      | [] =>
        match names, pass, fail with
        | some n, some p, some f => some { names := n, pass := p, fail := f }
        | _, _, _ => none
      | tok :: rest =>
        match parseKV tok with
        | some (k, v) =>
          match String.toNat? v with
          | some n =>
            if k == "names" then take rest (some n) pass fail
            else if k == "pass" then take rest names (some n) fail
            else if k == "fail" then take rest names pass (some n)
            else take rest names pass fail
          | none => take rest names pass fail
        | none => take rest names pass fail
    take (String.splitOn (String.drop line 10).copy " ") none none none

def findWalkDone (log : String) : Option CheckTotals :=
  (String.splitOn log "\n").foldl (fun acc line => acc <|> parseWalkDoneLine line) none

def hasStop (log : String) : Bool :=
  (String.splitOn log "\n").any fun line =>
    String.startsWith line "STOP " || line == "STOP" ||
      String.startsWith line "SCRIPT_END " || line == "SCRIPT_END"

def compareLog (log : String) (baseNames basePass baseFail : Nat) : CompareResult :=
  match findWalkDone log with
  | some t =>
    { finished := true
      stopped := false
      totals := some t
      baseNames
      basePass
      baseFail
      passDelta := some ((t.pass : Int) - (basePass : Int))
      failDelta := some ((t.fail : Int) - (baseFail : Int))
      arithmeticOk := t.pass + t.fail == t.names }
  | none =>
    { finished := false
      stopped := hasStop log
      totals := none
      baseNames
      basePass
      baseFail
      passDelta := none
      failDelta := none
      arithmeticOk := false }

def render (r : CompareResult) : String :=
  match r.totals with
  | some t =>
    let pd := r.passDelta.getD 0
    let fd := r.failDelta.getD 0
    s!"DONE WALK_DONE names={t.names} pass={t.pass} fail={t.fail} versus_names={r.baseNames} versus_pass={r.basePass} versus_fail={r.baseFail} pass_delta={pd} fail_delta={fd} arithmetic={t.pass}+{t.fail}={t.pass + t.fail} arithmetic_ok={r.arithmeticOk}"
  | none =>
    if r.stopped then "FAILED" else "UNFINISHED"

def baselineNames : Nat := 2801
def baselinePass : Nat := 2754
def baselineFail : Nat := 47

#guard parseWalkDoneLine "WALK_DONE names=2801 pass=2754 fail=47" ==
  some { names := 2801, pass := 2754, fail := 47 }

#guard (compareLog "RESULT=pass Foo\nWALK_DONE names=2801 pass=2754 fail=47\nSCRIPT_END 2026-10-25T22:02:12Z\n"
    baselineNames baselinePass baselineFail).passDelta == some 0

#guard (compareLog "RESULT=pass Foo\nWALK_DONE names=2801 pass=2754 fail=47\nSCRIPT_END 2026-10-25T22:02:12Z\n"
    baselineNames baselinePass baselineFail).failDelta == some 0

#guard (compareLog "RESULT=pass Foo\nWALK_DONE names=2801 pass=2754 fail=47\nSCRIPT_END 2026-10-25T22:02:12Z\n"
    baselineNames baselinePass baselineFail).arithmeticOk

#guard (compareLog "RESULT=pass Foo\n" baselineNames baselinePass baselineFail).finished == false

#guard (compareLog "STOP names=2801\n" baselineNames baselinePass baselineFail).stopped

/-- How many module checks stay in flight. Not a command-line argument. -/
def concurrentChecks : Nat := 32

/-- One scheduler event. `start` and `finish` carry a 0-based name index. -/
inductive PoolEvent where
  | start (nameIndex : Nat)
  | finish (nameIndex : Nat)
  deriving Repr, DecidableEq, BEq

def hasNat : List Nat → Nat → Bool
  | [], _ => false
  | y :: rest, n => y == n || hasNat rest n

def removeNat : List Nat → Nat → List Nat
  | [], _ => []
  | y :: rest, n => if y == n then removeNat rest n else y :: removeNat rest n

/-- Event trace for `names` given the order in which name indices finish.
    The first `concurrentChecks` names start immediately. After each finish,
    the next unstarted name starts before another finish is required.
    A finish index that is not in flight is ignored. -/
def schedulePool (names : List String) (finishOrder : List Nat) : List PoolEvent :=
  let nameCount := names.length
  let initial := if decide (nameCount < concurrentChecks) then nameCount else concurrentChecks
  let rec go (next : Nat) (inFlight : List Nat) (finishes : List Nat) : List PoolEvent :=
    match finishes with
    | [] => []
    | f :: rest =>
      if hasNat inFlight f then
        let still := removeNat inFlight f
        if decide (next < nameCount) then
          .finish f :: .start next :: go (next + 1) (still ++ [next]) rest
        else
          .finish f :: go next still rest
      else
        go next inFlight rest
  (List.range initial).map (fun i => .start i) ++ go initial (List.range initial) finishOrder

/-- Names in the order `schedulePool` starts them. -/
def poolStartOrder (names : List String) (finishOrder : List Nat) : List String :=
  let rec nameAt : List String → Nat → Option String
    | [], _ => none
    | n :: _, 0 => some n
    | _ :: rest, Nat.succ j => nameAt rest j
  let rec go : List PoolEvent → List String
    | [] => []
    | .finish _ :: rest => go rest
    | .start i :: rest =>
      match nameAt names i with
      | some n => n :: go rest
      | none => go rest
  go (schedulePool names finishOrder)

def moduleNameAt (i : Nat) : String :=
  "M" ++ toString i

def moduleNames (n : Nat) : List String :=
  (List.range n).map moduleNameAt

/-- In-flight count after every prefix is at most `cap`. -/
def inFlightNeverExceeds (cap : Nat) (events : List PoolEvent) : Bool :=
  let rec go (n : Nat) : List PoolEvent → Bool
    | [] => true
    | .start _ :: rest =>
      let n' := n + 1
      if decide (n' > cap) then false else go n' rest
    | .finish _ :: rest =>
      if n == 0 then false else go (n - 1) rest
  go 0 events

/-- While a name is still unstarted, the event after a finish is a start.
    A group barrier (finish, then another finish, before the next start) is false. -/
def refillBeforeNextFinish (nameCount : Nat) (events : List PoolEvent) : Bool :=
  let rec go (starts : Nat) : List PoolEvent → Bool
    | [] => true
    | .start _ :: rest => go (starts + 1) rest
    | .finish _ :: rest =>
      if decide (starts < nameCount) then
        match rest with
        | .start _ :: _ => go starts rest
        | _ => false
      else
        go starts rest
  go 0 events

/-- Item 33 (index 32) starts on the first finish.
    Thirty-two names have already started and this is the first finish,
    so 31 of that first window are still in flight. -/
def index32StartsOnFirstFinish (events : List PoolEvent) : Bool :=
  let rec go (starts : Nat) (finishes : Nat) : List PoolEvent → Bool
    | [] => false
    | .finish _ :: .start 32 :: _ => starts == 32 && finishes == 0
    | .finish _ :: _ => false
    | .start _ :: rest => go (starts + 1) finishes rest
  go 0 0 events

def startedIndices : List PoolEvent → List Nat
  | [] => []
  | .start i :: rest => i :: startedIndices rest
  | .finish _ :: rest => startedIndices rest

/-- Start a group of 32, finish that whole group, and only then start the next name. -/
def batchBarrierTrace : List PoolEvent :=
  (List.range concurrentChecks).map (fun i => .start i)
    ++ (List.range concurrentChecks).map (fun i => .finish i)
    ++ [.start concurrentChecks]

#guard concurrentChecks == 32

#guard inFlightNeverExceeds concurrentChecks (schedulePool (moduleNames 40) [0, 1, 2])

#guard refillBeforeNextFinish 40 (schedulePool (moduleNames 40) [0, 1, 2])

#guard index32StartsOnFirstFinish (schedulePool (moduleNames 40) [0])

#guard refillBeforeNextFinish (concurrentChecks + 8) batchBarrierTrace == false

#guard startedIndices (schedulePool (moduleNames 40) []) == List.range concurrentChecks

#guard poolStartOrder (moduleNames 40) [0] == (List.range 33).map moduleNameAt

def passedFromStdout (name stdout : String) : Bool :=
  let rec go (seen : Bool) : List String → Bool
    | [] => seen
    | line :: rest =>
      let t := line.trimAscii.copy
      if t == s!"RESULT=pass {name}" then go true rest
      else if t == s!"RESULT=fail {name}" then go false rest
      else go seen rest
  go false (String.splitOn stdout "\n")

#guard passedFromStdout "Foo" "RESULT=pass Foo\n"

#guard passedFromStdout "Foo" "RESULT=fail Foo\n" == false

#guard passedFromStdout "Foo" "noise\n" == false

inductive PoolStep where
  | start (i : Nat)
  | finish (i : Nat)
  deriving Repr, DecidableEq, BEq

def poolTrace (count : Nat) : List PoolStep :=
  let rec go (next live : Nat) (queue : List Nat) (acc : List PoolStep) : List PoolStep :=
    if live < concurrentChecks && next < count then
      go (next + 1) (live + 1) (queue ++ [next]) (acc ++ [.start next])
    else
      match queue with
      | [] => acc
      | finished :: rest =>
        let acc := acc ++ [.finish finished]
        if next < count then
          go (next + 1) live (rest ++ [next]) (acc ++ [.start next])
        else
          go next (live - 1) rest acc
  go 0 0 [] []

def maxInFlight (trace : List PoolStep) : Nat :=
  let rec go (live max : Nat) : List PoolStep → Nat
    | [] => max
    | .start _ :: t => go (live + 1) (Nat.max max (live + 1)) t
    | .finish _ :: t => go (live - 1) max t
  go 0 0 trace

#guard (poolTrace 40)[32]? == some (.finish 0)
#guard (poolTrace 40)[33]? == some (.start 32)
#guard maxInFlight (poolTrace 40) == 32
#guard maxInFlight (poolTrace 32) == 32
#guard maxInFlight (poolTrace 10) == 10

def checkElf : String :=
  "/nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap"

def checkEnv : Array (String × Option String) := #[
  ("LEAN_NUM_THREADS", some "1"),
  ("LEAN_SYSROOT", some "/nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0"),
  ("SLAKE_OLEAN_DIR", some "/home/nixbuilder/iso/build/package-typecheck"),
  ("SLAKE_SYSTEMS_ROOT", some "/home/nixbuilder/iso/src/systems"),
  ("LD_LIBRARY_PATH", some "/nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/lib/lean"),
  ("LD_PRELOAD", some "/nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/lib/lean/libleanshared.so")
]

abbrev Slot := Task (String × Except IO.Error Bool)

def startSlot (name : String) : IO Slot := do
  let task ← IO.asTask (prio := Task.Priority.dedicated) do
    let out ← IO.Process.output {
      cmd := "/run/current-system/sw/bin/nice"
      args := #[ "-n", "19", checkElf, "--slake-check", name ]
      cwd := some "/home/nixbuilder/iso"
      env := checkEnv
    }
    return out.exitCode == 0
  return task.map (sync := true) fun
    | Except.ok ok => (name, Except.ok ok)
    | Except.error err => (name, Except.error err)

partial def fill (pending : List String) (live : List Slot) : IO (List String × List Slot) := do
  if live.length >= concurrentChecks then
    return (pending, live)
  else
    match pending with
    | [] => return ([], live)
    | name :: rest =>
      let slot ← startSlot name
      fill rest (live ++ [slot])

partial def drain (pending : List String) (live : List Slot) (pass fail : Nat) : IO (Nat × Nat) := do
  let (pending, live) ← fill pending live
  match live with
  | [] => return (pass, fail)
  | head :: tail =>
    let ((_, result), rest) ← IO.waitAny' (head :: tail) (Nat.succ_pos _)
    match result with
    | Except.ok true => drain pending rest (pass + 1) fail
    | _ => drain pending rest pass (fail + 1)

def runChecks (namesPath : System.FilePath) : IO UInt32 := do
  let text ← IO.FS.readFile namesPath
  let names := (String.splitOn text "\n").filter fun line => line != ""
  let (pass, fail) ← drain names [] 0 0
  let line := s!"WALK_DONE names={names.length} pass={pass} fail={fail}"
  IO.println (render (compareLog line baselineNames baselinePass baselineFail))
  return 0

structure Args where
  path : System.FilePath
  wait : Bool
  baseNames : Nat
  basePass : Nat
  baseFail : Nat

def usage : String :=
  "SlakeCheckLogCompare PATH [--wait] [--baseline-names N] [--baseline-pass N] [--baseline-fail N]\nSlakeCheckLogCompare --checks NAMESFILE"

def parseArgs (args : List String) : Except String Args :=
  match args with
  | [] => Except.error usage
  | path :: rest => go { path := path, wait := false, baseNames := baselineNames, basePass := baselinePass, baseFail := baselineFail } rest
where
  go (a : Args) : List String → Except String Args
    | [] => Except.ok a
    | "--wait" :: xs => go { a with wait := true } xs
    | "--baseline-names" :: n :: xs =>
      match String.toNat? n with
      | some k => go { a with baseNames := k } xs
      | none => Except.error usage
    | "--baseline-pass" :: n :: xs =>
      match String.toNat? n with
      | some k => go { a with basePass := k } xs
      | none => Except.error usage
    | "--baseline-fail" :: n :: xs =>
      match String.toNat? n with
      | some k => go { a with baseFail := k } xs
      | none => Except.error usage
    | _ => Except.error usage

partial def poll (a : Args) : IO UInt32 := do
  let text ← IO.FS.readFile a.path
  let result := compareLog text a.baseNames a.basePass a.baseFail
  if result.finished then
    IO.println (render result)
    return 0
  else if result.stopped then
    IO.println (render result)
    return 1
  else if a.wait then
    IO.sleep 30000
    poll a
  else
    IO.println (render result)
    return 2

/-- Expected byte count of the bootstrap ELF. This file does not measure it. -/
def slakeBootstrapBytes : Nat := 149268952

def slakeBootstrapElf : String :=
  "/nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap"

def checkCwd : System.FilePath :=
  "/home/nixbuilder/iso"

def leanSysroot : String :=
  "/nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0"

def niceBin : String :=
  "/run/current-system/sw/bin/nice"

#guard slakeBootstrapBytes == 149268952

/-- One child is one Lean thread. Thirty-two children are thirty-two threads, not 32 times 32. -/
def moduleCheckArgv (name : String) : Array String :=
  #[
    "-n", "19", "env",
    "LEAN_NUM_THREADS=1",
    s!"LEAN_SYSROOT={leanSysroot}",
    "SLAKE_OLEAN_DIR=/home/nixbuilder/iso/build/package-typecheck",
    "SLAKE_SYSTEMS_ROOT=/home/nixbuilder/iso/src/systems",
    s!"LD_LIBRARY_PATH={leanSysroot}/lib/lean",
    s!"LD_PRELOAD={leanSysroot}/lib/lean/libleanshared.so",
    slakeBootstrapElf,
    "--slake-check",
    name
  ]

abbrev checkStdio : IO.Process.StdioConfig :=
  { stdin := .null, stdout := .piped, stderr := .null }

structure ModuleCheckDone where
  index : Nat
  name : String
  passed : Bool
  exitCode : UInt32

structure Flight where
  index : Nat
  name : String
  child : IO.Process.Child checkStdio
  task : Task (Except IO.Error ModuleCheckDone)

def nonemptyLines : List String → List String
  | [] => []
  | line :: rest =>
    let t := line.trimAscii.copy
    if t == "" then nonemptyLines rest else t :: nonemptyLines rest

def enumerate (names : List String) : List (Nat × String) :=
  let rec go (i : Nat) : List String → List (Nat × String)
    | [] => []
    | n :: rest => (i, n) :: go (i + 1) rest
  go 0 names

def spawnModuleCheck (index : Nat) (name : String) : IO Flight := do
  let child ← IO.Process.spawn {
    cmd := niceBin
    args := moduleCheckArgv name
    cwd := some checkCwd
    stdin := .null
    stdout := .piped
    stderr := .null
    inheritEnv := true
  }
  let act : IO ModuleCheckDone := do
    let stdoutTask ← IO.asTask child.stdout.readToEnd Task.Priority.dedicated
    let code ← child.wait
    let _stdout ← IO.ofExcept stdoutTask.get
    -- The ELF returns 0 and does not print RESULT=pass.
    return {
      index
      name
      passed := code == 0
      exitCode := code
    }
  let task ← IO.asTask act Task.Priority.dedicated
  return { index, name, child, task }

/-- Wait until one in-flight child exits. The proof is `List.length` of a cons. -/
def waitFirst (flight : List Flight) : IO (ModuleCheckDone × List Flight) := do
  match flight with
  | [] => throw <| IO.userError "pool wait with nothing in flight"
  | slot :: rest =>
    have hlen : 0 < (slot.task :: rest.map (fun item => item.task)).length := by
      rw [List.length_cons]
      apply Nat.zero_lt_succ
    let (result, _) ← IO.waitAny' (slot.task :: rest.map (fun item => item.task)) hlen
    match result with
    | .error err => throw err
    | .ok done =>
      let remaining := flight.filter (fun item => item.index != done.index)
      return (done, remaining)

def main (args : List String) : IO UInt32 := do
  match args with
  | "--checks" :: path :: _ =>
    runChecks path
  | _ =>
    match parseArgs args with
    | Except.error msg =>
      IO.eprintln msg
      return 2
    | Except.ok a =>
      poll a

end SlakeCheckLogCompare

def main (args : List String) : IO UInt32 :=
  SlakeCheckLogCompare.main args
