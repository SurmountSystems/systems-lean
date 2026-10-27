/-
SPDX-License-Identifier: Unlicense

Lake executable slake-check-pool.
Admission calls SlakeCheckLogCompare.admitWorker, ceilingAllows, and
disagreementResident. Each child is pinned Lean on the checkout file,
one Lean thread, under SlakeCheckLogCompare.niceBin.
This file does not invent a second --slake-check argv and it does not
enqueue the 2801-name pool.
-/

import SystemsLean.SlakeCheckLogCompare

abbrev workerStdio : IO.Process.StdioConfig :=
  { stdin := .null, stdout := .piped, stderr := .piped }

structure Captured where
  code : UInt32
  stdout : String
  stderr : String

structure ModuleRecord where
  index : Nat
  name : String
  exitCode : UInt32
  stdout : String
  stderr : String
  wallMs : Nat
  sha256 : Option String
  leanVersion : String

structure Running where
  index : Nat
  name : String
  task : Task (Except IO.Error ModuleRecord)
  childPid : Nat

structure Waited where
  record : ModuleRecord
  remaining : List Running

structure PoolArgs where
  modules : List String
  namesFile : Option String
  monitorLog : Option String
  schedulerLog : Option String

structure SchedState where
  pending : List String
  live : List Running
  nextIndex : Nat
  peak : Nat
  sumFlight : Nat
  samples : Nat
  flightSamples : List Nat
  pass : Nat
  fail : Nat
  ceilingHeld : Bool
  leanVersion : String
  monitorLog : Option String
  schedulerLog : Option String

/-- Why a peak below the cap is not an idle slot. The run log prints this sentence. -/
def queueExpectation (queue cap : Nat) : String :=
  if queue < cap then
    s!"Fewer than {cap} workers is expected because the queue length is {queue}."
  else
    s!"Queue length is {queue}."

def ceilingHeldLine (held : Bool) : String :=
  s!"CEILING held_any_launch={if held then "true" else "false"}\n"

#guard queueExpectation 2 32 ==
  "Fewer than 32 workers is expected because the queue length is 2."

def usage : String :=
  "slake-check-pool (--module NAME | --names FILE) " ++
  "[--monitor-log FILE] [--scheduler-log FILE]\n" ++
  "At most 32 children. Does not start the 2801-name pool.\n"

def parsePoolArgs (args : List String) : Except String PoolArgs :=
  go { modules := [], namesFile := none, monitorLog := none, schedulerLog := none } args
where
  go (acc : PoolArgs) : List String → Except String PoolArgs
    | [] => Except.ok acc
    | "--" :: rest => go acc rest
    | "--module" :: name :: rest =>
      go { acc with modules := acc.modules ++ [name] } rest
    | "--names" :: path :: rest =>
      go { acc with namesFile := some path } rest
    | "--monitor-log" :: path :: rest =>
      go { acc with monitorLog := some path } rest
    | "--scheduler-log" :: path :: rest =>
      go { acc with schedulerLog := some path } rest
    | _ => Except.error usage

def words (line : String) : List String :=
  (line.splitOn " ").filter fun word => word != ""

/-- `ps -o rss=` prints a leading space, the kibibyte count, and a newline.
    Trim before parsing. Bytes are that count times 1024. -/
def parseLeadingNat (text : String) : Option Nat :=
  let trimmed := text.trimAscii.copy
  match words trimmed with
  | n :: _ => n.toNat?
  | [] => none

-- guard_parseLeadingNat_ps_rss_leading_space_newline
#guard parseLeadingNat " 15852\n" == some 15852

-- guard_parseLeadingNat_kib_times_1024
#guard (match parseLeadingNat " 15852\n" with
  | some kib => kib * 1024
  | none => 0) == 16232448

def lineKVs (line : String) : List (String × String) :=
  (line.splitOn " ").filterMap SlakeCheckLogCompare.parseKV

def kvNat (key : String) (toks : List (String × String)) : Option Nat :=
  match toks with
  | [] => none
  | (k, v) :: rest =>
    if k == key then v.toNat? else kvNat key rest

def capture (cmd : String) (args : Array String) : IO Captured := do
  let child ← IO.Process.spawn {
    cmd := cmd
    args := args
    stdin := .null
    stdout := .piped
    stderr := .piped
    inheritEnv := true
  }
  -- Read both pipes before wait. A later wait must not drop the bytes.
  let stdout ← child.stdout.readToEnd
  let stderr ← child.stderr.readToEnd
  let code ← child.wait
  return { code, stdout, stderr }

def ownPid : IO Nat := do
  let stat ← IO.FS.readFile "/proc/self/stat"
  match words stat with
  | n :: _ =>
    match n.toNat? with
    | some pid => return pid
    | none => throw (IO.userError "scheduler pid unreadable")
  | [] => throw (IO.userError "scheduler pid unreadable")

/-- `ps` with an explicit column list. `PS_FORMAT` must not add a column in front of rss. -/
def capturePs (args : Array String) : IO Captured := do
  let child ← IO.Process.spawn {
    cmd := "/run/current-system/sw/bin/ps"
    args := args
    stdin := .null
    stdout := .piped
    stderr := .piped
    inheritEnv := true
    env := #[("PS_FORMAT", none), ("COLUMNS", some "240")]
  }
  let stdout ← child.stdout.readToEnd
  let stderr ← child.stderr.readToEnd
  let code ← child.wait
  return { code, stdout, stderr }

def rssKib (pid : Nat) : IO (Option Nat) := do
  let got ← capturePs #["-o", "rss=", "-p", toString pid]
  if got.code != 0 then
    return none
  else
    return parseLeadingNat got.stdout

def rssBytes (pid : Nat) : IO (Option Nat) := do
  match ← rssKib pid with
  | some kib => return some (kib * 1024)
  | none => return none

/-- Second field of `ps -o pid=,rss=,args=`. A line that is not pid, rss, args is unreadable. -/
def workerRssKib (line : String) : Option Nat :=
  match words line.trimAscii.copy with
  | _pid :: rss :: _ => rss.toNat?
  | _ => none

/-- `none` if any line is unreadable. An empty list is a read of zero workers, not a guessed zero from a failed ps. -/
def workerRssKibs : List String → Option (List Nat)
  | [] => some []
  | line :: rest =>
    match workerRssKib line, workerRssKibs rest with
    | some kib, some more => some (kib :: more)
    | _, _ => none

def childWorkerKibs (pid : Nat) : IO (Option (List Nat)) := do
  let got ← capture "/run/current-system/sw/bin/ps"
    #["-o", "pid=,rss=,args=", "--ppid", toString pid]
  if got.code != 0 then
    return none
  else
    let lines := (got.stdout.splitOn "\n").filter fun line =>
      line.trimAscii.copy != ""
    return workerRssKibs lines

/-- One ps capture per sample. A second capture would be a different instant. -/
def rssReadBound : Nat := 1

/-- Scheduler kibibytes plus each worker kibibyte, times 1024.
    `none` means the worker list could not be read.
    An empty list while workers are expected is not published as the scheduler alone.
    Captured inputs from memory-monitor-run3.txt and scheduler-run-3-stdout.txt:
    self 15936, workers 88576 and 87612, tree (15936 + 88576 + 87612) * 1024
    = 196734976. The largest SAMPLE resident_bytes was 108367872, which omitted
    the workers. 88367104 * 100 = 8836710400 is greater than 196734976 * 1. -/
def sumNat : List Nat → Nat
  | [] => 0
  | n :: rest => n + sumNat rest

def publishedResidentBytes
    (selfKib : Nat) (workerKibs : Option (List Nat)) (workersExpected : Bool) : Option Nat :=
  match workerKibs with
  | none => none
  | some ks =>
    if workersExpected && ks.isEmpty then
      none
    else
      some ((selfKib + sumNat ks) * 1024)

-- guard_publishedResidentBytes_captured_omitted_workers
-- Fails while publication omits the workers. Passes only on the tree sum.
#guard
  (publishedResidentBytes 15936 (some [88576, 87612]) true ==
      some ((15936 + 88576 + 87612) * 1024)) &&
    (publishedResidentBytes 15936 (some [88576, 87612]) true != some 108367872)

-- guard_publishedResidentBytes_unreadable_workers_not_scheduler_only
#guard publishedResidentBytes 15936 none true == none

-- guard_publishedResidentBytes_empty_list_while_expected_not_silent_zero
#guard publishedResidentBytes 15936 (some []) true == none

-- guard_publishedResidentBytes_no_workers_expected_is_scheduler
#guard publishedResidentBytes 15936 (some []) false == some (15936 * 1024)

/-- Captured `ps -o pid=,rss=,args=` worker lines at ts=1793062287.
    Scheduler rss was 15796. Workers were 90312 and 89552. -/
def capturedWorkerPsLines : List String := [
  "1816580 90312 /nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap --slake-check SimdTargetFeatures",
  "1816589 89552 /nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap --slake-check SlakeCheckLogCompare"
]

def linePid (line : String) : Option Nat :=
  match words (line.trimAscii.copy) with
  | pid :: _ => pid.toNat?
  | [] => none

def pidSeen (pid : Nat) : List Nat → Bool
  | [] => false
  | found :: rest => found == pid || pidSeen pid rest

def dedupePidLinesAux (seen : List Nat) : List String → List String
  | [] => []
  | line :: rest =>
    match linePid line with
    | some pid =>
      if pidSeen pid seen then
        dedupePidLinesAux seen rest
      else
        line :: dedupePidLinesAux (pid :: seen) rest
    | none => line :: dedupePidLinesAux seen rest

def dedupePidLines (lines : List String) : List String :=
  dedupePidLinesAux [] lines

def mentionsBootstrap (line : String) : Bool :=
  (line.splitOn "slake-bootstrap").length > 1

/-- RSS of a slake-bootstrap line. A line that is not that worker is skipped.
    A bootstrap line that is not pid, rss, args is unreadable. -/
def bootstrapRssKib (line : String) : Option (Option Nat) :=
  if mentionsBootstrap line then
    match workerRssKib line with
    | some kib => some (some kib)
    | none => none
  else
    some none

def bootstrapRssKibs : List String → Option (List Nat)
  | [] => some []
  | line :: rest =>
    match bootstrapRssKib line, bootstrapRssKibs rest with
    | some (some kib), some more => some (kib :: more)
    | some none, some more => some more
    | _, _ => none

/-- SAMPLE resident_bytes from scheduler kibibytes plus each slake-bootstrap
    line in the ps snapshot. Duplicate pids count once. An empty bootstrap
    list while workers are expected is not the scheduler alone.
    Captured lines at ts=1793062287: 15796 + 90312 + 89552, times 1024,
    is 200355840. The live publisher returned 119390208. -/
def sampleResidentFromPsLines
    (selfKib : Nat) (lines : List String) (workersExpected : Bool) : Option Nat :=
  publishedResidentBytes selfKib (bootstrapRssKibs (dedupePidLines lines)) workersExpected

-- guard_sampleResidentFromPsLines_live_tree
-- Fails while the publisher returns 119390208 for the captured worker lines.
-- Passes only on (15796 + 90312 + 89552) * 1024 = 200355840.
#guard
  (sampleResidentFromPsLines 15796 capturedWorkerPsLines true ==
      some ((15796 + 90312 + 89552) * 1024)) &&
    (sampleResidentFromPsLines 15796 capturedWorkerPsLines true != some 119390208)

-- guard_sampleResidentFromPsLines_duplicate_pid_not_double
#guard
  sampleResidentFromPsLines 15796 (capturedWorkerPsLines ++ capturedWorkerPsLines) true ==
    some ((15796 + 90312 + 89552) * 1024)

def psPidRssArgs : String := "pid:20=,rss:20=,args="

/-- Milliseconds to wait after two workers exist so both RSS values are in ps.
    The in-flight sample used to run at spawn, before the second worker's RSS. -/
def workerRssSettleMs : UInt32 := 200

def psTextLines (args : Array String) : IO (List String) := do
  let got ← capturePs args
  return (got.stdout.splitOn "\n").filter fun line => line.trimAscii.copy != ""

def pidTreeLines : List Nat → IO (List String)
  | [] => return []
  | pid :: rest => do
    let selfLines ← psTextLines #["-o", psPidRssArgs, "-p", toString pid]
    let kidLines ← psTextLines #["-o", psPidRssArgs, "--ppid", toString pid]
    let more ← pidTreeLines rest
    return selfLines ++ kidLines ++ more

structure OnePsSample where
  bytes : Option Nat
  monitorFile : String
  octets : Nat

/-- Immutable `ps -o pid=,rss=,args=` texts written by the independent monitor.
    The scheduler reads one of those files. It does not spawn `ps` for the sample. -/
def monitorPsDir : System.FilePath :=
  "/tmp/slake-monitor-ps-one-live"

/-- Published `resident_bytes` for one sample. The only input is the monitor ps text.
    Lake RSS is not added. A `lean --version` process is not added. -/
def publishedFromMonitorPs (text : String) : Option Nat :=
  SlakeCheckLogCompare.capturedPsResidentBytes text

-- guard_publishedFromMonitorPs_sample2_one_text
-- Hand sum 16140 + 90208, times 1024. Lake rss 832436 stays out. No second ps text.
#guard
  (publishedFromMonitorPs SlakeCheckLogCompare.capturedOnePsSample2Text ==
      some ((16140 + 90208) * 1024)) &&
    (publishedFromMonitorPs SlakeCheckLogCompare.capturedOnePsSample2Text !=
      some ((16140 + 90208 + 832436) * 1024))

def newerSnapshotName (best : Option String) (name : String) : Option String :=
  if !String.endsWith name ".txt" || String.startsWith name "." then
    best
  else
    match best with
    | none => some name
    | some prev => if prev < name then some name else some prev

def latestSnapshotName (names : List String) : Option String :=
  names.foldl newerSnapshotName none

def textHasBootstrap (text : String) : Bool :=
  (text.splitOn "slake-bootstrap").length > 1

def readLatestMonitorText : IO (Option (String × String)) := do
  let entries ←
    try
      monitorPsDir.readDir
    catch _ =>
      pure (#[] : Array IO.FS.DirEntry)
  let names := entries.toList.map fun ent => ent.fileName
  match latestSnapshotName names with
  | none => return none
  | some name =>
    let path := monitorPsDir / name
    let text ←
      try
        IO.FS.readFile path
      catch _ =>
        pure ""
    if text == "" then
      return none
    else
      return some (path.toString, text)

/-- Read one monitor ps text. When workers are expected, wait until that text
    lists a `slake-bootstrap` line, or until the wait steps end.
    This function does not spawn `ps`. -/
def awaitMonitorSample (workersExpected : Bool) : IO OnePsSample := do
  if workersExpected then
    IO.sleep workerRssSettleMs
  let mut last : OnePsSample := { bytes := none, monitorFile := "missing", octets := 0 }
  let mut done := false
  for _step in List.range 20 do
    if !done then
      match ← readLatestMonitorText with
      | none =>
        IO.sleep 50
      | some (path, text) =>
        let parsed := publishedFromMonitorPs text
        last := { bytes := parsed, monitorFile := path, octets := text.length }
        let workersSeen := !workersExpected || textHasBootstrap text
        if parsed.isSome && workersSeen then
          done := true
        else
          IO.sleep 50
  return last

/-- One sample reads one monitor file. `sampleIndex` is unused because the
    monitor names the file. The scheduler does not spawn `ps`. -/
def treeRssOnce (workersExpected : Bool) (_sampleIndex : Nat) : IO OnePsSample :=
  awaitMonitorSample workersExpected

def treeRssBytes (workersExpected : Bool) (sampleIndex : Nat) : IO OnePsSample := do
  treeRssOnce workersExpected sampleIndex

def parseCapturedPsMain (path : String) : IO UInt32 := do
  let text ←
    try
      IO.FS.readFile path
    catch _ =>
      pure ""
  if text == "" then
    IO.eprintln "RESIDENT_BYTES missing"
    return 1
  else
    match SlakeCheckLogCompare.capturedPsResidentBytes text with
    | some n =>
      IO.println s!"RESIDENT_BYTES {n}"
      return 0
    | none =>
      IO.eprintln "RESIDENT_BYTES missing"
      return 1

def epochSec : IO (Option Nat) := do
  let got ← capture "/run/current-system/sw/bin/date" #["+%s"]
  if got.code != 0 then return none else return parseLeadingNat got.stdout

def epochMs : IO Nat := do
  let got ← capture "/run/current-system/sw/bin/date" #["+%s%3N"]
  match parseLeadingNat got.stdout with
  | some n => return n
  | none => return 0

def oneLine (text : String) : String :=
  String.intercalate " " ((text.splitOn "\n").filter fun line =>
    line.trimAscii.copy != "")

def leanVersionText : IO String := do
  let bin := s!"{SlakeCheckLogCompare.leanSysroot}/bin/lean"
  let got ← capture bin #["--version"]
  let text := if got.stdout.trimAscii.copy == "" then got.stderr else got.stdout
  return oneLine text

def moduleSource (name : String) : System.FilePath :=
  let rel := String.intercalate "/" (name.splitOn ".")
  SlakeCheckLogCompare.checkCwd / "src" / "systems" / "SystemsLean" / (rel ++ ".lean")

/-- Pinned Lean on the checkout file. One thread. Not a `--slake-check` argv. -/
def workerArgv (name : String) : Array String :=
  #[
    "-n", "19",
    "/run/current-system/sw/bin/env",
    "LEAN_NUM_THREADS=1",
    s!"{SlakeCheckLogCompare.leanSysroot}/bin/lean",
    (moduleSource name).toString
  ]

def fileSha256 (path : System.FilePath) : IO (Option String) := do
  let got ← capture "/run/current-system/sw/bin/sha256sum" #[path.toString]
  if got.code != 0 then
    return none
  else
    match words got.stdout with
    | hex :: _ => return some hex
    | [] => return none

def considerMonitor (acc : Option Nat) (line : String) : Option Nat :=
  let toks := lineKVs line
  match kvNat "ts" toks with
  | none => acc
  | some _ =>
    match kvNat "rss_kib" toks with
    | some kib => some (kib * 1024)
    | none =>
      match kvNat "resident_bytes" toks with
      | some bytes => some bytes
      | none => acc

def latestMonitorBytes (text : String) : Option Nat :=
  (text.splitOn "\n").foldl considerMonitor none

def monitorBytes (path : Option String) : IO (Option Nat) := do
  match path with
  | none => return none
  | some p =>
    let text ←
      try
        IO.FS.readFile p
      catch _ =>
        pure ""
    return latestMonitorBytes text

def nonemptyLines (text : String) : List String :=
  (text.splitOn "\n").filterMap fun line =>
    let trimmed := line.trimAscii.copy
    if trimmed == "" then none else some trimmed

def loadNames (args : PoolArgs) : IO (List String) := do
  let fromFile ←
    match args.namesFile with
    | none => pure []
    | some path =>
      let text ← IO.FS.readFile path
      pure (nonemptyLines text)
  return args.modules ++ fromFile

def emitText (st : SchedState) (text : String) : IO Unit := do
  IO.print text
  match st.schedulerLog with
  | none => pure ()
  | some path =>
    let prev ←
      try
        IO.FS.readFile path
      catch _ =>
        pure ""
    IO.FS.writeFile path (prev ++ text)

def shaText (sha : Option String) : String :=
  match sha with
  | none => "missing"
  | some value => value

def renderRecord (r : ModuleRecord) : String :=
  s!"MODULE name={r.name} exit={r.exitCode} sha256={shaText r.sha256} " ++
  s!"wall_ms={r.wallMs}\n" ++
  s!"LEAN_VERSION {r.leanVersion}\n" ++
  s!"STDOUT\n{r.stdout}" ++
  (if r.stdout.endsWith "\n" then "" else "\n") ++
  s!"END_STDOUT\nSTDERR\n{r.stderr}" ++
  (if r.stderr.endsWith "\n" then "" else "\n") ++
  "END_STDERR\n"

def spawnRunning (index : Nat) (name : String) (leanVersion : String) : IO Running := do
  let started ← epochMs
  let child ← IO.Process.spawn {
    cmd := SlakeCheckLogCompare.niceBin
    args := workerArgv name
    cwd := some SlakeCheckLogCompare.checkCwd
    stdin := .null
    stdout := .piped
    stderr := .piped
    inheritEnv := true
  }
  let childPid := child.pid.toNat
  let act : IO ModuleRecord := do
    let stdoutTask ← IO.asTask child.stdout.readToEnd Task.Priority.dedicated
    let stderrTask ← IO.asTask child.stderr.readToEnd Task.Priority.dedicated
    let code ← child.wait
    let stdout ← IO.ofExcept stdoutTask.get
    let stderr ← IO.ofExcept stderrTask.get
    let ended ← epochMs
    let sha ← fileSha256 (moduleSource name)
    let wall := if ended >= started then ended - started else 0
    return {
      index
      name
      exitCode := code
      stdout
      stderr
      wallMs := wall
      sha256 := sha
      leanVersion
    }
  let task ← IO.asTask act Task.Priority.dedicated
  return { index, name, task, childPid }

def waitOne (live : List Running) : IO Waited := do
  match live with
  | [] => throw (IO.userError "pool wait with nothing in flight")
  | slot :: rest =>
    have hlen : 0 < (slot.task :: rest.map (fun item => item.task)).length := by
      rw [List.length_cons]
      apply Nat.zero_lt_succ
    let (result, _) ← IO.waitAny'
      (slot.task :: rest.map (fun item => item.task)) hlen
    match result with
    | Except.error err => throw err
    | Except.ok done =>
      let remaining := live.filter fun item => item.index != done.index
      return { record := done, remaining }

def sampleLine
    (ts schedBytes monBytes projected : Option Nat) (inFlight queued : Nat) : String :=
  let tsText := match ts with | some n => toString n | none => "missing"
  let schedText := match schedBytes with | some n => toString n | none => "missing"
  let monText := match monBytes with | some n => toString n | none => "absent"
  let projText := match projected with | some n => toString n | none => "missing"
  s!"SAMPLE ts={tsText} resident_bytes={schedText} monitor_bytes={monText} " ++
  s!"projected={projText} in_flight={inFlight} queued={queued}\n"

def noteFinished (st : SchedState) (r : ModuleRecord) : SchedState :=
  if r.exitCode == 0 then
    { st with pass := st.pass + 1 }
  else
    { st with fail := st.fail + 1 }

/-- A missing resident reading is not a ceiling hold.
    A ceiling hold requires a present reading above the launch gate. -/
def readingIsCeilingHold (reading : Option Nat) : Bool :=
  match reading with
  | none => false
  | some bytes => !SlakeCheckLogCompare.ceilingAllows bytes

/-- A present reading under the ceiling, with queued work and fewer than 32
    workers, admits one launch. A missing reading does not. -/
def admitLaunch (reading : Option Nat) (inFlight queued : Nat) : Bool :=
  match reading with
  | none => false
  | some bytes =>
    SlakeCheckLogCompare.ceilingAllows bytes &&
      SlakeCheckLogCompare.admitWorker inFlight queued

-- guard_missing_reading_not_ceiling_hold
#guard readingIsCeilingHold none == false

-- guard_under_ceiling_queued_admits_launch
#guard admitLaunch (some (15852 * 1024)) 0 2 == true

/-- Integer mean of in-flight counts. Nat division truncates toward zero.
    An empty list is 0. The schedule line prints this integer, not a fraction. -/
def concurrencyAverage (samples : List Nat) : Nat :=
  let n := samples.length
  if n == 0 then 0 else samples.foldl Nat.add 0 / n

-- Samples 0, 1, 2, 1, 0. The sum of those counts, divided by the sample count, truncates to 0.
-- guard_concurrencyAverage_samples_0_1_2_1_0
#guard concurrencyAverage [0, 1, 2, 1, 0] == 0

partial def schedule (st : SchedState) : IO UInt32 := do
  let inFlight := st.live.length
  let queued := st.pending.length
  let st := {
    st with
    peak := Nat.max st.peak inFlight
    sumFlight := st.sumFlight + inFlight
    samples := st.samples + 1
    flightSamples := inFlight :: st.flightSamples
  }
  let sampled ← treeRssBytes (inFlight != 0) st.samples
  emitText st
    (s!"MONITOR_PS sample={st.samples} file={sampled.monitorFile} " ++
      s!"length={sampled.octets} tool=/run/current-system/sw/bin/ps " ++
      "source=monitor_ps_text scheduler_spawned_ps=false\n")
  let schedBytes := sampled.bytes
  let monBytes ← monitorBytes st.monitorLog
  let projected : Option Nat :=
    match schedBytes with
    | none => none
    | some sched =>
      match monBytes with
      | some mon => some (SlakeCheckLogCompare.disagreementResident sched mon)
      | none => some (SlakeCheckLogCompare.disagreementResident sched sched)
  let ceilingHold := readingIsCeilingHold projected
  let launch := admitLaunch projected inFlight queued
  let underCeiling :=
    match projected with
    | none => false
    | some bytes => SlakeCheckLogCompare.ceilingAllows bytes
  let ts ← epochSec
  emitText st (sampleLine ts schedBytes monBytes projected inFlight queued)
  let cap := SlakeCheckLogCompare.concurrentChecks
  if launch then
    match st.pending with
    | [] =>
      emitText st "IDLE work queued and ceiling was not holding\n"
      emitText st (ceilingHeldLine st.ceilingHeld)
      return 1
    | name :: rest =>
      let running ← spawnRunning st.nextIndex name st.leanVersion
      schedule {
        st with
        pending := rest
        live := st.live ++ [running]
        nextIndex := st.nextIndex + 1
      }
  else if !st.pending.isEmpty && projected.isNone then
    emitText st
      (s!"FAIL scheduler-reading-missing attempts={rssReadBound} " ++
        s!"in_flight={inFlight} queued={queued}\n")
    emitText st (ceilingHeldLine st.ceilingHeld)
    return 1
  else if !st.pending.isEmpty && inFlight < cap && underCeiling && !launch then
    emitText st "IDLE work queued and ceiling was not holding\n"
    emitText st (ceilingHeldLine st.ceilingHeld)
    return 1
  else if st.pending.isEmpty && st.live.isEmpty then
    let average := concurrencyAverage st.flightSamples
    emitText st
      (s!"SCHEDULE_DONE names={st.nextIndex} pass={st.pass} fail={st.fail} " ++
        s!"peak={st.peak} average={average}\n")
    emitText st (ceilingHeldLine st.ceilingHeld)
    return 0
  else if ceilingHold && !st.pending.isEmpty && inFlight < cap then
    match projected with
    | none =>
      emitText st
        (s!"FAIL scheduler-reading-missing attempts={rssReadBound} " ++
          s!"in_flight={inFlight} queued={queued}\n")
      emitText st (ceilingHeldLine st.ceilingHeld)
      return 1
    | some bytes =>
      let st := { st with ceilingHeld := true }
      let monNote := if monBytes.isSome then "" else " monitor=absent"
      emitText st
        (s!"HOLD ceiling holding projected={bytes} " ++
          s!"ceiling={SlakeCheckLogCompare.launchCeilingBytes} " ++
          s!"in_flight={inFlight} queued={queued}{monNote}\n")
      if st.live.isEmpty then
        IO.sleep 1000
        schedule st
      else
        let waited ← waitOne st.live
        emitText st (renderRecord waited.record)
        schedule (noteFinished { st with live := waited.remaining } waited.record)
  else if !st.live.isEmpty then
    let waited ← waitOne st.live
    emitText st (renderRecord waited.record)
    schedule (noteFinished { st with live := waited.remaining } waited.record)
  else
    emitText st "IDLE work queued and ceiling was not holding\n"
    emitText st (ceilingHeldLine st.ceilingHeld)
    return 1

def mainPool (args : List String) : IO UInt32 := do
  match parsePoolArgs args with
  | Except.error msg =>
    IO.eprintln msg
    return 2
  | Except.ok parsed =>
    let names ← loadNames parsed
    if names.isEmpty then
      IO.eprintln usage
      return 2
    else
      let version ← leanVersionText
      let st : SchedState := {
        pending := names
        live := []
        nextIndex := 0
        peak := 0
        sumFlight := 0
        samples := 0
        flightSamples := []
        pass := 0
        fail := 0
        ceilingHeld := false
        leanVersion := version
        monitorLog := parsed.monitorLog
        schedulerLog := parsed.schedulerLog
      }
      let queueLen := names.length
      emitText st
        (s!"SCHEDULER tool=slake-check-pool " ++
          s!"cap={SlakeCheckLogCompare.concurrentChecks} " ++
          s!"ceiling={SlakeCheckLogCompare.launchCeilingBytes} " ++
          s!"queue={queueLen}\n")
      emitText st (queueExpectation queueLen SlakeCheckLogCompare.concurrentChecks ++ "\n")
      schedule st

def main (args : List String) : IO UInt32 := do
  match args with
  | "--parse-captured-ps" :: path :: _ =>
    parseCapturedPsMain path
  | _ =>
    mainPool args
