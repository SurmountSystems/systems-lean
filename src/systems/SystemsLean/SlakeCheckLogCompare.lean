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

partial def poolTrace (count : Nat) : List PoolStep :=
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

/-- One log line. Newlines in process text must not split a FAIL row. -/
def oneLineReason (text : String) : String :=
  let flat := ((text.replace "\r\n" " ").replace "\n" " ").replace "\r" " "
  flat.trimAscii.copy

/-- Stderr, then stdout. An empty pair keeps the exit code, which is the only text left. -/
def slotFailReason (stdout stderr : String) (code : UInt32) : String :=
  let errText := oneLineReason stderr
  let outText := oneLineReason stdout
  if errText != "" && outText != "" then s!"{errText} | {outText}"
  else if errText != "" then errText
  else if outText != "" then outText
  else s!"exit={code}"

abbrev Slot := Task (String × Except IO.Error (Bool × String))

def startSlot (name : String) : IO Slot := do
  let task ← IO.asTask (prio := Task.Priority.dedicated) do
    let out ← IO.Process.output {
      cmd := "/run/current-system/sw/bin/nice"
      args := #[ "-n", "19", checkElf, "--slake-check", name ]
      cwd := some "/home/nixbuilder/iso"
      env := checkEnv
    }
    let reason :=
      if out.exitCode == 0 then ""
      else slotFailReason out.stdout out.stderr out.exitCode
    return (out.exitCode == 0, reason)
  return task.map (sync := true) fun
    | Except.ok payload => (name, Except.ok payload)
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
    let ((name, result), rest) ← IO.waitAny' (head :: tail) (Nat.succ_pos _)
    match result with
    | Except.ok (true, _) => drain pending rest (pass + 1) fail
    | Except.ok (false, reason) =>
      IO.println s!"FAIL name={name} reason={reason}"
      drain pending rest pass (fail + 1)
    | Except.error err =>
      IO.println s!"FAIL name={name} reason={oneLineReason s!"{err}"}"
      drain pending rest pass (fail + 1)

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

/-
Admission, the launch ceiling, monitor disagreement, memory-pair tolerance,
and citation completeness. These definitions are total.
`poolTrace` stays `partial def` and is not a premise here.
-/

/-- Admit one more worker only when fewer than 32 are in flight and work is still queued.
    Thirty-two already in flight returns false. Nothing queued returns false. -/
def admitWorker (inFlight queued : Nat) : Bool :=
  decide (inFlight < concurrentChecks) && decide (0 < queued)

theorem admitWorker_false_when_inFlight_atLeast32
    (inFlight queued : Nat)
    (hFlight : 32 ≤ inFlight)
    (hQueued : 0 < queued) :
    admitWorker inFlight queued = false := by
  unfold admitWorker
  have hNot : ¬ inFlight < concurrentChecks := by
    rw [concurrentChecks]
    exact Nat.not_lt_of_le hFlight
  have hYes : decide (0 < queued) = true := decide_eq_true hQueued
  rw [decide_eq_false hNot, hYes]
  rfl

-- guard_admitWorker_32_queued_false
#guard admitWorker 32 1 == false

-- guard_admitWorker_31_queued_true
#guard admitWorker 31 1 == true

-- guard_admitWorker_31_nothingQueued_false
#guard admitWorker 31 0 == false

-- guard_admitWorker_33_queued_false
#guard admitWorker 33 1 == false

/-- Launch gate in resident bytes. This is 192 GB, not the 206158430208 MemoryMax. -/
def launchCeilingBytes : Nat := 192000000000

/-- Ceiling hold alone. Projected resident bytes above `launchCeilingBytes` return false. -/
def ceilingAllows (projectedResidentBytes : Nat) : Bool :=
  decide (projectedResidentBytes ≤ launchCeilingBytes)

theorem ceilingAllows_false_when_aboveLaunchGate
    (projectedResidentBytes : Nat)
    (h : 192000000000 < projectedResidentBytes) :
    ceilingAllows projectedResidentBytes = false := by
  unfold ceilingAllows
  have hNot : ¬ projectedResidentBytes ≤ launchCeilingBytes := by
    rw [launchCeilingBytes]
    exact Nat.not_le_of_gt h
  exact decide_eq_false hNot

-- guard_ceilingAllows_192000000001_false
#guard ceilingAllows 192000000001 == false

-- guard_ceilingAllows_192000000000_true
#guard ceilingAllows 192000000000 == true

-- guard_ceilingAllows_206158430208_false
#guard ceilingAllows 206158430208 == false

/-- While the scheduler reading and the monitor reading disagree, use the larger.
    Equal readings return that shared value. -/
def disagreementResident (schedulerReading monitorReading : Nat) : Nat :=
  Nat.max schedulerReading monitorReading

theorem disagreementResident_eq_max
    (schedulerReading monitorReading : Nat) :
    disagreementResident schedulerReading monitorReading =
      Nat.max schedulerReading monitorReading := by
  unfold disagreementResident
  rfl

-- guard_disagreementResident_100_250
#guard disagreementResident 100 250 == 250

-- guard_disagreementResident_equal
#guard disagreementResident 100 100 == 100

/-- Absolute difference of two natural numbers. Nat subtraction saturates, so the sum is the gap. -/
def natAbsDiff (a b : Nat) : Nat :=
  (a - b) + (b - a)

/-- Absolute difference of two resident-byte readings. -/
def absDiffBytes (a b : Nat) : Nat :=
  natAbsDiff a b

/-- Integer percent of the larger reading, truncating toward zero.
    This figure is not the inside-tolerance test. Truncation would widen that test. -/
def absDiffPercentOfLarger (a b : Nat) : Nat :=
  let larger := Nat.max a b
  if larger == 0 then 0 else (absDiffBytes a b * 100) / larger

/-- Locked by `doc/memory-compare-rule.md` before any sample. Do not widen.
    ToleranceNumber: 1
    ToleranceUnit: percent of the larger of the two resident-byte readings -/
def memoryCompareToleranceNumber : Nat := 1

/-- The rule keeps a pair only when the absolute timestamp difference is at most 1 second. -/
def pairTimestampWindowSec : Nat := 1

/-- True when the byte gap is at most the locked percent of the larger reading.
    ToleranceNumber: 1
    ToleranceUnit: percent of the larger of the two resident-byte readings
    The test is `diff * 100 ≤ larger * ToleranceNumber`, not the truncated percent. -/
def withinLockedTolerance (schedulerBytes monitorBytes : Nat) : Bool :=
  let diff := absDiffBytes schedulerBytes monitorBytes
  let larger := Nat.max schedulerBytes monitorBytes
  decide (diff * 100 ≤ larger * memoryCompareToleranceNumber)

-- Pair 2 captured readings. Absolute difference 3305472.
-- 59760640 - 56455168 = 3305472
-- 3305472 * 100 = 330547200
-- 59760640 * 1 = 59760640
-- 330547200 <= 59760640 is false, so the pair is outside.
-- guard_withinLockedTolerance_59760640_56455168_outside
#guard withinLockedTolerance 59760640 56455168 == false

-- Both-workers captured readings. Absolute difference 1130496.
-- 208367616 - 207237120 = 1130496
-- 1130496 * 100 = 113049600
-- 208367616 * 1 = 208367616
-- 113049600 <= 208367616 is true, so the pair is inside.
-- guard_withinLockedTolerance_208367616_207237120_inside
#guard withinLockedTolerance 208367616 207237120 == true

-- Pair 4 captured readings. Absolute difference 192049152.
-- 208367616 - 16318464 = 192049152
-- 192049152 * 100 = 19204915200
-- 208367616 * 1 = 208367616
-- 19204915200 <= 208367616 is false, so the pair is outside.
-- guard_withinLockedTolerance_16318464_208367616_outside
#guard withinLockedTolerance 16318464 208367616 == false

/-- One historical comparison. The raw byte pair stays outside ToleranceNumber 1.
    A scored whole-tree pair needs a monitor text on the scheduler sample,
    the monitor block the tie-break actually selected, and the same worker set.
    `sameWorkerSet = none` means the scheduler ps text is not in evidence.
    This does not invent pid, rss, or args rows. -/
structure HistoricalCompare where
  schedulerBytes : Nat
  monitorBytes : Nat
  schedulerMonitorAbsent : Bool
  selectedMonitorBlock : Bool
  sameWorkerSet : Option Bool
  deriving Repr, BEq, DecidableEq

/-- The fixed reader does not score an absent monitor field, an unselected
    later block, or a different worker set. A same-set selected pair is scored
    even when the bytes are outside tolerance. Tolerance stays 1. -/
def historicalScoredWholeTree (row : HistoricalCompare) : Option (Nat × Nat) :=
  if row.schedulerMonitorAbsent || !row.selectedMonitorBlock ||
      !(row.sameWorkerSet == some true) then
    none
  else
    some (row.schedulerBytes, row.monitorBytes)

/-- Cause for a comparison the fixed reader does not score.
    `none` when `historicalScoredWholeTree` returns the pair. -/
def historicalUnscoredCause (row : HistoricalCompare) : Option String :=
  match historicalScoredWholeTree row with
  | some _ => none
  | none =>
    if !row.selectedMonitorBlock then
      some "later-block-not-tie-break-winner-scheduler-monitor-bytes-absent"
    else if row.sameWorkerSet == some false then
      some "earlier-timestamp-tie-break-kept-different-worker-set"
    else if row.schedulerMonitorAbsent then
      some "scheduler-monitor-bytes-absent"
    else
      some "worker-set-not-in-evidence"

/-- Pair 2. Scheduler SAMPLE resident_bytes=56455168 has monitor_bytes=absent.
    59760640 is the later same-second block, (15864 + 42496) * 1024.
    That block was not the tie-break winner.
    The scheduler ps text that printed 56455168 is not in the monitor file.
    Evidence: scheduler-run-after-live-tree.log and
    memory-monitor-live-l3-2026-10-26.txt. -/
def historicalPair2Compare : HistoricalCompare :=
  { schedulerBytes := 56455168
    monitorBytes := 59760640
    schedulerMonitorAbsent := true
    selectedMonitorBlock := false
    sameWorkerSet := none }

/-- Pair 4. The in_flight=0 sample is pool-only 15936 * 1024 = 16318464.
    The tie-break kept the earlier both-workers block
    (15928 + 94168 + 93388) * 1024 = 208367616.
    Those worker sets differ. The SAMPLE field is monitor_bytes=absent. -/
def historicalPair4Compare : HistoricalCompare :=
  { schedulerBytes := 16318464
    monitorBytes := 208367616
    schedulerMonitorAbsent := true
    selectedMonitorBlock := true
    sameWorkerSet := some false }

/-- Same-set selected pair. This is not historical pair 2 or pair 4. -/
def historicalInsideCompare : HistoricalCompare :=
  { schedulerBytes := 208367616
    monitorBytes := 207237120
    schedulerMonitorAbsent := false
    selectedMonitorBlock := true
    sameWorkerSet := some true }

/-- Log line for one unscored historical comparison. The raw numbers stay outside. -/
def historicalUnscoredLine (label : String) (left right : Nat) (row : HistoricalCompare) : String :=
  let diff := absDiffBytes left right
  let larger := Nat.max left right
  let tol := memoryCompareToleranceNumber
  let holdsText := if withinLockedTolerance left right then "true" else "false"
  let scoredText :=
    match historicalScoredWholeTree row with
    | some _ => "true"
    | none => "false"
  let causeText :=
    match historicalUnscoredCause row with
    | some cause => cause
    | none => "scored"
  s!"UNSCORED {label}={left},{right} diff*100={diff * 100} " ++
    s!"larger*{tol}={larger * tol} holds={holdsText} scored={scoredText} cause={causeText}\n"

-- guard_historical_pair2_pair4_unscored_raw_outside
-- (15864 + 42496) * 1024 = 59760640. 15936 * 1024 = 16318464.
-- (15928 + 94168 + 93388) * 1024 = 208367616.
-- Both raw pairs stay outside. Neither is a scored whole-tree pair.
-- 59760640 versus 56455168 is not marked inside.
-- 16318464 versus 208367616 is not marked inside.
#guard
  (15864 + 42496) * 1024 == 59760640 &&
    15936 * 1024 == 16318464 &&
    (15928 + 94168 + 93388) * 1024 == 208367616 &&
    withinLockedTolerance 59760640 56455168 == false &&
    withinLockedTolerance 16318464 208367616 == false &&
    historicalScoredWholeTree historicalPair2Compare == none &&
    historicalScoredWholeTree historicalPair4Compare == none &&
    historicalUnscoredCause historicalPair2Compare ==
      some "later-block-not-tie-break-winner-scheduler-monitor-bytes-absent" &&
    historicalUnscoredCause historicalPair4Compare ==
      some "earlier-timestamp-tie-break-kept-different-worker-set" &&
    historicalScoredWholeTree historicalInsideCompare == some (208367616, 207237120) &&
    historicalUnscoredCause historicalInsideCompare == none &&
    withinLockedTolerance 208367616 207237120 == true &&
    ((historicalUnscoredLine "pair2" 59760640 56455168 historicalPair2Compare).splitOn
        "scored=false cause=later-block-not-tie-break-winner-scheduler-monitor-bytes-absent").length ==
      2 &&
    ((historicalUnscoredLine "pair4" 16318464 208367616 historicalPair4Compare).splitOn
        "scored=false cause=earlier-timestamp-tie-break-kept-different-worker-set").length ==
      2

-- Outside pair 1. Scheduler bytes 16719872. Independent bytes 0.
-- 16719872 - 0 = 16719872
-- 16719872 * 100 = 1671987200
-- 16719872 * 1 = 16719872
-- 1671987200 <= 16719872 is false, so the pair is outside.
-- guard_withinLockedTolerance_16719872_0_outside
#guard withinLockedTolerance 16719872 0 == false

-- Outside pair 5. Scheduler bytes 16863232. Independent bytes 560463872.
-- 560463872 - 16863232 = 543600640
-- 543600640 * 100 = 54360064000
-- 560463872 * 1 = 560463872
-- 54360064000 <= 560463872 is false, so the pair is outside.
-- guard_withinLockedTolerance_16863232_560463872_outside
#guard withinLockedTolerance 16863232 560463872 == false

-- Full-tree pair from zfulltree000017.txt and zfulltree000016.txt.
-- Both texts count pool pid 927284 at 16736 kibibytes and pinned Lean pid 927301.
-- That Lean rss is 529572 kibibytes on one side and 523668 on the other.
-- 529572 - 523668 = 5904. 5904 * 1024 = 6045696.
-- 559419392 - 553373696 = 6045696.
-- 6045696 * 100 = 604569600.
-- 559419392 * 1 = 559419392.
-- 604569600 <= 559419392 is false, so the pair is outside.
-- The gap is that worker's resident bytes moving. It is not a dropped pid.
-- guard_withinLockedTolerance_559419392_553373696_outside
#guard withinLockedTolerance 559419392 553373696 == false

/-- One resident-byte sample. `timestampSec` is a whole-second clock. -/
structure ResidentSample where
  timestampSec : Nat
  residentBytes : Nat
  deriving Repr, BEq, DecidableEq

/-- One scheduler sample paired with one monitor sample. -/
structure MemoryPair where
  scheduler : ResidentSample
  monitor : ResidentSample
  deriving Repr, BEq, DecidableEq

/-- Closer monitor wins. On an equal distance, the earlier timestamp wins. -/
def preferMonitor (schedTs : Nat) (best cand : ResidentSample) : ResidentSample :=
  let bestDist := natAbsDiff schedTs best.timestampSec
  let candDist := natAbsDiff schedTs cand.timestampSec
  if candDist < bestDist then
    cand
  else if candDist == bestDist then
    if cand.timestampSec < best.timestampSec then cand else best
  else
    best

def foldNearest (schedTs : Nat) (best : Option ResidentSample) (cand : ResidentSample) :
    Option ResidentSample :=
  match best with
  | none => some cand
  | some chosen => some (preferMonitor schedTs chosen cand)

/-- Nearest monitor sample. Empty input returns none. -/
def nearestMonitor (schedTs : Nat) (monitors : List ResidentSample) : Option ResidentSample :=
  monitors.foldl (foldNearest schedTs) none

/-- Pair by nearest timestamp. Keep the pair only inside the 1 second window.
    If two monitor samples are equally near, use the earlier timestamp.
    A sample outside the window is not paired. -/
def pairByNearestTimestamp (scheduler : ResidentSample) (monitors : List ResidentSample) :
    Option MemoryPair :=
  match nearestMonitor scheduler.timestampSec monitors with
  | none => none
  | some monitor =>
    if decide (natAbsDiff scheduler.timestampSec monitor.timestampSec ≤ pairTimestampWindowSec) then
      some { scheduler := scheduler, monitor := monitor }
    else
      none

/-- A pair is inside tolerance only when the timestamps are at most 1 second apart
    and the resident-byte gap is at most the locked percent of the larger reading.
    ToleranceNumber: 1
    ToleranceUnit: percent of the larger of the two resident-byte readings
    A pair outside the timestamp window is not inside tolerance. Do not widen the number. -/
def memoryPairInsideTolerance (pair : MemoryPair) : Bool :=
  decide (natAbsDiff pair.scheduler.timestampSec pair.monitor.timestampSec ≤
      pairTimestampWindowSec) &&
    withinLockedTolerance pair.scheduler.residentBytes pair.monitor.residentBytes

-- guard_absDiffBytes_100_250
#guard absDiffBytes 100 250 == 150

-- guard_absDiffPercentOfLarger_100_250
#guard absDiffPercentOfLarger 100 250 == 60

-- guard_memoryPairInsideTolerance_overTolerance_false
#guard memoryPairInsideTolerance
    { scheduler := { timestampSec := 10, residentBytes := 100 }
    , monitor := { timestampSec := 10, residentBytes := 250 } } == false

-- guard_memoryPairInsideTolerance_equalWithinWindow_true
#guard memoryPairInsideTolerance
    { scheduler := { timestampSec := 10, residentBytes := 4096 }
    , monitor := { timestampSec := 11, residentBytes := 4096 } } == true

-- guard_memoryPairInsideTolerance_exactOnePercent_true
#guard memoryPairInsideTolerance
    { scheduler := { timestampSec := 10, residentBytes := 10000 }
    , monitor := { timestampSec := 10, residentBytes := 9900 } } == true

-- guard_memoryPairInsideTolerance_oneByteOverOnePercent_false
#guard memoryPairInsideTolerance
    { scheduler := { timestampSec := 10, residentBytes := 10000 }
    , monitor := { timestampSec := 10, residentBytes := 9899 } } == false

-- guard_memoryPairInsideTolerance_outsideWindow_false
#guard memoryPairInsideTolerance
    { scheduler := { timestampSec := 10, residentBytes := 4096 }
    , monitor := { timestampSec := 12, residentBytes := 4096 } } == false

-- guard_pairByNearestTimestamp_earlierTie
#guard pairByNearestTimestamp
    { timestampSec := 100, residentBytes := 5 }
    [ { timestampSec := 101, residentBytes := 1 }
    , { timestampSec := 99, residentBytes := 2 } ] ==
  some { scheduler := { timestampSec := 100, residentBytes := 5 }
       , monitor := { timestampSec := 99, residentBytes := 2 } }

-- guard_pairByNearestTimestamp_nearerNotEarlier
#guard pairByNearestTimestamp
    { timestampSec := 100, residentBytes := 5 }
    [ { timestampSec := 90, residentBytes := 1 }
    , { timestampSec := 101, residentBytes := 7 } ] ==
  some { scheduler := { timestampSec := 100, residentBytes := 5 }
       , monitor := { timestampSec := 101, residentBytes := 7 } }

-- guard_pairByNearestTimestamp_outsideWindow_none
#guard pairByNearestTimestamp
    { timestampSec := 100, residentBytes := 5 }
    [ { timestampSec := 103, residentBytes := 1 } ] == none

-- Two monitor samples share timestamp 1793064791.
-- The earlier sample is listed first (208367616). The later sample is 16318464.
-- Equal distance keeps the earlier sample.
-- guard_pairByNearestTimestamp_sameTsEarlierSample_208367616
#guard pairByNearestTimestamp
    { timestampSec := 1793064791, residentBytes := 5 }
    [ { timestampSec := 1793064791, residentBytes := 208367616 }
    , { timestampSec := 1793064791, residentBytes := 16318464 } ] ==
  some { scheduler := { timestampSec := 1793064791, residentBytes := 5 }
       , monitor := { timestampSec := 1793064791, residentBytes := 208367616 } }

/-- Columns of one `ps -o pid=,rss=,args=` line. Leading spaces are empty fields. -/
def psColumns (line : String) : List String :=
  (line.splitOn " ").filter fun word => word != ""

def psTextHas (needle line : String) : Bool :=
  (line.splitOn needle).length > 1

/-- A Lake command contains `/bin/lake`. The pool path does not. -/
def psLineIsLake (line : String) : Bool :=
  psTextHas "/bin/lake" line

/-- `lean --version` is not a worker and is not the scheduler. -/
def psLineIsLeanVersion (line : String) : Bool :=
  psTextHas "/bin/lean" line && psTextHas "--version" line

def psLineIsBootstrap (line : String) : Bool :=
  psTextHas "slake-bootstrap" line && !psLineIsLake line

/-- argv0 from a `pid rss args` line. A later argument is not the executable. -/
def psExecutableWord (line : String) : Option String :=
  match psColumns line with
  | _ :: _ :: exe :: _ => some exe
  | _ => none

/-- True when argv0 is `bash` or a path ending in `/bash`. -/
def psExecutableIsBash (line : String) : Bool :=
  match psExecutableWord line with
  | some exe => exe == "bash" || String.endsWith exe "/bash"
  | none => false

/-- True when argv0 is the `slake-check-pool` binary.
    A script path that only contains that substring is not the binary. -/
def psExecutableIsPoolBinary (line : String) : Bool :=
  match psExecutableWord line with
  | some exe => exe == "slake-check-pool" || String.endsWith exe "/slake-check-pool"
  | none => false

/-- The pool binary only. Bash running a script is not the pool, even when the
    script path contains `slake-check-pool`. `/bin/lake` stays out.
    `slake-bootstrap` stays out. -/
def psLineIsScheduler (line : String) : Bool :=
  psExecutableIsPoolBinary line && !psLineIsLake line && !psLineIsBootstrap line &&
    !psExecutableIsBash line

/-- Pinned Lean 4.35.0. A `slake-bootstrap` path is not this binary. -/
def pinnedLeanBin : String :=
  "/nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean"

def psArgIsCheckoutLean (word : String) : Bool :=
  String.startsWith word "/home/nixbuilder/iso/" && String.endsWith word ".lean"

def psArgsHaveCheckoutLean : List String → Bool
  | [] => false
  | word :: rest => psArgIsCheckoutLean word || psArgsHaveCheckoutLean rest

/-- Pinned Lean whose arguments include a checkout `.lean` file.
    `lean --version` is not a worker. Lake is a different binary. -/
def psLineIsPinnedLeanWorker (line : String) : Bool :=
  psTextHas pinnedLeanBin line && !psLineIsLeanVersion line &&
    (match psColumns line with
      | _ :: _ :: args => psArgsHaveCheckoutLean args
      | _ => false)

def psPidSeen (pid : Nat) : List Nat → Bool
  | [] => false
  | found :: rest => found == pid || psPidSeen pid rest

/-- Kibibytes already accepted from one ps text. Duplicate pids are not added twice. -/
structure PsColumnSum where
  schedulerKib : Nat
  sawScheduler : Bool
  workerKib : Nat
  seen : List Nat

/-- `/bin/lake` is in the sum. `doc/memory-compare-rule.md` does not exclude it.
    `lean --version` stays out. Bash stays out.
    A pinned Lean worker on a checkout `.lean` file is counted with the bootstrap workers.
    A counted line that is not pid, rss, args makes the whole text unreadable. -/
def addPsLine (acc : PsColumnSum) (line : String) : Option PsColumnSum :=
  let trimmed := line.trimAscii.copy
  if trimmed == "" || psLineIsLeanVersion trimmed then
    some acc
  else if psLineIsScheduler trimmed || psLineIsBootstrap trimmed ||
      psLineIsPinnedLeanWorker trimmed || psLineIsLake trimmed then
    match psColumns trimmed with
    | pidText :: rssText :: _ =>
      match pidText.toNat?, rssText.toNat? with
      | some pid, some kib =>
        if psPidSeen pid acc.seen then
          some acc
        else if psLineIsScheduler trimmed then
          some {
            acc with
            schedulerKib := acc.schedulerKib + kib
            sawScheduler := true
            seen := pid :: acc.seen
          }
        else
          some {
            acc with
            workerKib := acc.workerKib + kib
            seen := pid :: acc.seen
          }
      | _, _ => none
    | _ => none
  else
    some acc

def foldPsLines (acc : Option PsColumnSum) : List String → Option PsColumnSum
  | [] => acc
  | line :: rest =>
    match acc with
    | none => none
    | some total => foldPsLines (addPsLine total line) rest

/-- Resident bytes from one captured ps text.
    The sum is the pool binary RSS, each `/bin/lake` RSS, each `slake-bootstrap` worker RSS,
    and each pinned Lean worker on a checkout `.lean` file, times 1024.
    `doc/memory-compare-rule.md` does not exclude `/bin/lake`.
    A `lean --version` process is not added.
    A bash process is not added, even when its script path contains `slake-check-pool`.
    `none` means the text has no pool binary line, or a counted line is unreadable.
    The preserved zfulltree pair uses `everyRealPsLineBytes`, not this sum. -/
def capturedPsResidentBytes (text : String) : Option Nat :=
  let start : PsColumnSum :=
    { schedulerKib := 0, sawScheduler := false, workerKib := 0, seen := [] }
  match foldPsLines (some start) (text.splitOn "\n") with
  | none => none
  | some total =>
    if total.sawScheduler then
      some ((total.schedulerKib + total.workerKib) * 1024)
    else
      none

/-- Rows from one ps tick at ts=1793064791. RSS column is scheduler 15928,
    worker 94168, worker 93388. Hand sum 15928 + 94168 + 93388, times 1024. -/
def capturedBothWorkersPsText : String :=
  "1821052 15928 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- " ++
    "--module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1821065 94168 /nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap " ++
    "--slake-check SimdTargetFeatures\n" ++
  "1821080 93388 /nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap " ++
    "--slake-check SlakeCheckLogCompare\n"

/-- The same tick also printed Lake. That row is in the sum. The rule file does not exclude it. -/
def capturedBothWorkersPlusLakePsText : String :=
  "1821024 830692 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake " ++
    "--dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- " ++
    "--module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  capturedBothWorkersPsText

-- guard_capturedPsResidentBytes_hand_sum_includes_lake
-- Hand sum without Lake: (15928 + 94168 + 93388) * 1024.
-- The Lake row rss 830692 is in the second text and is in that sum.
#guard
  capturedPsResidentBytes capturedBothWorkersPsText ==
      some ((15928 + 94168 + 93388) * 1024) &&
    capturedPsResidentBytes capturedBothWorkersPlusLakePsText ==
      some ((15928 + 94168 + 93388 + 830692) * 1024) &&
    capturedPsResidentBytes capturedBothWorkersPlusLakePsText !=
      some ((15928 + 94168 + 93388) * 1024)


/-- Captured ps text slake-one-ps-sample-1.txt. Lake rss 832436 is in the sum. -/
def capturedOnePsSample1Text : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "1845901  6464 sshd-session: nixbuilder@notty\n" ++
  "1845902  4280 /run/current-system/sw/bin/bash -lc export PATH=/nix/store/3d1c302vw7kc8a5vknhmn34c0pd7zm6m-gcc-wrapper-15.3.0/bin:$PATH; cd /home/nixbuilder/iso; { echo START $(date -Is); command -v cc || echo CC_MISSING; stat -c \"POOL_BEFOR\n" ++
  "1845905 832436 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1845984 16072 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1845989  4436 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

/-- Captured ps text slake-one-ps-sample-2.txt. Lake rss 832436 is in the sum. -/
def capturedOnePsSample2Text : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "1845901  6464 sshd-session: nixbuilder@notty\n" ++
  "1845902  4280 /run/current-system/sw/bin/bash -lc export PATH=/nix/store/3d1c302vw7kc8a5vknhmn34c0pd7zm6m-gcc-wrapper-15.3.0/bin:$PATH; cd /home/nixbuilder/iso; { echo START $(date -Is); command -v cc || echo CC_MISSING; stat -c \"POOL_BEFOR\n" ++
  "1845905 832436 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1845984 16140 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1845992 90208 /nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap --slake-check SimdTargetFeatures\n" ++
  "1845997  4444 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

/-- Captured ps text slake-one-ps-sample-3.txt. Lake rss 832436 is in the sum. -/
def capturedOnePsSample3Text : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "1845901  6464 sshd-session: nixbuilder@notty\n" ++
  "1845902  4280 /run/current-system/sw/bin/bash -lc export PATH=/nix/store/3d1c302vw7kc8a5vknhmn34c0pd7zm6m-gcc-wrapper-15.3.0/bin:$PATH; cd /home/nixbuilder/iso; { echo START $(date -Is); command -v cc || echo CC_MISSING; stat -c \"POOL_BEFOR\n" ++
  "1845905 832436 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1845984 16220 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1846000 91692 /nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap --slake-check SlakeCheckLogCompare\n" ++
  "1846008  4432 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

/-- Captured ps text slake-one-ps-sample-4.txt. Lake rss 832436 is in the sum. -/
def capturedOnePsSample4Text : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "1845901  6464 sshd-session: nixbuilder@notty\n" ++
  "1845902  4280 /run/current-system/sw/bin/bash -lc export PATH=/nix/store/3d1c302vw7kc8a5vknhmn34c0pd7zm6m-gcc-wrapper-15.3.0/bin:$PATH; cd /home/nixbuilder/iso; { echo START $(date -Is); command -v cc || echo CC_MISSING; stat -c \"POOL_BEFOR\n" ++
  "1845905 832436 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1845984 16280 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1846013  4420 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

/-- Captured ps text slake-one-ps-sample-5.txt. Lake rss 832436 is in the sum. -/
def capturedOnePsSample5Text : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "1845901  6464 sshd-session: nixbuilder@notty\n" ++
  "1845902  4280 /run/current-system/sw/bin/bash -lc export PATH=/nix/store/3d1c302vw7kc8a5vknhmn34c0pd7zm6m-gcc-wrapper-15.3.0/bin:$PATH; cd /home/nixbuilder/iso; { echo START $(date -Is); command -v cc || echo CC_MISSING; stat -c \"POOL_BEFOR\n" ++
  "1845905 832436 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1845984 16284 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1846015  4424 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

-- guard_capturedOnePsSample1_hand_sum
-- Job rows: pool 16072 plus lake 832436. Systemd, bash, and ps stay out of this sum.
#guard capturedPsResidentBytes capturedOnePsSample1Text == some ((16072 + 832436) * 1024) &&
  capturedPsResidentBytes capturedOnePsSample1Text != some (16072 * 1024)

-- guard_capturedOnePsSample2_hand_sum
-- Hand sum: 16140 + 90208 + lake 832436.
#guard capturedPsResidentBytes capturedOnePsSample2Text ==
    some ((16140 + 90208 + 832436) * 1024) &&
  capturedPsResidentBytes capturedOnePsSample2Text != some ((16140 + 90208) * 1024)

-- guard_capturedOnePsSample3_hand_sum
-- Hand sum: 16220 + 91692 + lake 832436.
#guard capturedPsResidentBytes capturedOnePsSample3Text ==
    some ((16220 + 91692 + 832436) * 1024) &&
  capturedPsResidentBytes capturedOnePsSample3Text != some ((16220 + 91692) * 1024)

-- guard_capturedOnePsSample4_hand_sum
-- Hand sum: 16280 + lake 832436.
#guard capturedPsResidentBytes capturedOnePsSample4Text == some ((16280 + 832436) * 1024) &&
  capturedPsResidentBytes capturedOnePsSample4Text != some (16280 * 1024)

-- guard_capturedOnePsSample5_hand_sum
-- Hand sum: 16284 + lake 832436.
#guard capturedPsResidentBytes capturedOnePsSample5Text == some ((16284 + 832436) * 1024) &&
  capturedPsResidentBytes capturedOnePsSample5Text != some (16284 * 1024)

/-- Captured ps text scratch/captured-ps-20000047.txt.
    Copied from builder file /tmp/slake-monitor-ps-one-live/20000047.txt.
    The guard reads this string. It does not read `/tmp`.
    Counted rows: slake-check-pool rss 16208, pinned Lean rss 501976, and lake rss 832048. -/
def capturedPinnedLean20000047Text : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "1853158 10424 sshd-session: nixbuilder@notty\n" ++
  "1853159  7364 /nix/store/kmzlca218j6j1ar292fxj7707qzypij8-systemd-260.5/bin/systemd-run --user --quiet --collect --pipe --wait --slice=surmount-builder.slice --property=MemoryMax=192G --property=CPUQuota=6080% --property=Nice=19 --property=IOSchedulingClass=idle -- /nix/store/5np0yidzrnyjbb243hvgqpgpss865p0n-nix-2.34.9/bin/nix-daemon --stdio\n" ++
  "1853162 43388 /nix/store/5np0yidzrnyjbb243hvgqpgpss865p0n-nix-2.34.9/bin/nix-daemon --stdio\n" ++
  "1859564  6456 sshd-session: nixbuilder@notty\n" ++
  "1859565  4156 /run/current-system/sw/bin/bash -s\n" ++
  "1859567  4276 /run/current-system/sw/bin/bash -c  i=20000000 while true; do   /run/current-system/sw/bin/ps -o pid=,rss=,args= > /tmp/slake-monitor-ps-one-live/${i}.txt.tmp   mv /tmp/slake-monitor-ps-one-live/${i}.txt.tmp /tmp/slake-monitor-ps-one-live/${i}.txt   i=$((i+1))   /run/current-system/sw/bin/sleep 0.2 done \n" ++
  "1859571 832048 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1859754 16208 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1859799 501976 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "1859826  4440 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

-- guard_capturedPinnedLean20000047_full_hand_sum
-- Hand sum: (16208 + 501976 + 832048) * 1024 = 1382637568.
-- Pool-plus-lean without lake is 530620416 and is not this sum.
#guard capturedPsResidentBytes capturedPinnedLean20000047Text == some 1382637568 &&
  capturedPsResidentBytes capturedPinnedLean20000047Text != some 530620416

-- guard_capturedPinnedLean20000047_pool_only_is_not_full_sum
-- Pool-only is slake-check-pool rss 16208 times 1024. That product is not 530620416.
-- The pinned Lean worker is in the full hand sum and is not in the pool-only product.
#guard capturedPsResidentBytes capturedPinnedLean20000047Text != some (16208 * 1024)

/-- Captured ps text from builder file /tmp/slake-monitor-ps-one-live/40000029.txt.
    Copied to /tmp/grok-goal-4a11e76a3421/implementer/40000029.txt.
    The guard reads this string. It does not read `/tmp`.
    Counted row: slake-check-pool rss 15916. No pinned Lean worker is in this text.
    Bash rss 4188 runs run-slake-check-pool-once.sh and stays out of the sum.
    Lake rss 831140 is in the sum. -/
def capturedBash40000029Text : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "1853158 10424 sshd-session: nixbuilder@notty\n" ++
  "1853159  7364 /nix/store/kmzlca218j6j1ar292fxj7707qzypij8-systemd-260.5/bin/systemd-run --user --quiet --collect --pipe --wait --slice=surmount-builder.slice --property=MemoryMax=192G --property=CPUQuota=6080% --property=IOSchedulingClass=idle -- /nix/store/5np0yidzrnyjbb243hvgqpgpss865p0n-nix-2.34.9/bin/nix-daemon --stdio\n" ++
  "1853162 43388 /nix/store/5np0yidzrnyjbb243hvgqpgpss865p0n-nix-2.34.9/bin/nix-daemon --stdio\n" ++
  "1864188  6504 sshd-session: nixbuilder@notty\n" ++
  "1864189  4188 /run/current-system/sw/bin/bash /home/nixbuilder/iso/src/systems/SystemsLean/scratch/run-slake-check-pool-once.sh\n" ++
  "1864191  4264 /run/current-system/sw/bin/bash -c i=40000000; while true; do /run/current-system/sw/bin/ps -o pid=,rss=,args= > /tmp/slake-monitor-ps-one-live/${i}.txt.tmp; mv /tmp/slake-monitor-ps-one-live/${i}.txt.tmp /tmp/slake-monitor-ps-one-live/${i}.txt; i=$((i+1)); /run/current-system/sw/bin/sleep 0.2; done\n" ++
  "1864203 831140 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1864335 15916 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "1864336  4448 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

-- guard_capturedBash40000029_hand_sum
-- Hand sum: (15916 + 831140) * 1024 = 867385344.
-- Bash rss 4188 stays out. Pool-only 16297984 is not this sum.
#guard capturedPsResidentBytes capturedBash40000029Text == some 867385344 &&
  capturedPsResidentBytes capturedBash40000029Text != some ((15916 + 4188) * 1024) &&
  capturedPsResidentBytes capturedBash40000029Text != some 16297984

/-- Short ps text with no pool binary and no pinned Lean worker.
    Lake, a bash script whose path contains `slake-check-pool`, and `lean --version`
    are in the text. The tree-sum returns `none`, not a byte count.
    The outside-pair-1 tolerance guard uses the number 0, not this `none`. -/
def outsidePair1NoPoolPsText : String :=
  "100 1200 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake " ++
    "--dir /home/nixbuilder/iso/src/systems exe slake-check-pool\n" ++
  "101 4188 /run/current-system/sw/bin/bash " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/scratch/run-slake-check-pool-once.sh\n" ++
  "102 1111 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean --version\n"

-- guard_capturedPsResidentBytes_outsidePair1_noPool_none
#guard capturedPsResidentBytes outsidePair1NoPoolPsText == none

/-- Short ps text with the pool at rss 16468.
    Lake rss 1200 is in the sum. Bash and `lean --version` stay out. -/
def outsidePair5PoolPsText : String :=
  outsidePair1NoPoolPsText ++
  "200 16468 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures\n"

-- Hand sum: (1200 + 16468) * 1024 = 18092032. Lake rss 1200 is included.
-- Pool-only 16863232 is not this sum.
-- guard_capturedPsResidentBytes_outsidePair5_pool_16468
#guard capturedPsResidentBytes outsidePair5PoolPsText == some 18092032 &&
  capturedPsResidentBytes outsidePair5PoolPsText != some 16863232

/-- That pool plus a pinned Lean worker at rss 530860.
    The worker argument is a checkout path under `/home/nixbuilder/iso/` ending in `.lean`. -/
def outsidePair5PoolAndWorkerPsText : String :=
  outsidePair5PoolPsText ++
  "201 530860 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n"

-- Hand sum: (1200 + 16468 + 530860) * 1024 = 561692672. Lake rss 1200 is included.
-- guard_capturedPsResidentBytes_outsidePair5_pool_and_worker
#guard capturedPsResidentBytes outsidePair5PoolAndWorkerPsText == some 561692672 &&
  capturedPsResidentBytes outsidePair5PoolAndWorkerPsText != some 560463872

/-- Scheduler ps text for later pair 1.
    Pool pid 4105308 rss 16328. 16328 * 1024 = 16719872.
    No pinned Lean worker is in this text.
    Lake rss 1200 is in the sum. The bash script and `lean --version` stay out.
    The independent monitor's raw columns are pid, ppid, rss, args.
    This string is the pid, rss, args row `capturedPsResidentBytes` already reads. -/
def outsidePair1PoolPsText : String :=
  outsidePair1NoPoolPsText ++
  "4105308 16328 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n"

/-- Independent snapshot ts=1793083784.861244836, the later snapshot inside the
    1 second window that still contains pool pid 4105308.
    Pool rss 16388. Pinned Lean worker pid 4105397 rss 49560 is only on this side.
    Lake rss 1200 from the shared prefix is in the sum. The nearer snapshot has no pool line. -/
def outsidePair1LaterMonitorPsText : String :=
  outsidePair1NoPoolPsText ++
  "4105308 16388 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "4105397 49560 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean\n"

-- guard_capturedPsResidentBytes_outsidePair1_pool_16328
-- Hand sum is lake 1200 plus pool 16328. The old pool-only reading is 16719872.
#guard capturedPsResidentBytes outsidePair1PoolPsText == some ((1200 + 16328) * 1024) &&
  capturedPsResidentBytes outsidePair1PoolPsText != some (16328 * 1024)

-- guard_capturedPsResidentBytes_outsidePair1_later_full_sum
-- Lake 1200 plus pool 16388 plus the one-sided worker 49560.
#guard capturedPsResidentBytes outsidePair1LaterMonitorPsText ==
  some ((1200 + 16388 + 49560) * 1024)

/-- One counted process: the pool binary, a `slake-bootstrap` worker, or a pinned Lean worker. -/
structure CountedPsProc where
  pid : Nat
  kib : Nat
  deriving Repr, BEq, DecidableEq

def countedPidSeen (pid : Nat) : List CountedPsProc → Bool
  | [] => false
  | found :: rest => found.pid == pid || countedPidSeen pid rest

/-- `/bin/lake` is counted. `doc/memory-compare-rule.md` does not exclude it.
    `lean --version` and bash stay out.
    A counted line that is not pid, rss, args makes the whole text unreadable.
    A duplicate pid is kept once. -/
def addCountedProc (acc : Option (List CountedPsProc)) (line : String) :
    Option (List CountedPsProc) :=
  match acc with
  | none => none
  | some procs =>
    let trimmed := line.trimAscii.copy
    if trimmed == "" || psLineIsLeanVersion trimmed || psExecutableIsBash trimmed then
      some procs
    else if psLineIsScheduler trimmed || psLineIsBootstrap trimmed ||
        psLineIsPinnedLeanWorker trimmed || psLineIsLake trimmed then
      match psColumns trimmed with
      | pidText :: rssText :: _ =>
        match pidText.toNat?, rssText.toNat? with
        | some pid, some kib =>
          if countedPidSeen pid procs then
            some procs
          else
            some ({ pid := pid, kib := kib } :: procs)
        | _, _ => none
      | _ => none
    else
      some procs

def countedProcsOf (text : String) : Option (List CountedPsProc) :=
  (text.splitOn "\n").foldl addCountedProc (some [])

def kibOfCountedPid (pid : Nat) : List CountedPsProc → Option Nat
  | [] => none
  | proc :: rest =>
    if proc.pid == pid then some proc.kib else kibOfCountedPid pid rest

def natSeen (pid : Nat) : List Nat → Bool
  | [] => false
  | head :: rest => head == pid || natSeen pid rest

def countedPidList : List CountedPsProc → List Nat
  | [] => []
  | proc :: rest => proc.pid :: countedPidList rest

/-- Pids counted on either text. A pid present on only one side is kept.
    It is not omitted, and it is not inserted as 0 kibibytes on the other side. -/
def sharedCountedPids : List CountedPsProc → List CountedPsProc → List Nat
  | [], other => countedPidList other
  | proc :: rest, other =>
    let tail := sharedCountedPids rest other
    if natSeen proc.pid tail then tail else proc.pid :: tail

/-- Each side is the full `capturedPsResidentBytes` sum: every counted pool,
    `slake-bootstrap`, and pinned Lean pid in that text.
    A one-sided pid stays in that side's sum. It is not dropped to the intersection,
    and it is not inserted as 0 on the other side.
    A text with no pool binary returns `none`. `/bin/lake` is added on each side that has it.
    A `lean --version` process is not added. Bash whose path contains `slake-check-pool` is not added.
    The preserved zfulltree files have more than these rows. `scoredFullTreePair` sums every real line. -/
def pairedSameProcessBytes (schedulerPs monitorPs : String) : Option (Nat × Nat) :=
  match capturedPsResidentBytes schedulerPs, capturedPsResidentBytes monitorPs with
  | some schedulerBytes, some monitorBytes => some (schedulerBytes, monitorBytes)
  | _, _ => none

-- guard_sharedCountedPids_keeps_one_sided_worker_201
-- Pid 201 is the pinned Lean worker on the monitor text only.
-- The intersection would drop it. The union keeps it.
#guard
  match countedProcsOf outsidePair5PoolPsText, countedProcsOf outsidePair5PoolAndWorkerPsText with
  | some left, some right =>
    natSeen 201 (sharedCountedPids left right) &&
      natSeen 200 (sharedCountedPids left right)
  | _, _ => false

-- guard_pairedSameProcessBytes_outsidePair5_full_sums_outside
-- Lake rss 1200 is on both sides. The one-sided worker stays in the monitor sum.
-- Intersection on pid 200 alone would hide that worker. ToleranceNumber stays 1.
-- Larger reading is (1200 + 16468 + 530860) * 1024 = 561692672.
#guard
  (match pairedSameProcessBytes outsidePair1PoolPsText outsidePair1LaterMonitorPsText with
    | some (schedBytes, monBytes) => withinLockedTolerance schedBytes monBytes == false
    | none => false) &&
  (match pairedSameProcessBytes outsidePair5PoolPsText outsidePair5PoolAndWorkerPsText with
    | some (schedBytes, monBytes) =>
      schedBytes == 18092032 &&
        monBytes == 561692672 &&
        withinLockedTolerance schedBytes monBytes == false &&
        disagreementResident schedBytes monBytes == 561692672 &&
        schedBytes != 16863232 &&
        monBytes != 560463872
    | none => false) &&
  pairedSameProcessBytes outsidePair1PoolPsText outsidePair1NoPoolPsText == none

-- guard_one_sided_pid_changes_only_that_side
-- Pid 201 rss 530860 is only on the worker text. The pool side has no pid 201.
-- Pool side stays (1200 + 16468) * 1024 = 18092032.
-- Worker side is that sum plus 530860 * 1024, which is 561692672.
-- 561692672 - 18092032 = 543600640 = 530860 * 1024.
-- disagreementResident sees those two full sums. ToleranceNumber stays 1.
-- The shared-pid intersection would hide pid 201. These totals are not 16863232 or 560463872.
#guard
  match capturedPsResidentBytes outsidePair5PoolPsText,
      capturedPsResidentBytes outsidePair5PoolAndWorkerPsText with
  | some left, some right =>
    left == 18092032 &&
      right == 561692672 &&
      right - left == 530860 * 1024 &&
      right - left == 543600640 &&
      withinLockedTolerance left right == false &&
      disagreementResident left right == 561692672 &&
      disagreementResident left right == right &&
      memoryCompareToleranceNumber == 1 &&
      match pairedSameProcessBytes outsidePair5PoolPsText outsidePair5PoolAndWorkerPsText with
      | some (schedBytes, monBytes) =>
        schedBytes == left &&
          monBytes == right &&
          schedBytes == 18092032 &&
          monBytes == 561692672 &&
          disagreementResident schedBytes monBytes == 561692672
      | none => false
  | _, _ => false

-- guard_capturedPsResidentBytes_duplicate_pid_not_twice
-- Repeating the worker text does not add pid 201 twice.
-- The sum stays 561692672. The pool side stays 18092032.
-- Those are the full sums, not 16863232 and not 560463872.
#guard
  capturedPsResidentBytes outsidePair5PoolAndWorkerPsText == some 561692672 &&
    capturedPsResidentBytes
        (outsidePair5PoolAndWorkerPsText ++ outsidePair5PoolAndWorkerPsText) ==
      some 561692672 &&
    capturedPsResidentBytes outsidePair5PoolPsText == some 18092032 &&
    capturedPsResidentBytes (outsidePair5PoolPsText ++ outsidePair5PoolPsText) ==
      some 18092032 &&
    capturedPsResidentBytes outsidePair5PoolAndWorkerPsText != some (561692672 * 2)

/-- `stat -c %Y` of zfulltree000017.txt. Whole seconds. Not a made-up gap. -/
def fullTree017EpochSec : Nat := 1793191296

/-- `stat -c %Y` of zfulltree000016.txt. One second earlier. The window is 1. -/
def fullTree016EpochSec : Nat := 1793191295

/-- Shared rows of zfulltree000017.txt and zfulltree000016.txt.
    Eleven process lines are in each file. These eight match, including lake pid 927257. -/
def fullTreeSharedPsPrefix : String :=
  "   1649 14456 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2904 dbus-broker --log 11 --controller 10 --machine-id " ++
    "f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 " ++
    "--max-matches 5000000000\n" ++
  " 927235  6740 sshd-session: nixbuilder@notty\n" ++
  " 927236  4172 bash -s\n" ++
  " 927248  4160 /run/current-system/sw/bin/bash -c  i=1 while true; do   " ++
    "n=$(printf \"%06d\" \"$i\")   /run/current-system/sw/bin/ps -o pid=,rss=,args= > " ++
    "/tmp/slake-monitor-ps-one-live/zfulltree${n}.txt.tmp   " ++
    "mv /tmp/slake-monitor-ps-one-live/zfulltree${n}.txt.tmp " ++
    "/tmp/slake-monitor-ps-one-live/zfulltree${n}.txt   i=$((i+1))   " ++
    "/run/current-system/sw/bin/sleep 0.2 done \n" ++
  "927257 830928 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake " ++
    "--dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- " ++
    "--module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "927284 16736 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n"

/-- Every pid line from zfulltree000017.txt. Lean rss 529572. One-sided ps pid 927374. -/
def fullTree017CountedPsText : String :=
  fullTreeSharedPsPrefix ++
  "927301 529572 " ++ pinnedLeanBin ++ " " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  " 927374  4436 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

/-- Every pid line from zfulltree000016.txt. Lean rss 523668. One-sided ps pid 927370. -/
def fullTree016CountedPsText : String :=
  fullTreeSharedPsPrefix ++
  "927301 523668 " ++ pinnedLeanBin ++ " " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  " 927370  4424 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

/-- Kibibytes of every pid, rss, args line. A one-sided pid stays in that side.
    A duplicate pid is kept once. A line that is not pid and rss makes the text unreadable.
    Blank lines are skipped. This is the preserved-file sum, not the job-tree filter. -/
def foldEveryRealPsLine (acc : Option (Nat × List Nat)) (line : String) :
    Option (Nat × List Nat) :=
  match acc with
  | none => none
  | some (kibSum, seen) =>
    let trimmed := line.trimAscii.copy
    if trimmed == "" then
      some (kibSum, seen)
    else
      match psColumns trimmed with
      | pidText :: rssText :: _ =>
        match pidText.toNat?, rssText.toNat? with
        | some pid, some kib =>
          if psPidSeen pid seen then
            some (kibSum, seen)
          else
            some (kibSum + kib, pid :: seen)
        | _, _ => none
      | _ => none

/-- Resident bytes of every real ps line, times 1024. -/
def everyRealPsLineBytes (text : String) : Option Nat :=
  match (text.splitOn "\n").foldl foldEveryRealPsLine (some (0, [])) with
  | none => none
  | some (kibSum, _) => some (kibSum * 1024)

-- guard_pool_plus_lean_only_559419392_553373696_outside
-- (16736 + 529572) * 1024 = 559419392. (16736 + 523668) * 1024 = 553373696.
-- 604569600 <= 559419392 is false. Tolerance stays 1. These are not the file sums.
#guard
  (16736 + 529572) * 1024 == 559419392 &&
    (16736 + 523668) * 1024 == 553373696 &&
    (529572 - 523668) == 5904 &&
    (529572 - 523668) * 1024 == 6045696 &&
    withinLockedTolerance 559419392 553373696 == false &&
    absDiffBytes 559419392 553373696 * 100 == 604569600 &&
    Nat.max 559419392 553373696 * memoryCompareToleranceNumber == 559419392

-- guard_pairedSameProcessBytes_fulltree_job_tree_includes_lake
-- The job-tree reader counts pool, lake, and pinned Lean. It does not count systemd.
-- Those three are inside. They are not the eleven-line file sum.
#guard
  (16736 + 529572 + 830928) * 1024 == 1410289664 &&
    (16736 + 523668 + 830928) * 1024 == 1404243968 &&
    830928 * 1024 == 850870272 &&
    match pairedSameProcessBytes fullTree017CountedPsText fullTree016CountedPsText with
    | some (schedBytes, monBytes) =>
      schedBytes == 1410289664 &&
        monBytes == 1404243968 &&
        schedBytes != 559419392 &&
        monBytes != 553373696 &&
        withinLockedTolerance schedBytes monBytes == true &&
        absDiffBytes schedBytes monBytes == 6045696
    | none => false

/-- A scored pair exists only inside the 1 second timestamp window.
    Missing timestamps are not a pair. A wider gap is not a pair.
    The byte sums are every real pid line. Tolerance stays 1. -/
def scoredFullTreePair (schedTs monTs : Option Nat) (schedPs monPs : String) :
    Option (Nat × Nat) :=
  match schedTs, monTs, everyRealPsLineBytes schedPs, everyRealPsLineBytes monPs with
  | some a, some b, some left, some right =>
    if decide (natAbsDiff a b ≤ pairTimestampWindowSec) then
      some (left, right)
    else
      none
  | _, _, _, _ => none

-- guard_scoredFullTreePair_missing_timestamps_not_scored
-- A call with no timestamps is not a pair. These two files are not that call.
-- Their epochs are fullTree017EpochSec and fullTree016EpochSec.
#guard scoredFullTreePair none none fullTree017CountedPsText fullTree016CountedPsText == none

-- guard_scoredFullTreePair_two_second_gap_not_scored
-- The window is 1 second. 1793191298 is not the sample epoch of zfulltree000016.txt.
-- That epoch is 1793191295. Pool-plus-lean-only stays outside.
#guard
  withinLockedTolerance 559419392 553373696 == false &&
    scoredFullTreePair (some fullTree017EpochSec) (some 1793191298)
      fullTree017CountedPsText fullTree016CountedPsText == none

-- guard_scoredFullTreePair_file_epochs_inside
-- Sample epochs 1793191296 and 1793191295. The difference is 1.
-- 1 <= pairTimestampWindowSec, so the rule scores the pair.
-- Eleven lines on each side. Left bytes 1456685056. Right bytes 1450627072.
-- 605798400 <= 1456685056 is true. Pool-plus-lean-only stays outside.
#guard
  natAbsDiff fullTree017EpochSec fullTree016EpochSec == 1 &&
    everyRealPsLineBytes fullTree017CountedPsText == some 1456685056 &&
    everyRealPsLineBytes fullTree016CountedPsText == some 1450627072 &&
    match scoredFullTreePair (some fullTree017EpochSec) (some fullTree016EpochSec)
        fullTree017CountedPsText fullTree016CountedPsText with
    | some (left, right) =>
      left == 1456685056 &&
        right == 1450627072 &&
        left != 559419392 &&
        right != 553373696 &&
        left != 1410289664 &&
        right != 1404243968 &&
        withinLockedTolerance left right == true &&
        absDiffBytes left right == 6057984 &&
        absDiffBytes left right * 100 == 605798400 &&
        Nat.max left right * memoryCompareToleranceNumber == 1456685056 &&
        withinLockedTolerance 559419392 553373696 == false
    | none => false

-- guard_scoredFullTreePair_same_snapshot_inside
-- One file against itself. This is not zfulltree000016 versus zfulltree000017.
-- It does not move 559419392 versus 553373696 inside.
#guard
  withinLockedTolerance 559419392 553373696 == false &&
    match scoredFullTreePair (some fullTree017EpochSec) (some fullTree017EpochSec)
        fullTree017CountedPsText fullTree017CountedPsText with
    | some (left, right) =>
      left == 1456685056 &&
        right == 1456685056 &&
        withinLockedTolerance left right == true &&
        left != 559419392 &&
        left != 553373696
    | none => false

-- Previous official same-timestamp pairs from one SAMPLE clock each.
-- 1049374720 - 1043390464 = 5984256. 598425600 <= 1049374720.
-- 565981184 - 561565696 = 4415488. 441548800 <= 565981184.
-- guard_withinLockedTolerance_official_same_timestamp_pairs_inside
#guard withinLockedTolerance 1049374720 1043390464 == true &&
  withinLockedTolerance 565981184 561565696 == true

/-- Checkout prefix for a builder citation. A path that does not start here is rejected. -/
def builderCheckoutPrefix : String :=
  "/home/nixbuilder/iso/"

/-- True for `/tmp` and for any path under `/tmp/`. -/
def pathUnderTmp (path : String) : Bool :=
  path == "/tmp" || String.startsWith path "/tmp/"

/-- Missing and empty digests are both rejected. -/
def sha256Accepted (sha : Option String) : Bool :=
  match sha with
  | none => false
  | some value => value != ""

/-- One tool citation. `sha256` and `exitCode` use `none` for a missing field.
    Exit code 0 is not required for completeness. -/
structure CheckRecord where
  toolName : String
  canonicalCommand : String
  checkoutPath : String
  sha256 : Option String
  exitCode : Option Nat
  logLines : List String
  deriving Repr, BEq, DecidableEq

/-- Accept only a non-empty tool name, a non-empty canonical command,
    a checkout path under `/home/nixbuilder/iso/`, a non-empty sha256,
    a present exit code, and at least one log line.
    A path under `/tmp` is rejected. Exit code 0 is not required. -/
def checkRecordComplete (record : CheckRecord) : Bool :=
  record.toolName != "" &&
    record.canonicalCommand != "" &&
    String.startsWith record.checkoutPath builderCheckoutPrefix &&
    (!pathUnderTmp record.checkoutPath) &&
    sha256Accepted record.sha256 &&
    record.exitCode.isSome &&
    (!record.logLines.isEmpty)

/-- Fields for the accepted citation. The sha256 is a non-empty stand-in, not a measured digest. -/
def acceptedCheckRecord : CheckRecord where
  toolName := "slake-bootstrap"
  canonicalCommand :=
    "/nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap --slake-check SlakeCheckLogCompare"
  checkoutPath := "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean"
  sha256 := some "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
  exitCode := some 0
  logLines := ["WALK_DONE names=1 pass=1 fail=0"]

-- guard_checkRecordComplete_tmp_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  checkoutPath := "/tmp/somewhere" } == false

-- guard_checkRecordComplete_emptySha_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  sha256 := some "" } == false

-- guard_checkRecordComplete_missingSha_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  sha256 := none } == false

-- guard_checkRecordComplete_accepted
#guard checkRecordComplete acceptedCheckRecord == true

-- guard_checkRecordComplete_nonzeroExit_accepted
#guard checkRecordComplete { acceptedCheckRecord with
  exitCode := some 7 } == true

-- guard_checkRecordComplete_missingExit_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  exitCode := none } == false

-- guard_checkRecordComplete_emptyLog_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  logLines := [] } == false

-- guard_checkRecordComplete_emptyTool_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  toolName := "" } == false

-- guard_checkRecordComplete_emptyCommand_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  canonicalCommand := "" } == false

-- guard_checkRecordComplete_tmpExact_rejected
#guard checkRecordComplete { acceptedCheckRecord with
  checkoutPath := "/tmp" } == false

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

-- Compare and `--checks` stay `SlakeCheckLogCompare.main`.
-- A file-root `main` here clashes with Lake roots that import this module:
-- CheckPoolMain.lean:2222, CheckRecordMain.lean:147, and MemoryPairMain.lean:145
-- each report `main` has already been declared. `lean --run` needs a file-root
-- `main` in the script copy, not in this imported module.
