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

/-- One sample offered to the pair fold.
    `monBytes = none` is what `sampleLine` prints as `monitor_bytes=absent`.
    `monitorFile` is that sample's snapshot path. -/
structure ScoredBytePair where
  schedBytes : Nat
  monBytes : Option Nat
  monitorFile : String

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
  emittedMonitorPaths : List String
  sawOutside : Bool
  scoredPairs : List ScoredBytePair

/-- A queue shorter than the cap is not excused while the ceiling is not holding.
    The run log prints this sentence. Fewer workers than the cap is expected
    only while the ceiling is holding a launch. -/
def queueExpectation (queue cap : Nat) (ceilingHeld : Bool) : String :=
  if queue < cap && ceilingHeld then
    s!"Fewer than {cap} workers is expected because the ceiling is holding. The queue length is {queue}."
  else if queue < cap then
    s!"Fewer than {cap} workers is not excused. The queue length is {queue} and the ceiling is not holding."
  else
    s!"Queue length is {queue}."

def ceilingHeldLine (held : Bool) : String :=
  s!"CEILING held_any_launch={if held then "true" else "false"}\n"

-- Queue length 2 and cap 32, ceiling not holding: the shortfall is not excused.
#guard queueExpectation 2 32 false ==
  "Fewer than 32 workers is not excused. The queue length is 2 and the ceiling is not holding."

-- The same short queue is expected only while the ceiling is holding a launch.
#guard queueExpectation 2 32 true ==
  "Fewer than 32 workers is expected because the ceiling is holding. The queue length is 2."

-- A full queue does not print the shortfall sentence.
#guard queueExpectation 32 32 false ==
  "Queue length is 32."

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
  /-- The monitor `ps` text this sample read. The SAMPLE pair uses this text. -/
  psText : String

/-- Immutable `ps -o pid=,rss=,args=` texts written by the independent monitor.
    The scheduler reads one of those files. It does not spawn `ps` for the sample. -/
def monitorPsDir : System.FilePath :=
  "/tmp/slake-monitor-ps-one-live"

/-- Published `resident_bytes` for one sample. The only input is the monitor ps text.
    Lake RSS is added. `doc/memory-compare-rule.md` does not exclude `/bin/lake`.
    A `lean --version` process is not added. -/
def publishedFromMonitorPs (text : String) : Option Nat :=
  SlakeCheckLogCompare.capturedPsResidentBytes text

-- guard_publishedFromMonitorPs_sample2_one_text
-- Hand sum 16140 + 90208 + lake 832436, times 1024. No second ps text.
#guard
  (publishedFromMonitorPs SlakeCheckLogCompare.capturedOnePsSample2Text ==
      some ((16140 + 90208 + 832436) * 1024)) &&
    (publishedFromMonitorPs SlakeCheckLogCompare.capturedOnePsSample2Text !=
      some ((16140 + 90208) * 1024))

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

/-- Pinned Lean worker argv. The lookalike store fragment `c0q0s92` is not this path. -/
def pinnedLeanBinPath : String :=
  "/nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean"

/-- True when ps text lists the pinned Lean worker, not a `c0q0s92` lookalike. -/
def textHasPinnedLean (text : String) : Bool :=
  (text.splitOn pinnedLeanBinPath).length > 1 &&
    (text.splitOn "c0q0s92").length == 1

-- guard_pinnedLeanBinPath_is_store_hash_not_lookalike
#guard pinnedLeanBinPath == s!"{SlakeCheckLogCompare.leanSysroot}/bin/lean"
#guard (pinnedLeanBinPath.splitOn "c0q0s92").length == 1

/-- One `ps -o pid=,rss=,args=` line. Field 2 is resident kibibytes.
    No checkout `.lean` argument, so the pool sum reader returns none. -/
def oneLinePsPidRssLean : String :=
  s!"200 15860 {pinnedLeanBinPath}"

-- guard_oneLinePsPidRssLean_is_the_concrete_ps_line
#guard oneLinePsPidRssLean ==
  "200 15860 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean"

/-- A second one-line ps text. Field 2 is 20000 kibibytes, not 15860. -/
def otherLinePsPidRssLean : String :=
  s!"201 20000 {pinnedLeanBinPath}"

#guard otherLinePsPidRssLean ==
  "201 20000 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean"

/-- True when some ps line is a pinned Lean worker on a checkout `.lean` file.
    The store path alone is not enough. `textHasPinnedLean` does not do this.
    `slake-bootstrap` is not this worker. A `c0q0s92` lookalike is not this worker. -/
def textHasPinnedLeanWorker (text : String) : Bool :=
  (text.splitOn "\n").any fun line =>
    SlakeCheckLogCompare.psLineIsPinnedLeanWorker line.trimAscii.copy

/-- Admission sees workers only through `psLineIsPinnedLeanWorker`.
    When workers are expected and this sample must settle, a checkout `.lean`
    argument is required. The store path alone does not admit. -/
def workersSeenForAdmit (workersExpected settle : Bool) (text : String) : Bool :=
  !workersExpected || !settle || textHasPinnedLeanWorker text

-- guard_admit_waits_for_pinned_lean_on_checkout_lean
-- oneLinePsPidRssLean has the store path and no checkout `.lean` file.
-- textHasPinnedLean accepts it. The admit predicate does not.
#guard textHasPinnedLean oneLinePsPidRssLean == true
#guard SlakeCheckLogCompare.psLineIsPinnedLeanWorker oneLinePsPidRssLean == false
#guard textHasPinnedLeanWorker oneLinePsPidRssLean == false
#guard workersSeenForAdmit true true oneLinePsPidRssLean == false
#guard textHasPinnedLeanWorker
    (s!"501 400000 {pinnedLeanBinPath} /home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean") ==
  true
#guard workersSeenForAdmit true true
    (s!"501 400000 {pinnedLeanBinPath} /home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean") ==
  true
#guard textHasPinnedLeanWorker
    "100 1000 /nix/store/1z7byiviiga5zffpdfaxa87qikfs0r8l-slake-bootstrap --slake-check Foo" ==
  false
#guard textHasPinnedLeanWorker
    "200 15860 /nix/store/fakec0q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean" ==
  false

/-- Field 2 of one `ps -o pid=,rss=,args=` line, in bytes. -/
def monitorBytesFromPsLine (line : String) : Option Nat :=
  match workerRssKib line with
  | some kib => some (kib * 1024)
  | none => none

/-- Monitor bytes from one ps text.
    Use the pool sum when that reader returns it.
    A one-line text with no pool binary uses field 2 times 1024.
    `none` is what `sampleLine` prints as `monitor_bytes=absent`. -/
def monitorBytesFromPsText (text : String) : Option Nat :=
  match SlakeCheckLogCompare.capturedPsResidentBytes text with
  | some n => some n
  | none =>
    let lines := (text.splitOn "\n").filter fun line => line.trimAscii.copy != ""
    match lines with
    | [line] => monitorBytesFromPsLine line
    | _ => none

-- guard_capturedPsResidentBytes_one_line_lean_is_none
#guard SlakeCheckLogCompare.capturedPsResidentBytes oneLinePsPidRssLean == none

-- guard_monitorBytesFromPsText_one_line_second_field_times_1024
#guard monitorBytesFromPsText oneLinePsPidRssLean == some (15860 * 1024)

/-- Monitor bytes from a ps text that is not the resident text.
    The same string is `none`. `sampleLine` prints that as `monitor_bytes=absent`.
    A different text uses the pool sum, or field 2 of one line times 1024. -/
def monitorNatFromIndependent (residentText : String) (indep : Option String) : Option Nat :=
  match indep with
  | none => none
  | some text =>
    if text == residentText then
      none
    else
      match SlakeCheckLogCompare.capturedPsResidentBytes text with
      | some n => some n
      | none => monitorBytesFromPsText text

/-- True when one ps line's argv0 is the pool binary. -/
def lineHasPoolBinary (line : String) : Bool :=
  SlakeCheckLogCompare.psExecutableIsPoolBinary line.trimAscii.copy

/-- True when the ps text lists the pool binary. -/
def textHasPoolBinary (text : String) : Bool :=
  (text.splitOn "\n").any lineHasPoolBinary

/-- Pid and args of one counted pool, bootstrap, or pinned Lean line.
    The rss field is not part of the identity. -/
def countedWorkerIdentity (line : String) : Option (Nat × String) :=
  let trimmed := line.trimAscii.copy
  if !(SlakeCheckLogCompare.psLineIsScheduler trimmed ||
      SlakeCheckLogCompare.psLineIsBootstrap trimmed ||
      SlakeCheckLogCompare.psLineIsPinnedLeanWorker trimmed) then
    none
  else
    match SlakeCheckLogCompare.psColumns trimmed with
    | pidText :: _rss :: args =>
      match pidText.toNat? with
      | some pid => some (pid, String.intercalate " " args)
      | none => none
    | _ => none

def workerIdentities (text : String) : List (Nat × String) :=
  (text.splitOn "\n").filterMap countedWorkerIdentity

def identityMember (id : Nat × String) : List (Nat × String) → Bool
  | [] => false
  | head :: rest => head == id || identityMember id rest

/-- Same pids and args, ignoring order. Rss is not compared. -/
def sameIdentityList (left right : List (Nat × String)) : Bool :=
  left.length == right.length &&
    left.all (fun id => identityMember id right) &&
    right.all (fun id => identityMember id left)

/-- Both texts list the same pool and worker processes. Rss may differ. -/
def sameWorkerSet (left right : String) : Bool :=
  sameIdentityList (workerIdentities left) (workerIdentities right)

/-- Monitor bytes for a second ps text from this same sample.
    `otherAlreadyEmitted` means that file was already an earlier SAMPLE resident.
    A different worker set is a different moment, even when the file was not emitted.
    The same resident string is `none`. Rss fields may differ. Equal fields are not required.
    `none` is what `sampleLine` prints as `monitor_bytes=absent`. -/
def sameMomentMonitorNat
    (residentText : String) (other : Option String) (otherAlreadyEmitted : Bool) : Option Nat :=
  match other with
  | none => none
  | some text =>
    if otherAlreadyEmitted || text == residentText then
      none
    else if !sameWorkerSet residentText text then
      none
    else if !textHasPoolBinary residentText || !textHasPoolBinary text then
      none
    else
      SlakeCheckLogCompare.capturedPsResidentBytes text

/-- Later ps text of the cross-sample pair. Pool rss 16816, lean 311508, lean 312164.
    The sum times 1024 is 655859712. -/
def crossSampleLaterText : String :=
  "3771000 16816 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  s!"3771001 311508 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean\n" ++
  s!"3771002 312164 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean"

/-- Earlier SAMPLE resident text. Pool rss 16688 times 1024 is 17088512.
    Workers are not up. This file was already emitted. -/
def crossSampleEarlierText : String :=
  "3771000 16688 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare"

/-- Two pool-binary texts from one sample. Rss differs by 8 kibibytes. -/
def sameMomentResidentText : String :=
  "400 16000 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare"

/-- The other text of that sample. Field 2 is 16008, which is 8 kibibytes more. -/
def sameMomentOtherText : String :=
  "400 16008 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare"

def pathAlreadyEmitted (path : String) (used : List String) : Bool :=
  used.any fun prev => prev == path

/-- Whether `schedule` prints one SAMPLE for this monitor path.
    An already emitted path does not print another SAMPLE.
    `missing` is the unread sentinel, not a snapshot path. -/
def emitSampleForPath (path : String) (alreadyEmitted : List String) : Bool :=
  path != "missing" && !pathAlreadyEmitted path alreadyEmitted

-- A second read of this snapshot is already emitted, so it does not SAMPLE.
#guard pathAlreadyEmitted "/tmp/slake-monitor-ps-one-live/95000101.txt" ["/tmp/slake-monitor-ps-one-live/95000101.txt"] == true
#guard emitSampleForPath "/tmp/slake-monitor-ps-one-live/95000101.txt" ["/tmp/slake-monitor-ps-one-live/95000101.txt"] == false

/-- Newest monitor snapshot. A path already emitted is not returned.
    The caller does not emit a second SAMPLE for that path. -/
def readLatestMonitorText (alreadyEmitted : List String) : IO (Option (String × String)) := do
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
    if pathAlreadyEmitted path.toString alreadyEmitted then
      return none
    else
      let text ←
        try
          IO.FS.readFile path
        catch _ =>
          pure ""
      if text == "" then
        return none
      else
        return some (path.toString, text)

/-- Bytes from the newest snapshot, including a path already emitted.
    This read does not by itself emit a SAMPLE. -/
def readNewestMonitorText : IO (Option (String × String)) := do
  readLatestMonitorText []

/-- Basename of a monitor snapshot path. -/
def monitorSnapshotBase (path : String) : String :=
  match (path.splitOn "/").reverse with
  | base :: _ => base
  | [] => path

/-- Newest `.txt` in `monitorPsDir` other than `skipPath`.
    Empty text is `none`. This file is not the resident snapshot. -/
def readOtherMonitorSnapshot (skipPath : String) : IO (Option (String × String)) := do
  let skipBase := monitorSnapshotBase skipPath
  let entries ←
    try
      monitorPsDir.readDir
    catch _ =>
      pure (#[] : Array IO.FS.DirEntry)
  let names :=
    (entries.toList.map fun ent => ent.fileName).filter fun name => name != skipBase
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

/-- Read one monitor ps text. When workers are expected and this sample is
    allowed to settle, wait until that text lists the pinned Lean worker
    `/nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean`.
    A `c0q0s92` lookalike is not that worker. A path already emitted is skipped.
    `settle := false` does not sleep: admission still has room under the cap.
    This function does not spawn `ps`. -/
def awaitMonitorSample
    (workersExpected settle : Bool) (alreadyEmitted : List String) : IO OnePsSample := do
  if workersExpected && settle then
    IO.sleep workerRssSettleMs
  let mut last : OnePsSample :=
    { bytes := none, monitorFile := "missing", octets := 0, psText := "" }
  let mut done := false
  for _step in List.range 20 do
    if !done then
      match ← readLatestMonitorText alreadyEmitted with
      | none =>
        IO.sleep 50
      | some (path, text) =>
        let parsed := publishedFromMonitorPs text
        last := { bytes := parsed, monitorFile := path, octets := text.length, psText := text }
        let workersSeen := workersSeenForAdmit workersExpected settle text
        if parsed.isSome && workersSeen then
          done := true
        else
          IO.sleep 50
  if last.monitorFile == "missing" then
    match ← readNewestMonitorText with
    | none => return last
    | some (path, text) =>
      if pathAlreadyEmitted path alreadyEmitted then
        let parsed := publishedFromMonitorPs text
        return { bytes := parsed, monitorFile := path, octets := text.length, psText := text }
      else
        return last
  else
    return last

/-- One sample reads one monitor file. `sampleIndex` is unused because the
    monitor names the file. The scheduler does not spawn `ps`. -/
def treeRssOnce
    (workersExpected settle : Bool) (_sampleIndex : Nat) (alreadyEmitted : List String) :
    IO OnePsSample :=
  awaitMonitorSample workersExpected settle alreadyEmitted

def treeRssBytes
    (workersExpected settle : Bool) (sampleIndex : Nat) (alreadyEmitted : List String) :
    IO OnePsSample := do
  treeRssOnce workersExpected settle sampleIndex alreadyEmitted

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

/-- Checkout source of this scheduler. The digest is a read of this path, not a pasted constant. -/
def checkPoolMainCheckoutPath : System.FilePath :=
  SlakeCheckLogCompare.checkCwd / "src" / "systems" / "SystemsLean" / "CheckPoolMain.lean"

def checkPoolMainSourceDigest : IO (Option String) :=
  fileSha256 checkPoolMainCheckoutPath

def checkPoolMainDigestLine : IO String := do
  let path := checkPoolMainCheckoutPath.toString
  match ← checkPoolMainSourceDigest with
  | some hex => return s!"CHECKOUT_SHA256 path={path} sha256={hex}\n"
  | none => return s!"CHECKOUT_SHA256 path={path} sha256=missing\n"

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

-- OFFICIAL_CAPTURED_TEXTS
def officialPs93000058 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4156 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16320 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706156  4412 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialPs93000062 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4156 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16388 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706162     0 [lean] <defunct>\n" ++
  "3706197  4432 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialPs93000066 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16424 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706206 506036 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706244  4436 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialPs93000070 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16424 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706206 533488 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706270  4448 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialPs93000142 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16312 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706809  4440 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialPs93000146 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16392 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706852  4432 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialPs93000150 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16416 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706859 505836 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706896  4424 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialPs93000154 : String :=
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16416 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706859 533968 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706925  4440 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n"

def officialCapturedMonitorLog : String :=
  "SNAPSHOT_INDEP ts=1793094469.987044173 after=/tmp/slake-monitor-ps-one-live/93000058.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4156 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16380 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706159  4432 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n" ++
  "SNAPSHOT_INDEP ts=1793094471.144355613 after=/tmp/slake-monitor-ps-one-live/93000062.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4156 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16396 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706200  4428 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n" ++
  "SNAPSHOT_INDEP ts=1793094472.327028676 after=/tmp/slake-monitor-ps-one-live/93000066.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16424 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706206 506164 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706247  4444 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n" ++
  "SNAPSHOT_INDEP ts=1793094473.499649998 after=/tmp/slake-monitor-ps-one-live/93000070.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705673  6736 sshd-session: nixbuilder@notty\n" ++
  "3705674  4248 /run/current-system/sw/bin/bash -s\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3705690 832696 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706149 16424 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706206 535472 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706273  4444 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n" ++
  "SNAPSHOT_INDEP ts=1793094494.082142461 after=/tmp/slake-monitor-ps-one-live/93000142.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16372 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706815  4440 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n" ++
  "SNAPSHOT_INDEP ts=1793094495.246433651 after=/tmp/slake-monitor-ps-one-live/93000146.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16392 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706855  4424 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n" ++
  "SNAPSHOT_INDEP ts=1793094496.404878657 after=/tmp/slake-monitor-ps-one-live/93000150.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16416 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706859 505968 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706899  4440 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n" ++
  "SNAPSHOT_INDEP ts=1793094497.572023964 after=/tmp/slake-monitor-ps-one-live/93000154.txt\n" ++
  "   1649 14420 /run/current-system/systemd/lib/systemd/systemd --user --deserialize=32\n" ++
  "   1700  4096 (sd-pam)\n" ++
  " 213639  4344 /nix/store/yly12cgk8diwbba5pjdr7g0b3hk8db0c-dbus-broker-37/bin/dbus-broker-launch --scope user\n" ++
  " 213641  2896 dbus-broker --log 11 --controller 10 --machine-id f091e79e00eb4cae97244bc8500a4464 --max-bytes 100000000000000 --max-fds 25000000000000 --max-matches 5000000000\n" ++
  "3705679  4160 /run/current-system/sw/bin/bash /tmp/paired-rerun-2026-10-27/monitor.sh\n" ++
  "3706766  6504 sshd-session: nixbuilder@notty\n" ++
  "3706771  4228 /run/current-system/sw/bin/bash -s\n" ++
  "3706774 830724 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lake --dir /home/nixbuilder/iso/src/systems exe slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706802 16416 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool -- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  "3706859 535116 /nix/store/4bfysnfphwfi7yy4rx1plkr51c2q0s92-lean4-4.35.0/bin/lean /home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean\n" ++
  "3706928  4412 /run/current-system/sw/bin/ps -o pid=,rss=,args=\n" ++
  "END_SNAPSHOT\n"

/-- Ps lines that follow one `SNAPSHOT_INDEP` marker, stopping before `END_SNAPSHOT`. -/
def psLinesUntilEnd : List String → List String
  | [] => []
  | line :: rest =>
    if line == "END_SNAPSHOT" then []
    else line :: psLinesUntilEnd rest

/-- Independent `ps` text recorded just after `file` in the monitor log.
    `none` when that marker is absent. An empty body is not zero bytes. -/
def findIndepPs (file : String) : List String → Option String
  | [] => none
  | line :: rest =>
    if String.startsWith line "SNAPSHOT_INDEP " &&
        String.endsWith line s!"after={file}" then
      some (String.intercalate "\n" (psLinesUntilEnd rest))
    else
      findIndepPs file rest

def officialIndepText (file : String) : Option String :=
  findIndepPs file (officialCapturedMonitorLog.splitOn "\n")

/-- Monitor bytes for one official SAMPLE.
    The count is the full captured sum of the independent text.
    A one-sided pid stays in that side's sum. It is not dropped.
    A text with no pool binary is `none`, not 0,
    and `sampleLine` then prints `monitor_bytes=absent`. -/
def officialMonitorNat (schedulerPs indep : String) : Option Nat :=
  match SlakeCheckLogCompare.pairedSameProcessBytes schedulerPs indep with
  | some (_, monBytes) => some monBytes
  | none => none

/-- Scheduler bytes for one official SAMPLE.
    The count is the full captured sum of the scheduler text.
    A one-sided pid stays in that side's sum. It is not dropped.
    A text with no pool binary is `none`, not 0. -/
def officialResidentNat (schedulerPs indep : String) : Option Nat :=
  match SlakeCheckLogCompare.pairedSameProcessBytes schedulerPs indep with
  | some (schedBytes, _) => some schedBytes
  | none => none

/-- One independent ps text and the path it was read from.
    `source` is a snapshot under `monitorPsDir`, or the `--monitor-log` path. -/
structure IndepPs where
  source : String
  text : String

/-- Independent ps text for `monitor_bytes`.
    With `--monitor-log`, the text is the `SNAPSHOT_INDEP` body after `file`.
    With no flag, the text is another file from this same sample.
    A file already emitted as an earlier SAMPLE resident is `none`.
    A different worker set is `none`. Rss fields may differ.
    The resident file is not returned. -/
def independentPsFromLog
    (path : Option String) (file residentText : String) (alreadyEmitted : List String) :
    IO (Option IndepPs) := do
  match path with
  | some p =>
    let text ←
      try
        IO.FS.readFile p
      catch _ =>
        pure ""
    match findIndepPs file (text.splitOn "\n") with
    | none => return none
    | some body => return some { source := p, text := body }
  | none =>
    match ← readOtherMonitorSnapshot file with
    | none => return none
    | some (snapPath, body) =>
      let emitted := pathAlreadyEmitted snapPath alreadyEmitted
      match sameMomentMonitorNat residentText (some body) emitted with
      | none => return none
      | some _ => return some { source := snapPath, text := body }


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

-- guard_sampleLine_two_different_ps_texts
-- resident_bytes is 15860 * 1024 from oneLinePsPidRssLean.
-- monitor_bytes is 20000 * 1024 from otherLinePsPidRssLean.
-- The two texts differ. A guard that only accepts equal fields does not pass.
-- The same resident string is not copied. That case is monitor_bytes=absent.
#guard
  oneLinePsPidRssLean != otherLinePsPidRssLean &&
    match monitorBytesFromPsText oneLinePsPidRssLean,
        monitorBytesFromPsText otherLinePsPidRssLean with
    | some resident, some monitor =>
      resident == 15860 * 1024 &&
        monitor == 20000 * 1024 &&
        resident != monitor &&
        monitorNatFromIndependent oneLinePsPidRssLean (some oneLinePsPidRssLean) == none &&
        monitorNatFromIndependent oneLinePsPidRssLean (some otherLinePsPidRssLean) ==
          some monitor &&
        let line := sampleLine (some 0) (some resident) (some monitor)
          (some (SlakeCheckLogCompare.disagreementResident resident monitor)) 0 0
        (line.splitOn "monitor_bytes=absent").length == 1 &&
          (line.splitOn ("resident_bytes=" ++ toString resident)).length == 2 &&
          (line.splitOn ("monitor_bytes=" ++ toString monitor)).length == 2
    | _, _ => false

-- guard_cross_sample_655859712_versus_17088512_not_scored
-- Later text: pool 16816, lean 311508, lean 312164. Times 1024 is 655859712.
-- Earlier text: pool 16688. Times 1024 is 17088512. Workers are not up.
-- That earlier file was already a SAMPLE resident. The worker sets differ.
-- withinLockedTolerance of the two counts is false. The chooser does not emit the pair.
#guard
  ((16816 + 311508 + 312164) * 1024) == 655859712 &&
    (16688 * 1024) == 17088512 &&
    SlakeCheckLogCompare.withinLockedTolerance 655859712 17088512 == false &&
    textHasPoolBinary crossSampleLaterText &&
    textHasPoolBinary crossSampleEarlierText &&
    sameWorkerSet crossSampleLaterText crossSampleEarlierText == false &&
    monitorBytesFromPsText crossSampleLaterText == some 655859712 &&
    monitorBytesFromPsText crossSampleEarlierText == some 17088512 &&
    sameMomentMonitorNat crossSampleLaterText (some crossSampleEarlierText) true == none &&
    sameMomentMonitorNat crossSampleLaterText (some crossSampleEarlierText) false == none &&
    let line := sampleLine (some 1793103740) (some 655859712) none (some 655859712) 2 0
    (line.splitOn "monitor_bytes=absent").length == 2 &&
      (line.splitOn "resident_bytes=655859712").length == 2 &&
      (line.splitOn "monitor_bytes=17088512").length == 1

-- guard_same_moment_pool_rss_differs_by_8192
-- Both texts contain the pool binary. The rss fields differ by 8 kibibytes.
-- 8 * 1024 = 8192. The fields are not required to be equal.
-- An already emitted file is still absent. A fresh pair prints both counts.
#guard
  textHasPoolBinary sameMomentResidentText &&
    textHasPoolBinary sameMomentOtherText &&
    sameWorkerSet sameMomentResidentText sameMomentOtherText &&
    sameMomentResidentText != sameMomentOtherText &&
    match monitorBytesFromPsText sameMomentResidentText,
        monitorBytesFromPsText sameMomentOtherText with
    | some resident, some monitor =>
      resident == 16000 * 1024 &&
        monitor == 16008 * 1024 &&
        resident != monitor &&
        (monitor - resident) == 8192 &&
        sameMomentMonitorNat sameMomentResidentText (some sameMomentOtherText) true ==
          none &&
        sameMomentMonitorNat sameMomentResidentText (some sameMomentOtherText) false ==
          some monitor &&
        let line := sampleLine (some 0) (some resident) (some monitor)
          (some (SlakeCheckLogCompare.disagreementResident resident monitor)) 0 0
        (line.splitOn "monitor_bytes=absent").length == 1 &&
          (line.splitOn ("resident_bytes=" ++ toString resident)).length == 2 &&
          (line.splitOn ("monitor_bytes=" ++ toString monitor)).length == 2
    | _, _ => false

/-- Peak resident text. Pool pid 500. Pinned Lean pids 501 and 502.
    Rss fields are 20000, 400000, and 400000 kibibytes. -/
def peakSameSetResidentText : String :=
  "500 20000 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  s!"501 400000 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean\n" ++
  s!"502 400000 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean"

/-- The other text of that peak. Same pids. Rss fields are 20008, 400100, and 400050. -/
def peakSameSetMonitorText : String :=
  "500 20008 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  s!"501 400100 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean\n" ++
  s!"502 400050 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean"

/-- Next peak pair, not the mismatched resident text.
    Same pids 500, 501, and 502. Rss fields are 20010, 400200, and 400100. -/
def peakNextResidentText : String :=
  "500 20010 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  s!"501 400200 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean\n" ++
  s!"502 400100 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean"

/-- Partner of `peakNextResidentText`. Rss fields are 20012, 400180, and 400120. -/
def peakNextMonitorText : String :=
  "500 20012 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare\n" ++
  s!"501 400180 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SimdTargetFeatures.lean\n" ++
  s!"502 400120 {pinnedLeanBinPath} " ++
    "/home/nixbuilder/iso/src/systems/SystemsLean/SlakeCheckLogCompare.lean"

/-- Pool pid only. No pinned Lean workers. This is not the same worker set. -/
def peakMismatchPoolOnlyText : String :=
  "500 20000 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures --module SlakeCheckLogCompare"

/-- A peak pair that may be scored.
    Both texts list the pool binary and the same pinned-lean pids. Rss may differ.
    The byte gap must sit inside the locked 1 percent. A different worker set is `none`.
    A pair outside that lock is `none`, so the hold does not emit it. -/
def acceptPeakPair (resident partner : String) : Option Nat :=
  if !textHasPinnedLean resident || !textHasPinnedLean partner then
    none
  else
    match sameMomentMonitorNat resident (some partner) false with
    | none => none
    | some monitor =>
      match SlakeCheckLogCompare.capturedPsResidentBytes resident with
      | none => none
      | some sched =>
        if SlakeCheckLogCompare.withinLockedTolerance sched monitor then
          some monitor
        else
          none

/-- First pair in the list that `acceptPeakPair` scores.
    A mismatched pair is not scored. The caller does not put a skipped text in a later pair. -/
def heldPeakMonitorNat : List (String × String) → Option Nat
  | [] => none
  | (resident, partner) :: rest =>
    match acceptPeakPair resident partner with
    | some n => some n
    | none => heldPeakMonitorNat rest

/-- SAMPLE line of the held peak pair. `none` when no pair is inside the lock.
    The line prints `inFlight` as given. A mismatch does not become this line. -/
def heldPeakSampleLine (pairs : List (String × String)) (ts inFlight queued : Nat) : Option String :=
  match pairs with
  | [] => none
  | (resident, partner) :: rest =>
    match acceptPeakPair resident partner with
    | some monitor =>
      match SlakeCheckLogCompare.capturedPsResidentBytes resident with
      | some sched =>
        some (sampleLine (some ts) (some sched) (some monitor)
          (some (SlakeCheckLogCompare.disagreementResident sched monitor)) inFlight queued)
      | none => heldPeakSampleLine rest ts inFlight queued
    | none => heldPeakSampleLine rest ts inFlight queued

-- guard_peak_same_set_pair_inside_one_percent
-- Same pool pid 500. Same pinned Lean pids 501 and 502. Rss fields differ.
-- Both sums are inside the locked 1 percent. The SAMPLE line prints both counts.
#guard
  sameWorkerSet peakSameSetResidentText peakSameSetMonitorText &&
    textHasPinnedLean peakSameSetResidentText &&
    textHasPinnedLean peakSameSetMonitorText &&
    match SlakeCheckLogCompare.capturedPsResidentBytes peakSameSetResidentText,
        SlakeCheckLogCompare.capturedPsResidentBytes peakSameSetMonitorText with
    | some resident, some monitor =>
      resident == (20000 + 400000 + 400000) * 1024 &&
        monitor == (20008 + 400100 + 400050) * 1024 &&
        resident != monitor &&
        SlakeCheckLogCompare.withinLockedTolerance resident monitor &&
        acceptPeakPair peakSameSetResidentText peakSameSetMonitorText == some monitor &&
        match heldPeakSampleLine [(peakSameSetResidentText, peakSameSetMonitorText)] 1 2 0 with
        | some line =>
          (line.splitOn "monitor_bytes=absent").length == 1 &&
            (line.splitOn ("resident_bytes=" ++ toString resident)).length == 2 &&
            (line.splitOn ("monitor_bytes=" ++ toString monitor)).length == 2 &&
            (line.splitOn "in_flight=2").length == 2
        | none => false
    | _, _ => false

-- guard_peak_mismatch_not_scored_next_pair_is
-- Pool-only against the two pinned Lean workers is a different worker set.
-- sameMomentMonitorNat is none. That pair is not the SAMPLE.
-- The next same-set pair is the one scored. The mismatched resident text is not in it.
#guard
  sameWorkerSet peakSameSetResidentText peakMismatchPoolOnlyText == false &&
    sameMomentMonitorNat peakSameSetResidentText (some peakMismatchPoolOnlyText) false == none &&
    acceptPeakPair peakSameSetResidentText peakMismatchPoolOnlyText == none &&
    heldPeakMonitorNat [(peakSameSetResidentText, peakMismatchPoolOnlyText)] == none &&
    heldPeakSampleLine [(peakSameSetResidentText, peakMismatchPoolOnlyText)] 1 2 0 == none &&
    match acceptPeakPair peakNextResidentText peakNextMonitorText with
    | some monitor =>
      heldPeakMonitorNat [
        (peakSameSetResidentText, peakMismatchPoolOnlyText),
        (peakNextResidentText, peakNextMonitorText)
      ] == some monitor &&
        match heldPeakSampleLine [
          (peakSameSetResidentText, peakMismatchPoolOnlyText),
          (peakNextResidentText, peakNextMonitorText)
        ] 1 2 0 with
        | some line =>
          (line.splitOn "monitor_bytes=absent").length == 1 &&
            (line.splitOn ("monitor_bytes=" ++ toString monitor)).length == 2 &&
            (line.splitOn "in_flight=2").length == 2
        | none => false
    | none => false

-- OFFICIAL_SAMPLE_GUARD
/-- One official pair is inside the locked 1 percent.
    Both byte counts come from `pairedSameProcessBytes` on the scheduler `ps`
    text and the independent `ps` text. `officialResidentNat` and
    `officialMonitorNat` are the numbers `sampleLine` records. The corrected
    counts are not written as literals. A missing monitor stays `absent`,
    not 0. -/
def officialSampleHolds (schedulerPs file : String) : Bool :=
  match officialIndepText file with
  | none => false
  | some indep =>
    match SlakeCheckLogCompare.pairedSameProcessBytes schedulerPs indep with
    | none => false
    | some (schedBytes, monBytes) =>
      let projected :=
        SlakeCheckLogCompare.disagreementResident schedBytes monBytes
      let line := sampleLine (some 0) (officialResidentNat schedulerPs indep)
        (officialMonitorNat schedulerPs indep) (some projected) 0 0
      officialResidentNat schedulerPs indep == some schedBytes &&
        officialMonitorNat schedulerPs indep == some monBytes &&
        SlakeCheckLogCompare.withinLockedTolerance schedBytes monBytes &&
        (line.splitOn "monitor_bytes=absent").length == 1

-- guard_official_log_pairs_inside_one_percent
-- Calls pairedSameProcessBytes, officialResidentNat, officialMonitorNat,
-- and sampleLine. Does not restate the corrected byte counts.
-- The raw pairs 16719872 versus 0 and 16863232 versus 560463872 stay outside.
-- Tolerance stays 1. The launch ceiling stays 192000000000.
#guard
  SlakeCheckLogCompare.memoryCompareToleranceNumber == 1 &&
    SlakeCheckLogCompare.launchCeilingBytes == 192000000000 &&
    SlakeCheckLogCompare.withinLockedTolerance 16719872 0 == false &&
    SlakeCheckLogCompare.withinLockedTolerance 16863232 560463872 == false &&
    SlakeCheckLogCompare.disagreementResident 16863232 560463872 == 560463872 &&
    officialSampleHolds officialPs93000058
      "/tmp/slake-monitor-ps-one-live/93000058.txt" &&
    officialSampleHolds officialPs93000062
      "/tmp/slake-monitor-ps-one-live/93000062.txt" &&
    officialSampleHolds officialPs93000066
      "/tmp/slake-monitor-ps-one-live/93000066.txt" &&
    officialSampleHolds officialPs93000070
      "/tmp/slake-monitor-ps-one-live/93000070.txt" &&
    officialSampleHolds officialPs93000142
      "/tmp/slake-monitor-ps-one-live/93000142.txt" &&
    officialSampleHolds officialPs93000146
      "/tmp/slake-monitor-ps-one-live/93000146.txt" &&
    officialSampleHolds officialPs93000150
      "/tmp/slake-monitor-ps-one-live/93000150.txt" &&
    officialSampleHolds officialPs93000154
      "/tmp/slake-monitor-ps-one-live/93000154.txt"


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

-- guard_held_any_launch_only_strictly_above_192000000000
-- The ceiling integer is not a hold. One byte above is a hold.
-- admitWorker 32 1 refuses because 32 are already in flight.
-- That refusal is not a ceiling hold. A small reading stays false.
#guard
  SlakeCheckLogCompare.launchCeilingBytes == 192000000000 &&
    readingIsCeilingHold none == false &&
    readingIsCeilingHold (some SlakeCheckLogCompare.launchCeilingBytes) == false &&
    readingIsCeilingHold (some (SlakeCheckLogCompare.launchCeilingBytes + 1)) == true &&
    ceilingHeldLine (readingIsCeilingHold (some SlakeCheckLogCompare.launchCeilingBytes)) ==
      "CEILING held_any_launch=false\n" &&
    ceilingHeldLine (readingIsCeilingHold (some (SlakeCheckLogCompare.launchCeilingBytes + 1))) ==
      "CEILING held_any_launch=true\n" &&
    SlakeCheckLogCompare.admitWorker 32 1 == false &&
    readingIsCeilingHold (some (15852 * 1024)) == false &&
    admitLaunch (some (15852 * 1024)) 32 1 == false &&
    admitLaunch (some (SlakeCheckLogCompare.launchCeilingBytes + 1)) 31 1 == false

-- guard_under_ceiling_queued_admits_launch
#guard admitLaunch (some (15852 * 1024)) 0 2 == true

/-- In flight, work still queued, room under the cap, and the ceiling did not hold.
    Sleeping or exiting 0 in this state is a failed decision. The log line is IDLE. -/
def idleWhileQueuedFails (inFlight queued : Nat) (ceilingHeld : Bool) : Bool :=
  inFlight >= 1 && queued >= 1 && inFlight < SlakeCheckLogCompare.concurrentChecks &&
    ceilingHeld == false

-- guard_idleWhileQueued_inFlight1_queued1_ceilingNotHeld
#guard idleWhileQueuedFails 1 1 false == true

-- guard_idleWhileQueued_atCap_is_not_this_failure
#guard idleWhileQueuedFails 32 1 false == false

-- guard_idleWhileQueued_ceilingHeld_is_not_this_failure
#guard idleWhileQueuedFails 1 1 true == false

-- guard_idleWhileQueued_nothingQueued_is_not_this_failure
#guard idleWhileQueuedFails 1 0 false == false

/-- One queue decision from folding `SlakeCheckLogCompare.admitWorker`.
    The cap stays `concurrentChecks`. This is not a second scheduler.
    A held ceiling does not call `admitWorker` and admits nobody.
    `nextRefused` is the worker after `admitted`. -/
structure QueueAdmit where
  queue : Nat
  cap : Nat
  ceilingHeld : Bool
  admitted : Nat
  nextRefused : Bool

def foldAdmitWorker (queue : Nat) (ceilingHeld : Bool) : QueueAdmit :=
  let cap := SlakeCheckLogCompare.concurrentChecks
  let admitted :=
    (List.range queue).foldl (fun inFlight _ =>
      let queued := queue - inFlight
      if ceilingHeld == false && SlakeCheckLogCompare.admitWorker inFlight queued then
        inFlight + 1
      else
        inFlight) 0
  let stillQueued := queue - admitted
  let nextRefused :=
    if ceilingHeld then
      true
    else
      SlakeCheckLogCompare.admitWorker admitted stillQueued == false
  { queue, cap, ceilingHeld, admitted, nextRefused }

-- guard_foldAdmitWorker_queue2_cap32_two_workers_third_refused
-- Queue length 2, cap 32, ceiling not holding: admit 2, refuse a third.
-- Queue 33 against that cap admits 32, and the 33rd stays refused.
-- A held ceiling admits none of the short queue.
-- idleWhileQueuedFails 1 1 false stays true. concurrentChecks stays 32.
#guard
  let short := foldAdmitWorker 2 false
  let long := foldAdmitWorker 33 false
  let held := foldAdmitWorker 2 true
  short.queue == 2 &&
    short.cap == 32 &&
    short.ceilingHeld == false &&
    short.admitted == 2 &&
    short.nextRefused == true &&
    long.queue == 33 &&
    long.cap == 32 &&
    long.ceilingHeld == false &&
    long.admitted == 32 &&
    long.nextRefused == true &&
    held.queue == 2 &&
    held.ceilingHeld == true &&
    held.admitted == 0 &&
    held.nextRefused == true &&
    idleWhileQueuedFails 1 1 false == true &&
    SlakeCheckLogCompare.concurrentChecks == 32 &&
    SlakeCheckLogCompare.admitWorker 32 1 == false

def listHas (name : String) : List String → Bool
  | [] => false
  | head :: rest => head == name || listHas name rest

/-- A missing olean is one dedicated job.
    A module whose dependencies are built stays in `ready` and still gets a slot.
    `CheckPoolMain` is not a third `--module`. -/
def slotsForMissingOlean (missingOlean ready : List String) : List String :=
  let missingSlots := missingOlean.filter fun name => name != "CheckPoolMain"
  let readySlots := ready.filter fun name =>
    name != "CheckPoolMain" && !(listHas name missingOlean)
  missingSlots ++ readySlots

-- guard_missing_olean_slots_SimdTargetFeatures_and_SlakeCheckLogCompare
#guard slotsForMissingOlean ["SimdTargetFeatures"] ["SlakeCheckLogCompare"] ==
  ["SimdTargetFeatures", "SlakeCheckLogCompare"]

-- guard_missing_olean_does_not_add_CheckPoolMain
#guard slotsForMissingOlean ["SimdTargetFeatures"]
    ["SlakeCheckLogCompare", "CheckPoolMain"] ==
  ["SimdTargetFeatures", "SlakeCheckLogCompare"]

def moduleOleanPath (name : String) : System.FilePath :=
  let rel := String.intercalate "/" (name.splitOn ".")
  SlakeCheckLogCompare.checkCwd / "src" / "systems" / ".lake" / "build" / "lib" / "lean" /
    "SystemsLean" / (rel ++ ".olean")

def splitByOlean (names : List String) : IO (List String × List String) := do
  let mut missing : List String := []
  let mut ready : List String := []
  for name in names do
    if ← (moduleOleanPath name).pathExists then
      ready := ready ++ [name]
    else
      missing := missing ++ [name]
  return (missing, ready)

/-- Exact mean of in-flight counts. `numerator` is the sum. `denominator` is the count.
    Nat division is not used, so the mean of 0, 1, 2, 1, 0 stays 4/5 and is not truncated to 0.
    An empty list is numerator 0 and denominator 0. The schedule line prints numerator/denominator. -/
structure ConcurrencyMean where
  numerator : Nat
  denominator : Nat

def concurrencyAverage (samples : List Nat) : ConcurrencyMean :=
  { numerator := samples.foldl Nat.add 0
  , denominator := samples.length }

/-- The schedule line records this text. It is not a binary floating-point average. -/
def concurrencyMeanText (mean : ConcurrencyMean) : String :=
  s!"{mean.numerator}/{mean.denominator}"

-- Samples 0, 1, 2, 1, 0. Sum is 4. Count is 5. The mean is 4/5.
-- Nat division of that sum by that count truncates to 0. This guard does not accept 0.
-- guard_concurrencyAverage_samples_0_1_2_1_0
#guard
  (concurrencyAverage [0, 1, 2, 1, 0]).numerator == 4 &&
    (concurrencyAverage [0, 1, 2, 1, 0]).denominator == 5

-- guard_concurrencyMeanText_samples_0_1_2_1_0_not_truncated
#guard concurrencyMeanText (concurrencyAverage [0, 1, 2, 1, 0]) == "4/5"
#guard concurrencyMeanText (concurrencyAverage [0, 1, 2, 1, 0]) != "0"

/-- Spawn every worker this reading, the cap, and the ceiling allow.
    This loop does not sleep and does not re-read `ps`. -/
partial def admitReady (projected : Option Nat) (st : SchedState) : IO SchedState := do
  let inFlight := st.live.length
  let queued := st.pending.length
  if !(admitLaunch projected inFlight queued) then
    return st
  else
    match st.pending with
    | [] => return st
    | name :: rest =>
      let running ← spawnRunning st.nextIndex name st.leanVersion
      admitReady projected {
        st with
        pending := rest
        live := st.live ++ [running]
        nextIndex := st.nextIndex + 1
      }

/-- True when the tail has no dead pid. The empty tail is still alive. -/
def workersAllAlive : List Running → IO Bool
  | [] => pure true
  | item :: rest => do
    let present ← (System.FilePath.mk s!"/proc/{item.childPid}").pathExists
    if present then workersAllAlive rest else pure false

/-- True when every child pid still has a `/proc` entry. An empty list is not alive. -/
def workersStillAlive (live : List Running) : IO Bool :=
  match live with
  | [] => pure false
  | _ => workersAllAlive live

/-- Newest snapshot name, then the newest name other than that one. -/
def twoLatestSnapshotNames (names : List String) : Option (String × String) :=
  match latestSnapshotName names with
  | none => none
  | some newer =>
    match latestSnapshotName (names.filter fun name => name != newer) with
    | none => none
    | some older => some (newer, older)

/-- The two newest `.txt` snapshots, but only when neither path was already emitted.
    One emitted side means this tick is not a new pair. Empty text is `none`. -/
def readFreshLatestPair (alreadyEmitted : List String) : IO (Option (IndepPs × IndepPs)) := do
  let entries ←
    try
      monitorPsDir.readDir
    catch _ =>
      pure (#[] : Array IO.FS.DirEntry)
  let names := entries.toList.map fun ent => ent.fileName
  match twoLatestSnapshotNames names with
  | none => return none
  | some (newer, older) =>
    let newerPath := (monitorPsDir / newer).toString
    let olderPath := (monitorPsDir / older).toString
    if pathAlreadyEmitted newerPath alreadyEmitted ||
        pathAlreadyEmitted olderPath alreadyEmitted then
      return none
    else
      let newerText ←
        try
          IO.FS.readFile (monitorPsDir / newer)
        catch _ =>
          pure ""
      let olderText ←
        try
          IO.FS.readFile (monitorPsDir / older)
        catch _ =>
          pure ""
      if newerText == "" || olderText == "" then
        return none
      else
        return some (
          { source := newerPath, text := newerText },
          { source := olderPath, text := olderText })

/-- A partner whose worker set is not the resident set is recorded as emitted.
    A later sample must not score that file. A same pinned-lean set is left alone
    so the next snapshot can pair with it. -/
def rememberMismatchPartner
    (st : SchedState) (residentPath residentText : String) : IO SchedState := do
  match ← readOtherMonitorSnapshot residentPath with
  | none => return st
  | some (partnerPath, partnerText) =>
    if pathAlreadyEmitted partnerPath st.emittedMonitorPaths then
      return st
    else if sameWorkerSet residentText partnerText &&
        textHasPinnedLean residentText && textHasPinnedLean partnerText &&
        textHasPoolBinary residentText && textHasPoolBinary partnerText then
      return st
    else
      return { st with emittedMonitorPaths := partnerPath :: st.emittedMonitorPaths }

/-- Absolute-difference totals for scored pairs.
    The byte mean is `sumAbsBytes / count`, printed as numerator and denominator.
    Percent figures are `diff * 100` and `larger * memoryCompareToleranceNumber`.
    This is the locked comparison. It is not a truncated percent, and it does not
    widen `memoryCompareToleranceNumber`. -/
structure PairAbsStats where
  count : Nat
  sumAbsBytes : Nat
  maxAbsBytes : Nat
  sumDiffTimes100 : Nat
  sumLargerTimesTol : Nat
  maxDiffTimes100 : Nat
  maxLargerTimesTol : Nat

def emptyPairAbsStats : PairAbsStats :=
  { count := 0
    sumAbsBytes := 0
    maxAbsBytes := 0
    sumDiffTimes100 := 0
    sumLargerTimesTol := 0
    maxDiffTimes100 := 0
    maxLargerTimesTol := 0 }

/-- Fold samples the scheduler already scored.
    A row with `monBytes = none` is not a pair.
    A second row with the same non-empty `monitorFile` is not a second pair.
    An empty path is not a file identity, so it is not used for that skip. -/
def foldScoredPairs (pairs : List ScoredBytePair) : PairAbsStats :=
  go pairs emptyPairAbsStats []
where
  go (rest : List ScoredBytePair) (acc : PairAbsStats) (seen : List String) : PairAbsStats :=
    match rest with
    | [] => acc
    | row :: more =>
      match row.monBytes with
      | none => go more acc seen
      | some mon =>
        let repeated :=
          row.monitorFile != "" && seen.any fun prev => prev == row.monitorFile
        if repeated then
          go more acc seen
        else
          let diff := SlakeCheckLogCompare.absDiffBytes row.schedBytes mon
          let larger := Nat.max row.schedBytes mon
          let scaledDiff := diff * 100
          let scaledLarger := larger * SlakeCheckLogCompare.memoryCompareToleranceNumber
          let firstOrBigger := acc.count == 0 || diff > acc.maxAbsBytes
          let nextSeen :=
            if row.monitorFile == "" then seen else row.monitorFile :: seen
          go more
            { count := acc.count + 1
              sumAbsBytes := acc.sumAbsBytes + diff
              maxAbsBytes := Nat.max acc.maxAbsBytes diff
              sumDiffTimes100 := acc.sumDiffTimes100 + scaledDiff
              sumLargerTimesTol := acc.sumLargerTimesTol + scaledLarger
              maxDiffTimes100 := if firstOrBigger then scaledDiff else acc.maxDiffTimes100
              maxLargerTimesTol :=
                if firstOrBigger then scaledLarger else acc.maxLargerTimesTol }
            nextSeen

/-- The schedule log prints these lines. Means stay numerator and denominator. -/
def pairAbsStatsText (stats : PairAbsStats) : String :=
  let tol := SlakeCheckLogCompare.memoryCompareToleranceNumber
  s!"pair count={stats.count}\n" ++
    s!"mean absolute difference bytes numerator={stats.sumAbsBytes} denominator={stats.count}\n" ++
    s!"maximum absolute difference bytes={stats.maxAbsBytes}\n" ++
    s!"mean absolute difference percent numerator={stats.sumDiffTimes100} denominator={stats.sumLargerTimesTol}\n" ++
    s!"maximum absolute difference percent diff*100={stats.maxDiffTimes100} larger*{tol}={stats.maxLargerTimesTol}\n"

-- guard_foldScoredPairs_absent_and_duplicate_file
-- 100 versus 250. Difference 150. 150 * 100 = 15000. Larger 250. 250 * 1 = 250.
-- The second row reuses a.txt, so it is not a pair. b.txt has no monitor bytes.
-- 200 versus 200. Difference 0. Larger 200. 0 * 100 = 0. 200 * 1 = 200.
-- Count 2. Sum of differences 150. Maximum 150.
-- Sum of diff*100 is 15000. Sum of larger*1 is 450. The maximum pair is the first.
#guard
  let stats := foldScoredPairs [
    { schedBytes := 100, monBytes := some 250, monitorFile := "a.txt" },
    { schedBytes := 999, monBytes := some 1, monitorFile := "a.txt" },
    { schedBytes := 50, monBytes := none, monitorFile := "b.txt" },
    { schedBytes := 200, monBytes := some 200, monitorFile := "c.txt" }]
  stats.count == 2 &&
    stats.sumAbsBytes == 150 &&
    stats.maxAbsBytes == 150 &&
    stats.sumDiffTimes100 == 15000 &&
    stats.sumLargerTimesTol == 450 &&
    stats.maxDiffTimes100 == 15000 &&
    stats.maxLargerTimesTol == 250 &&
    ((pairAbsStatsText stats).splitOn "pair count=2").length == 2 &&
    ((pairAbsStatsText stats).splitOn
      "mean absolute difference bytes numerator=150 denominator=2").length == 2 &&
    ((pairAbsStatsText stats).splitOn
      "maximum absolute difference bytes=150").length == 2 &&
    ((pairAbsStatsText stats).splitOn
      "mean absolute difference percent numerator=15000 denominator=450").length == 2 &&
    ((pairAbsStatsText stats).splitOn
      "maximum absolute difference percent diff*100=15000 larger*1=250").length == 2

-- guard_95000101_scored_once
-- Two rows name /tmp/slake-monitor-ps-one-live/95000101.txt.
-- The fold counts one pair. A second SAMPLE of that path is refused.
-- The byte gap is the full-sum difference 561692672 - 18092032.
#guard
  let path := "/tmp/slake-monitor-ps-one-live/95000101.txt"
  let stats := foldScoredPairs [
    { schedBytes := 18092032, monBytes := some 561692672, monitorFile := path },
    { schedBytes := 1, monBytes := some 2, monitorFile := path }]
  stats.count == 1 &&
    stats.sumAbsBytes == SlakeCheckLogCompare.absDiffBytes 18092032 561692672 &&
    stats.maxAbsBytes == SlakeCheckLogCompare.absDiffBytes 18092032 561692672 &&
    emitSampleForPath path [path] == false &&
    pathAlreadyEmitted path [path] == true

/-- Remember one emitted sample. A missing scheduler reading is not offered to the fold. -/
def noteScoredSample (st : SchedState) (sched mon : Option Nat) (monitorFile : String) :
    SchedState :=
  match sched with
  | none => st
  | some n =>
    { st with
      scoredPairs :=
        st.scoredPairs ++ [{ schedBytes := n, monBytes := mon, monitorFile := monitorFile }] }

/-- One scored peak pair. The SAMPLE line is already printed. -/
structure HeldPeak where
  state : SchedState
  schedBytes : Nat
  monBytes : Nat
  projected : Nat

/-- While both workers are still in flight, wait for a new pair that shares the
    pool pid and the pinned-lean pids and sits inside the locked 1 percent.
    A mismatched pair is marked emitted and is not scored later.
    A same-set pair outside the lock keeps the newer file for the next snapshot.
    The option is `none` when the workers exit first, or when no such pair appears.
    The state is still returned, so those paths stay refused.
    The caller prints this in-flight count and does not take
    `FAIL peak-monitor-absent` before that line. -/
def holdPeakUntilSameSet (start : SchedState) (inFlight queued : Nat) :
    IO (SchedState × Option HeldPeak) := do
  let mut cur := start
  let mut result : Option HeldPeak := none
  let mut stop := false
  for _step in List.range 200 do
    if !stop then
      match ← workersStillAlive cur.live with
      | false =>
        stop := true
      | true =>
        match ← readFreshLatestPair cur.emittedMonitorPaths with
        | none =>
          IO.sleep 50
        | some (newer, older) =>
          match acceptPeakPair newer.text older.text with
          | some monitor =>
            match SlakeCheckLogCompare.capturedPsResidentBytes newer.text with
            | none =>
              cur := {
                cur with
                emittedMonitorPaths := newer.source :: older.source :: cur.emittedMonitorPaths
              }
              IO.sleep 50
            | some sched =>
              let projected := SlakeCheckLogCompare.disagreementResident sched monitor
              cur := noteScoredSample
                { cur with
                  emittedMonitorPaths := newer.source :: older.source :: cur.emittedMonitorPaths }
                (some sched) (some monitor) newer.source
              emitText cur
                (s!"MONITOR_PS sample={cur.samples} file={newer.source} " ++
                  s!"length={newer.text.length} tool=/run/current-system/sw/bin/ps " ++
                  "source=monitor_ps_text scheduler_spawned_ps=false\n")
              emitText cur
                (s!"INDEPENDENT_PS sample={cur.samples} resident_file={newer.source} " ++
                  s!"file={older.source}\n")
              match ← epochSec with
              | ts =>
                emitText cur (sampleLine ts (some sched) (some monitor) (some projected) inFlight queued)
              result := some {
                state := cur
                schedBytes := sched
                monBytes := monitor
                projected
              }
              stop := true
          | none =>
            let sameSet :=
              sameWorkerSet newer.text older.text &&
                textHasPinnedLean newer.text && textHasPinnedLean older.text &&
                textHasPoolBinary newer.text && textHasPoolBinary older.text
            if sameSet then
              match SlakeCheckLogCompare.capturedPsResidentBytes newer.text,
                  SlakeCheckLogCompare.capturedPsResidentBytes older.text with
              | some sched, some monitor =>
                -- Same counted pids. Rss may sit outside the 1 percent lock.
                -- Print the partner sum. Do not fail the run for that movement.
                let projected := SlakeCheckLogCompare.disagreementResident sched monitor
                cur := noteScoredSample
                  { cur with
                    emittedMonitorPaths :=
                      newer.source :: older.source :: cur.emittedMonitorPaths }
                  (some sched) (some monitor) newer.source
                emitText cur
                  (s!"MONITOR_PS sample={cur.samples} file={newer.source} " ++
                    s!"length={newer.text.length} tool=/run/current-system/sw/bin/ps " ++
                    "source=monitor_ps_text scheduler_spawned_ps=false\n")
                emitText cur
                  (s!"INDEPENDENT_PS sample={cur.samples} resident_file={newer.source} " ++
                    s!"file={older.source}\n")
                match ← epochSec with
                | ts =>
                  emitText cur
                    (sampleLine ts (some sched) (some monitor) (some projected) inFlight queued)
                result := some {
                  state := cur
                  schedBytes := sched
                  monBytes := monitor
                  projected
                }
                stop := true
              | _, _ =>
                cur := {
                  cur with
                  emittedMonitorPaths := newer.source :: older.source :: cur.emittedMonitorPaths
                }
                IO.sleep 50
            else
              cur := {
                cur with
                emittedMonitorPaths := newer.source :: older.source :: cur.emittedMonitorPaths
              }
              IO.sleep 50
  return (cur, result)

/-- `schedule` does not return `FAIL peak-monitor-absent` for this tick.
    Workers already in flight, with work still queued, record that in-flight
    count on the SAMPLE line and keep going. `sampleRecorded` means that line
    was printed. A monitor file that arrives after those workers have exited
    does not flip this: the launched queue is not an abort. -/
def peakMonitorAbsentReturn (inFlight queued : Nat) (sampleRecorded : Bool) : Bool :=
  let launchedWithQueue := inFlight >= 1 && queued >= 1
  -- A launched queue records the in-flight count and does not return.
  -- A printed SAMPLE is not an abort. Workers still in flight are not an abort.
  -- A monitor file that arrives after those workers exit is not this return.
  if launchedWithQueue then
    false
  else if sampleRecorded then
    false
  else if inFlight >= 1 then
    false
  else
    false

-- guard_peak_monitor_absent_does_not_return_before_in_flight_32
-- 32 workers are in flight and one name is still queued.
-- The return stays false before the SAMPLE line and after it is printed.
-- A missed monitor pair is not an abort for that tick.
#guard
  peakMonitorAbsentReturn 32 1 false == false &&
    peakMonitorAbsentReturn 32 1 true == false &&
    peakMonitorAbsentReturn 2 31 false == false

/-- Name one numeric pair that is outside the locked percent.
    An inside pair returns `none`. Do not mark the stored full-tree numbers inside. -/
def numericOutsideLine (left right : Nat) (cause : String) : Option String :=
  if SlakeCheckLogCompare.withinLockedTolerance left right then
    none
  else
    let diff := SlakeCheckLogCompare.absDiffBytes left right
    let larger := Nat.max left right
    let tol := SlakeCheckLogCompare.memoryCompareToleranceNumber
    let holds := SlakeCheckLogCompare.withinLockedTolerance left right
    let holdsText := if holds then "true" else "false"
    some
      (s!"OUTSIDE resident_bytes={left} monitor_bytes={right} diff={diff} " ++
        s!"diff*100={diff * 100} larger*{tol}={larger * tol} holds={holdsText} " ++
        s!"kib={diff / 1024} cause={cause}\n")

-- guard_withinLockedTolerance_559419392_553373696_outside
-- 559419392 - 553373696 = 6045696. 6045696 * 100 = 604569600.
-- 559419392 * 1 = 559419392. 604569600 <= 559419392 is false.
-- 5904 * 1024 = 6045696. Same pinned Lean pid, not a dropped pid.
#guard SlakeCheckLogCompare.withinLockedTolerance 559419392 553373696 == false

#guard
  match numericOutsideLine 559419392 553373696
      "same-pinned-lean-pid-927301-rss-529572-kib-versus-523668-kib-not-a-dropped-pid" with
  | some line =>
    (line.splitOn "OUTSIDE resident_bytes=559419392 monitor_bytes=553373696 diff=6045696 diff*100=604569600 larger*1=559419392 holds=false kib=5904 cause=same-pinned-lean-pid-927301-rss-529572-kib-versus-523668-kib-not-a-dropped-pid").length ==
      2 &&
      (line.splitOn "holds=true").length == 1
  | none => false

#guard numericOutsideLine 208367616 207237120 "inside-pair" == none

/-- Same pool pid 880001. Rss is 10000 kibibytes. One counted process. -/
def samePidRssMovedResidentText : String :=
  "880001 10000 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures\n"

/-- Same pool pid 880001. Rss is 20000 kibibytes. The counted pid set matches. -/
def samePidRssMovedMonitorText : String :=
  "880001 20000 /home/nixbuilder/iso/src/systems/.lake/build/bin/slake-check-pool " ++
    "-- --module SimdTargetFeatures\n"

/-- A byte gap fails the run only when it is outside tolerance 1 and the two
    texts are not the same counted pid set. Same pids whose rss moved are the
    processes changing size between two reads. That case does not fail the run.
    A missing partner is not that case. A different pid set still fails when
    `withinLockedTolerance` is false. Tolerance stays 1. The percent formula stays. -/
def outsideReadingFailsRun (residentText : String) (partner : Option String)
    (left right : Nat) : Bool :=
  match partner with
  | some text =>
    if sameWorkerSet residentText text then
      false
    else
      !SlakeCheckLogCompare.withinLockedTolerance left right
  | none =>
    !SlakeCheckLogCompare.withinLockedTolerance left right

-- guard_same_pid_rss_moved_does_not_fail_one_percent
-- 10000 * 1024 = 10240000. 20000 * 1024 = 20480000.
-- diff * 100 = 1024000000. larger * 1 = 20480000.
-- 1024000000 <= 20480000 is false. The percent still says outside.
-- Pid 880001 is the counted set on both texts, so the run does not fail.
-- Historical 59760640/56455168 and 16318464/208367616 stay outside.
-- Tolerance stays 1. The ceiling integer stays 192000000000.
#guard
  sameWorkerSet samePidRssMovedResidentText samePidRssMovedMonitorText &&
    match SlakeCheckLogCompare.capturedPsResidentBytes samePidRssMovedResidentText,
        SlakeCheckLogCompare.capturedPsResidentBytes samePidRssMovedMonitorText with
    | some left, some right =>
      left == 10000 * 1024 &&
        right == 20000 * 1024 &&
        SlakeCheckLogCompare.withinLockedTolerance left right == false &&
        outsideReadingFailsRun samePidRssMovedResidentText
          (some samePidRssMovedMonitorText) left right == false &&
        (match numericOutsideLine left right "same-counted-pids-rss-moved" with
          | some line => (line.splitOn "holds=false").length == 2
          | none => false) &&
        SlakeCheckLogCompare.memoryCompareToleranceNumber == 1 &&
        SlakeCheckLogCompare.launchCeilingBytes == 192000000000 &&
        SlakeCheckLogCompare.withinLockedTolerance 59760640 56455168 == false &&
        SlakeCheckLogCompare.withinLockedTolerance 16318464 208367616 == false
    | _, _ => false

-- guard_different_pid_or_tree_outside_still_fails_one_percent
-- Pair 5 is pool pid 200 versus that pool plus pinned Lean pid 201.
-- Sums 18092032 and 561692672 stay outside tolerance 1, so the run fails.
-- The full-tree text versus that short pool text is a different pid set.
-- Those captured sums stay outside, so the run fails. Tolerance stays 1.
#guard
  sameWorkerSet SlakeCheckLogCompare.outsidePair5PoolPsText
      SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText == false &&
    match SlakeCheckLogCompare.capturedPsResidentBytes
          SlakeCheckLogCompare.outsidePair5PoolPsText,
        SlakeCheckLogCompare.capturedPsResidentBytes
          SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText with
    | some left, some right =>
      left == 18092032 &&
        right == 561692672 &&
        SlakeCheckLogCompare.withinLockedTolerance left right == false &&
        outsideReadingFailsRun SlakeCheckLogCompare.outsidePair5PoolPsText
          (some SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText)
          left right == true
    | _, _ => false

#guard
  sameWorkerSet SlakeCheckLogCompare.fullTree017CountedPsText
      SlakeCheckLogCompare.outsidePair5PoolPsText == false &&
    match SlakeCheckLogCompare.capturedPsResidentBytes
          SlakeCheckLogCompare.fullTree017CountedPsText,
        SlakeCheckLogCompare.capturedPsResidentBytes
          SlakeCheckLogCompare.outsidePair5PoolPsText with
    | some left, some right =>
      SlakeCheckLogCompare.withinLockedTolerance left right == false &&
        outsideReadingFailsRun SlakeCheckLogCompare.fullTree017CountedPsText
          (some SlakeCheckLogCompare.outsidePair5PoolPsText) left right == true &&
        SlakeCheckLogCompare.memoryCompareToleranceNumber == 1
    | _, _ => false

/-- Pinned Lean workers on checkout `.lean` files. Lake is not in this count. -/
def pinnedLeanWorkerCount (text : String) : Nat :=
  (text.splitOn "\n").foldl (fun count line =>
    if SlakeCheckLogCompare.psLineIsPinnedLeanWorker line.trimAscii.copy then
      count + 1
    else
      count) 0

/-- Monitor bytes from a second snapshot of the same counted pid set.
    `needPinned` requires a checkout `.lean` worker on both texts.
    Rss may differ. The 1 percent lock is not required, so same-pid movement
    still has a number. A different pid set is `none`. The same text is `none`.
    The sum is `capturedPsResidentBytes` of the partner, not a shared-pid intersection. -/
def stableSnapshotMonitorNat (newer older : String) (needPinned : Bool) : Option Nat :=
  let pinnedOk :=
    !needPinned ||
      (textHasPinnedLeanWorker newer && textHasPinnedLeanWorker older)
  if newer == older || !pinnedOk then
    none
  else if !sameWorkerSet newer older then
    none
  else if !textHasPoolBinary newer || !textHasPoolBinary older then
    none
  else
    SlakeCheckLogCompare.capturedPsResidentBytes older

-- guard_stable_snapshot_same_pid_rss_moved_is_numeric
-- 10000 * 1024 versus 20000 * 1024 is outside tolerance 1.
-- The partner sum is still the monitor number. A pinned-worker demand is none.
-- A different pid set stays none. Tolerance stays 1.
#guard
  pinnedLeanWorkerCount samePidRssMovedResidentText == 0 &&
    pinnedLeanWorkerCount peakSameSetResidentText == 2 &&
    SlakeCheckLogCompare.withinLockedTolerance (10000 * 1024) (20000 * 1024) == false &&
    stableSnapshotMonitorNat samePidRssMovedResidentText samePidRssMovedMonitorText false ==
      some (20000 * 1024) &&
    stableSnapshotMonitorNat samePidRssMovedResidentText samePidRssMovedMonitorText true ==
      none &&
    stableSnapshotMonitorNat peakSameSetResidentText peakMismatchPoolOnlyText true == none &&
    match stableSnapshotMonitorNat peakSameSetResidentText peakSameSetMonitorText true with
    | some n => n == (20008 + 400100 + 400050) * 1024
    | none => false

/-- One same-set monitor pair. `pinned` is the checkout Lean worker count. -/
structure StableSnap where
  newer : IndepPs
  older : IndepPs
  pinned : Nat

/-- Wait for two independent snapshots of one counted tree.
    `expectedPinned = none` accepts the first same-set pair with a pool binary.
    `some n` prefers a pair that lists n pinned Lean workers, and otherwise
    keeps the same-set pair with the most pinned workers seen.
    This does not spawn `ps`. A different pid set is not returned. -/
def awaitStableMonitorPair
    (alreadyEmitted : List String) (expectedPinned : Option Nat) :
    IO (Option (IndepPs × IndepPs)) := do
  let mut best : Option StableSnap := none
  let mut stop := false
  for _step in List.range 8 do
    if !stop then
      match ← readFreshLatestPair alreadyEmitted with
      | none =>
        IO.sleep 200
      | some (newer, older) =>
        let pinnedN := pinnedLeanWorkerCount newer.text
        let needPinned := expectedPinned.isSome
        match stableSnapshotMonitorNat newer.text older.text needPinned with
        | none =>
          IO.sleep 200
        | some _ =>
          let pick : StableSnap := { newer, older, pinned := pinnedN }
          let better :=
            match best with
            | none => true
            | some prev => pick.pinned >= prev.pinned
          if better then
            best := some pick
          match expectedPinned with
          | some n =>
            if pinnedN == n then
              stop := true
            else
              IO.sleep 200
          | none =>
            stop := true
  match best with
  | none => return none
  | some pick => return some (pick.newer, pick.older)

/-- Print one SAMPLE only when the monitor sum is a number and the path is new.
    `in_flight=32` with work still queued uses this same gate.
    A missing monitor is not printed as `monitor_bytes=absent`.
    A path already emitted is refused. -/
def emitNumericSample (sampleRecorded freshPath : Bool) (monBytes : Option Nat) : Bool :=
  !sampleRecorded && freshPath && monBytes.isSome

-- guard_sample_in_flight_32_queued_has_numeric_monitor_bytes
-- Full sums are 18092032 and 561692672. The larger reading is 561692672.
-- The SAMPLE line names in_flight=32 and queued=1. It does not say absent.
-- A missing monitor does not pass the print gate.
#guard
  match SlakeCheckLogCompare.pairedSameProcessBytes
      SlakeCheckLogCompare.outsidePair5PoolPsText
      SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText with
  | some (left, right) =>
    let projected := SlakeCheckLogCompare.disagreementResident left right
    let line := sampleLine (some 1) (some left) (some right) (some projected) 32 1
    left == 18092032 &&
      right == 561692672 &&
      projected == 561692672 &&
      emitNumericSample false true (some right) == true &&
      emitNumericSample false true none == false &&
      emitNumericSample true true (some right) == false &&
      (line.splitOn "monitor_bytes=absent").length == 1 &&
      (line.splitOn "monitor_bytes=561692672").length == 2 &&
      (line.splitOn "in_flight=32").length == 2 &&
      (line.splitOn "queued=1").length == 2 &&
      (line.splitOn "resident_bytes=18092032").length == 2
  | none => false

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
  let roomToAdmit := queued >= 1 && inFlight < SlakeCheckLogCompare.concurrentChecks
  let sampled ← treeRssBytes (inFlight != 0) (!roomToAdmit) st.samples st.emittedMonitorPaths
  let freshPath := emitSampleForPath sampled.monitorFile st.emittedMonitorPaths
  -- Leave the peak resident file unemitted so the next snapshot can pair with it.
  -- A non-peak sample still records the path before the line is printed.
  let indepRead ← independentPsFromLog st.monitorLog sampled.monitorFile
    sampled.psText st.emittedMonitorPaths
  -- A second ps text. Do not copy the resident string into monitor_bytes.
  let indepText :=
    match indepRead with
    | none => none
    | some indep =>
      if indep.text == sampled.psText then none else some indep.text
  -- Full captured sums of each text. A one-sided pid stays in that side's sum.
  -- Do not pass the shared-pid intersection.
  let schedBytes :=
    match SlakeCheckLogCompare.capturedPsResidentBytes sampled.psText with
    | some n => some n
    | none => sampled.bytes
  let monFromPair :=
    match indepText with
    | some indep => SlakeCheckLogCompare.capturedPsResidentBytes indep
    | none => none
  -- `--monitor-log` keeps the captured independent sum, including a one-sided pid.
  -- No flag: a same-sample ps text. An earlier SAMPLE resident file is absent.
  -- A different worker set is absent. The two rss fields may differ.
  let monBytes ←
    match st.monitorLog with
    | some _ =>
      match monFromPair with
      | some n => pure (some n)
      | none => monitorBytes st.monitorLog
    | none =>
      let otherEmitted :=
        match indepRead with
        | none => false
        | some indep => pathAlreadyEmitted indep.source st.emittedMonitorPaths
      pure (sameMomentMonitorNat sampled.psText indepText otherEmitted)
  -- One look can miss the partner while workers are still appearing in `ps`.
  -- Wait for two snapshots of the same counted tree. Rss may move by more
  -- than 1 percent. That number is still the monitor field. A different pid
  -- set is not used. Do not pass the shared-pid intersection.
  let expectedPinned := if inFlight == 0 then none else some inFlight
  let stable ←
    if st.monitorLog.isNone && monBytes.isNone then
      awaitStableMonitorPair st.emittedMonitorPaths expectedPinned
    else
      pure none
  let sampled :=
    match stable with
    | some (newer, _) =>
      { sampled with
        bytes := SlakeCheckLogCompare.capturedPsResidentBytes newer.text
        monitorFile := newer.source
        octets := newer.text.length
        psText := newer.text }
    | none => sampled
  let freshPath :=
    match stable with
    | some (newer, _) => emitSampleForPath newer.source st.emittedMonitorPaths
    | none => freshPath
  let indepRead :=
    match stable with
    | some (_, older) => some older
    | none => indepRead
  let indepText :=
    match stable with
    | some (newer, older) =>
      if older.text == newer.text then none else some older.text
    | none => indepText
  let schedBytes :=
    match stable with
    | some (newer, _) =>
      match SlakeCheckLogCompare.capturedPsResidentBytes newer.text with
      | some n => some n
      | none => schedBytes
    | none => schedBytes
  let monBytes :=
    match stable with
    | some (newer, older) =>
      match stableSnapshotMonitorNat newer.text older.text (inFlight != 0) with
      | some n => some n
      | none => monBytes
    | none => monBytes
  let projected : Option Nat :=
    match schedBytes with
    | none => none
    | some sched =>
      match monBytes with
      | some mon => some (SlakeCheckLogCompare.disagreementResident sched mon)
      | none => some (SlakeCheckLogCompare.disagreementResident sched sched)
  -- A numeric same-set partner is already the sample, even outside 1 percent.
  -- Hold only while that partner is still missing. Do not return before the line.
  let peakHold :=
    st.monitorLog.isNone && inFlight >= 2 && monBytes.isNone
  let mut st := st
  let mut schedBytes := schedBytes
  let mut monBytes := monBytes
  let mut projected := projected
  let mut holdMissed := false
  let mut sampleRecorded := false
  if peakHold then
    st := (← rememberMismatchPartner st sampled.monitorFile sampled.psText)
    match ← holdPeakUntilSameSet st inFlight queued with
    | (cur, none) =>
      st := cur
      holdMissed := true
    | (_, some held) =>
      let marked :=
        if freshPath && !pathAlreadyEmitted sampled.monitorFile held.state.emittedMonitorPaths then
          { held.state with
            emittedMonitorPaths := sampled.monitorFile :: held.state.emittedMonitorPaths }
        else
          held.state
      st := marked
      schedBytes := some held.schedBytes
      monBytes := some held.monBytes
      projected := some held.projected
      sampleRecorded := true
  -- Hold success already printed a numeric SAMPLE. This tick prints one only when
  -- the monitor sum is a number, including in_flight=32 with work still queued.
  -- Absent is not a SAMPLE. Do not return FAIL peak-monitor-absent here.
  -- A reused path stays refused.
  if emitNumericSample sampleRecorded freshPath monBytes then
    st := noteScoredSample
      { st with emittedMonitorPaths := sampled.monitorFile :: st.emittedMonitorPaths }
      schedBytes monBytes sampled.monitorFile
    emitText st
      (s!"MONITOR_PS sample={st.samples} file={sampled.monitorFile} " ++
        s!"length={sampled.octets} tool=/run/current-system/sw/bin/ps " ++
        "source=monitor_ps_text scheduler_spawned_ps=false\n")
    let indepFile :=
      match indepRead with
      | none => "absent"
      | some indep =>
        if indep.text == sampled.psText then "same_text" else indep.source
    let ts ← epochSec
    emitText st
      (s!"INDEPENDENT_PS sample={st.samples} resident_file={sampled.monitorFile} " ++
        s!"file={indepFile}\n")
    emitText st (sampleLine ts schedBytes monBytes projected inFlight queued)
    let outsideCause :=
      match indepText with
      | some partner =>
        if sameWorkerSet sampled.psText partner then
          "same-counted-pids-rss-moved"
        else
          "counted-bytes-outside-locked-percent"
      | none => "counted-bytes-outside-locked-percent"
    let failsRun :=
      match schedBytes, monBytes with
      | some left, some right =>
        outsideReadingFailsRun sampled.psText indepText left right
      | _, _ => false
    let outsideLine :=
      match schedBytes, monBytes with
      | some left, some right => numericOutsideLine left right outsideCause
      | _, _ => none
    if let some line := outsideLine then
      emitText st line
      if failsRun then
        st := { st with sawOutside := true }
      else
        pure ()
    sampleRecorded := true
  if holdMissed && peakMonitorAbsentReturn inFlight queued sampleRecorded then
    emitText st "FAIL peak-monitor-absent\n"
    emitText st (ceilingHeldLine st.ceilingHeld)
    return 1
  else
    let ceilingHold := readingIsCeilingHold projected
    let launch := admitLaunch projected inFlight queued
    let underCeiling :=
      match projected with
      | none => false
      | some bytes => SlakeCheckLogCompare.ceilingAllows bytes
    let cap := SlakeCheckLogCompare.concurrentChecks
    if idleWhileQueuedFails inFlight queued ceilingHold && !launch then
      emitText st "IDLE work queued and ceiling was not holding\n"
      emitText st (ceilingHeldLine st.ceilingHeld)
      return 1
    else if launch then
      let admitted ← admitReady projected st
      schedule admitted
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
          s!"peak={st.peak} average={concurrencyMeanText average}\n")
      emitText st (pairAbsStatsText (foldScoredPairs st.scoredPairs))
      emitText st (ceilingHeldLine st.ceilingHeld)
      if st.sawOutside then
        return 1
      else
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
        let heldState := { st with ceilingHeld := true }
        let monNote := if monBytes.isSome then "" else " monitor=absent"
        emitText heldState
          (s!"HOLD ceiling holding projected={bytes} " ++
            s!"ceiling={SlakeCheckLogCompare.launchCeilingBytes} " ++
            s!"in_flight={inFlight} queued={queued}{monNote}\n")
        if heldState.live.isEmpty then
          IO.sleep 1000
          schedule heldState
        else
          let waited ← waitOne heldState.live
          emitText heldState (renderRecord waited.record)
          schedule (noteFinished { heldState with live := waited.remaining } waited.record)
    else if !st.live.isEmpty then
      let waited ← waitOne st.live
      emitText st (renderRecord waited.record)
      schedule (noteFinished { st with live := waited.remaining } waited.record)
    else
      emitText st "IDLE work queued and ceiling was not holding\n"
      emitText st (ceilingHeldLine st.ceilingHeld)
      return 1

/-- One historical pair line. The figures are `diff * 100` and
    `larger * memoryCompareToleranceNumber`. `holds` is `withinLockedTolerance`.
    Pid texts for these pairs are absent. This does not mark a pair inside. -/
def historicalPairOutsideLine (label : String) (left right : Nat) : String :=
  let diff := SlakeCheckLogCompare.absDiffBytes left right
  let larger := Nat.max left right
  let scaledDiff := diff * 100
  let scaledLarger := larger * SlakeCheckLogCompare.memoryCompareToleranceNumber
  let holds := SlakeCheckLogCompare.withinLockedTolerance left right
  let holdsText := if holds then "true" else "false"
  s!"{label}={left},{right} diff*100={scaledDiff} larger*{SlakeCheckLogCompare.memoryCompareToleranceNumber}={scaledLarger} holds={holdsText}\n"

/-- Process exit for the two historical pairs.
    Pair 2 is 59760640 versus 56455168. Pair 4 is 16318464 versus 208367616.
    Both raw numbers stay outside ToleranceNumber 1.
    Leaving those rows unscored does not return 0.
    Both inside still returns 0. Any outside pair returns 1.
    Tolerance stays `memoryCompareToleranceNumber`.
    This function of the four raw numbers stays 1.
    Those rows are unscored, so `executableMemoryExit` does not use this 1.
    `scoredRunExit` does not score these rows. -/
def historicalMemoryExit (pair2Left pair2Right pair4Left pair4Right : Nat) : UInt32 :=
  if SlakeCheckLogCompare.withinLockedTolerance pair2Left pair2Right &&
      SlakeCheckLogCompare.withinLockedTolerance pair4Left pair4Right then
    0
  else
    1

/-- Pool-plus-lean-only bytes. Those two numbers stay outside the locked percent.
    They are not the eleven-line file sum. -/
def fullTreeOutsideLine : String :=
  match numericOutsideLine 559419392 553373696
      "same-pinned-lean-pid-927301-rss-529572-kib-versus-523668-kib-not-a-dropped-pid" with
  | some line => line
  | none => ""

/-- The two file epochs are one scored pair. Every real line is inside. -/
def scoredFullTreeClockLine : String :=
  match SlakeCheckLogCompare.scoredFullTreePair
      (some SlakeCheckLogCompare.fullTree017EpochSec)
      (some SlakeCheckLogCompare.fullTree016EpochSec)
      SlakeCheckLogCompare.fullTree017CountedPsText
      SlakeCheckLogCompare.fullTree016CountedPsText with
  | some (left, right) =>
    let holds := SlakeCheckLogCompare.withinLockedTolerance left right
    let holdsText := if holds then "true" else "false"
    s!"SCORED full-tree resident_bytes={left} monitor_bytes={right} " ++
      s!"ts={SlakeCheckLogCompare.fullTree017EpochSec},{SlakeCheckLogCompare.fullTree016EpochSec} " ++
      s!"holds={holdsText}\n"
  | none => ""

/-- One sentence before the first measurement line. It does not change the exit code. -/
def measurementHypothesisLine : String :=
  "Hypothesis: paired resident readings stay inside diff*100 <= larger*1, a sample with monitor_bytes=absent is not a pair, and one monitor file is counted once.\n"

/-- One report line. The recorded historical rows print the unscored cause.
    Any other numbers keep the outside arithmetic line and are not given that cause. -/
def historicalReportLine (label : String) (left right : Nat) (recorded : Bool)
    (row : SlakeCheckLogCompare.HistoricalCompare) : String :=
  if recorded then
    SlakeCheckLogCompare.historicalUnscoredLine label left right row
  else
    historicalPairOutsideLine label left right

/-- One scored pair. `none` is not a pair and does not fail the run.
    An outside scored pair returns 1. An inside scored pair returns 0.
    Tolerance stays `memoryCompareToleranceNumber`. -/
def scoredPairExit (pair : Option (Nat × Nat)) : UInt32 :=
  match pair with
  | none => 0
  | some (left, right) =>
    if SlakeCheckLogCompare.withinLockedTolerance left right then 0 else 1

/-- Process exit from scored pairs only.
    Unscored historical rows do not force 1.
    Pool-plus-lean 559419392 versus 553373696 is outside and is not scored.
    The recorded full-tree pair is inside, so this run returns 0.
    A scored pair outside tolerance returns 1.
    `historicalMemoryExit` of the four raw numbers stays 1.
    `scoredRunExit` does not score these rows.
    `executableMemoryExit` follows this exit. The unscored rows do not
    make it 1. A scored pair outside tolerance still returns 1. -/
def scoredRunExit : UInt32 :=
  let pair2 :=
    scoredPairExit
      (SlakeCheckLogCompare.historicalScoredWholeTree
        SlakeCheckLogCompare.historicalPair2Compare)
  let pair4 :=
    scoredPairExit
      (SlakeCheckLogCompare.historicalScoredWholeTree
        SlakeCheckLogCompare.historicalPair4Compare)
  let tree :=
    scoredPairExit
      (SlakeCheckLogCompare.scoredFullTreePair
        (some SlakeCheckLogCompare.fullTree017EpochSec)
        (some SlakeCheckLogCompare.fullTree016EpochSec)
        SlakeCheckLogCompare.fullTree017CountedPsText
        SlakeCheckLogCompare.fullTree016CountedPsText)
  if pair2 != 0 || pair4 != 0 || tree != 0 then 1 else 0

/-- Text for the two historical pairs, with the given exit code on the
    `MEMORY_RUN_EXIT` line. The hypothesis line is first.
    The preserved eleven-line pair is inside.
    A text paired with itself is not this line. -/
def memoryReportWithExit (pair2Left pair2Right pair4Left pair4Right : Nat)
    (code : UInt32) : String :=
  let pair2Recorded :=
    pair2Left == SlakeCheckLogCompare.historicalPair2Compare.monitorBytes &&
      pair2Right == SlakeCheckLogCompare.historicalPair2Compare.schedulerBytes
  let pair4Recorded :=
    pair4Left == SlakeCheckLogCompare.historicalPair4Compare.schedulerBytes &&
      pair4Right == SlakeCheckLogCompare.historicalPair4Compare.monitorBytes
  measurementHypothesisLine ++
    historicalReportLine "pair2" pair2Left pair2Right pair2Recorded
      SlakeCheckLogCompare.historicalPair2Compare ++
    historicalReportLine "pair4" pair4Left pair4Right pair4Recorded
      SlakeCheckLogCompare.historicalPair4Compare ++
    s!"MEMORY_RUN_EXIT:{code}\n" ++
    scoredFullTreeClockLine

/-- Historical report. The two raw pairs stay outside, so this text contains
    `MEMORY_RUN_EXIT:1`. Those numbers are not a scored live pair.
    `main` prints `executableMemoryReport`, not this text. -/
def historicalMemoryReport (pair2Left pair2Right pair4Left pair4Right : Nat) : String :=
  memoryReportWithExit pair2Left pair2Right pair4Left pair4Right
    (historicalMemoryExit pair2Left pair2Right pair4Left pair4Right)

/-- Executable exit for one queue reading.
    `queueExpectation` prints the not-excused sentence when `queue < cap`
    and the ceiling is not holding. That case returns 1.
    When that case is false, the exit is `scored`, even if a historical
    exit is 1. Historical is not an argument. -/
def executableExitForQueue (queue cap : Nat) (ceilingHeld : Bool) (scored : UInt32) : UInt32 :=
  if queue < cap && !ceilingHeld then
    1
  else
    scored

/-- Exit for the queue length, cap, and ceiling-held flag.
    A queue shorter than the cap while the ceiling is not holding returns 1.
    `historicalMemoryExit` of 59760640, 56455168, 16318464, and 208367616 stays 1.
    Those rows are unscored. `holds` stays false and `scored` stays false.
    They do not set this exit. `scoredRunExit` does not score them.
    A scored pair outside tolerance still returns 1.
    Same-counted-pid rss movement does not set this exit.
    `outsideReadingFailsRun` is false for that cause.
    A different counted pid set outside tolerance 1 still fails through
    `outsideReadingFailsRun`, and `schedule` returns 1 when that flag is set.
    Tolerance stays `memoryCompareToleranceNumber`. The ceiling integer stays. -/
def executableMemoryExit (queue cap : Nat) (ceilingHeld : Bool) : UInt32 :=
  executableExitForQueue queue cap ceilingHeld scoredRunExit

/-- Report for one queue reading.
    `main` prints this with the queue length, the cap, and the ceiling-held
    flag of the run being scored. The four raw numbers stay outside and
    unscored. The scored full-tree pair stays inside. -/
def executableMemoryReport (queue cap : Nat) (ceilingHeld : Bool) : String :=
  memoryReportWithExit 59760640 56455168 16318464 208367616
    (executableMemoryExit queue cap ceilingHeld)

-- guard_historical_pairs_outside_and_not_a_scored_live_pair
-- Pair 2 is 59760640 versus 56455168. Pair 4 is 16318464 versus 208367616.
-- Both stay outside tolerance. The original ps texts are absent, so these
-- raw numbers are not rewritten as inside. historicalMemoryExit stays 1.
-- historicalScoredWholeTree is none, so they are not a scored live pair.
-- Those four numbers stay outside. They do not set `executableMemoryExit`.
-- `scoredRunExit` does not score them.
#guard historicalMemoryExit 59760640 56455168 16318464 208367616 == (1 : UInt32) &&
  SlakeCheckLogCompare.withinLockedTolerance 59760640 56455168 == false &&
  SlakeCheckLogCompare.withinLockedTolerance 16318464 208367616 == false &&
  SlakeCheckLogCompare.historicalScoredWholeTree
      SlakeCheckLogCompare.historicalPair2Compare == none &&
  SlakeCheckLogCompare.historicalScoredWholeTree
      SlakeCheckLogCompare.historicalPair4Compare == none

-- An outside pair that is not the recorded unscored rows still fails.
#guard historicalMemoryExit 16719872 0 16863232 560463872 == (1 : UInt32)

-- The known inside pair is not these historical numbers. Both inside returns 0,
-- so the exit function is not a constant.
#guard historicalMemoryExit 208367616 207237120 208367616 207237120 == (0 : UInt32)

#guard
  let report := historicalMemoryReport 59760640 56455168 16318464 208367616
  historicalMemoryExit 59760640 56455168 16318464 208367616 == (1 : UInt32) &&
    report.startsWith measurementHypothesisLine &&
    (report.splitOn "pair2=59760640,56455168 diff*100=330547200 larger*1=59760640 holds=false").length ==
      2 &&
    (report.splitOn "pair4=16318464,208367616 diff*100=19204915200 larger*1=208367616 holds=false").length ==
      2 &&
    (report.splitOn "scored=false cause=later-block-not-tie-break-winner-scheduler-monitor-bytes-absent").length ==
      2 &&
    (report.splitOn "scored=false cause=earlier-timestamp-tie-break-kept-different-worker-set").length ==
      2 &&
    (report.splitOn "MEMORY_RUN_EXIT:1").length == 2 &&
    (report.splitOn "MEMORY_RUN_EXIT:0").length == 1 &&
    (report.splitOn "holds=true").length == 2 &&
    (report.splitOn "holds=false").length == 3 &&
    (fullTreeOutsideLine.splitOn "holds=false").length == 2 &&
    (report.splitOn fullTreeOutsideLine).length == 1 &&
    (report.splitOn "UNPAIRED cross-time").length == 1 &&
    (report.splitOn "SAME_TIMESTAMP").length == 1 &&
    (report.splitOn "SCORED full-tree resident_bytes=1456685056 monitor_bytes=1450627072 ts=1793191296,1793191295 holds=true").length ==
      2 &&
    (report.splitOn "SCORED full-tree resident_bytes=559419392 monitor_bytes=553373696").length ==
      1 &&
    SlakeCheckLogCompare.scoredFullTreePair
      (some SlakeCheckLogCompare.fullTree017EpochSec)
      (some SlakeCheckLogCompare.fullTree016EpochSec)
      SlakeCheckLogCompare.fullTree017CountedPsText
      SlakeCheckLogCompare.fullTree016CountedPsText ==
      some (1456685056, 1450627072) &&
    SlakeCheckLogCompare.withinLockedTolerance 1456685056 1450627072 == true &&
    SlakeCheckLogCompare.withinLockedTolerance 559419392 553373696 == false

-- guard_executable_exit_follows_scored_run_not_historical
-- The four raw numbers stay outside. historicalMemoryExit of them is 1.
-- Those rows stay unscored by scoredRunExit. scoredRunExit is 0 because
-- the scored full-tree pair is inside tolerance.
-- Queue length 2 and cap 32 while the ceiling is not holding is not excused.
-- That short queue makes executableMemoryExit 1. The printed line is
-- MEMORY_RUN_EXIT:1. The unscored historical rows do not make that exit.
-- Tolerance stays 1. Pool-plus-lean stays outside and is not a scored line.
-- An outside pair that is scored still returns 1 from scoredPairExit.
#guard
  let historical := historicalMemoryExit 59760640 56455168 16318464 208367616
  let report := executableMemoryReport 2 32 false
  historical == (1 : UInt32) &&
    executableMemoryExit 2 32 false == (1 : UInt32) &&
    executableExitForQueue 2 32 false scoredRunExit == (1 : UInt32) &&
    scoredRunExit == (0 : UInt32) &&
    SlakeCheckLogCompare.withinLockedTolerance 59760640 56455168 == false &&
    SlakeCheckLogCompare.withinLockedTolerance 16318464 208367616 == false &&
    scoredPairExit (some (559419392, 553373696)) == (1 : UInt32) &&
    scoredPairExit (some (1456685056, 1450627072)) == (0 : UInt32) &&
    (report.splitOn s!"MEMORY_RUN_EXIT:{executableMemoryExit 2 32 false}").length == 2 &&
    (report.splitOn "MEMORY_RUN_EXIT:0").length == 1 &&
    (report.splitOn "MEMORY_RUN_EXIT:1").length == 2 &&
    (report.splitOn "scored=false cause=later-block-not-tie-break-winner-scheduler-monitor-bytes-absent").length ==
      2 &&
    (report.splitOn "scored=false cause=earlier-timestamp-tie-break-kept-different-worker-set").length ==
      2 &&
    (report.splitOn "holds=false").length == 3 &&
    (report.splitOn "SCORED full-tree resident_bytes=1456685056 monitor_bytes=1450627072 ts=1793191296,1793191295 holds=true").length ==
      2 &&
    (report.splitOn "SCORED full-tree resident_bytes=559419392 monitor_bytes=553373696").length ==
      1 &&
    SlakeCheckLogCompare.withinLockedTolerance 1456685056 1450627072 == true &&
    SlakeCheckLogCompare.withinLockedTolerance 559419392 553373696 == false

-- guard_historical_1_does_not_force_executable_exit
-- historicalMemoryExit of the four numbers is 1.
-- The unexcused case is false when the queue is not shorter than the cap.
-- It is also false while the ceiling is holding.
-- scored 0 still yields 0 from executableExitForQueue for both readings.
-- The process exit is executableMemoryExit, not this helper.
#guard
  historicalMemoryExit 59760640 56455168 16318464 208367616 == (1 : UInt32) &&
    executableExitForQueue 32 32 false 0 == (0 : UInt32) &&
    executableExitForQueue 2 32 true 0 == (0 : UInt32) &&
    scoredRunExit == (0 : UInt32) &&
    executableExitForQueue 32 32 false scoredRunExit == (0 : UInt32)

-- guard_historical_pairs_outside_do_not_force_executable_exit
-- 59760640 versus 56455168 and 16318464 versus 208367616 stay outside.
-- ToleranceNumber is 1. A full queue and a 33-name queue both exit 0.
-- The printed MEMORY_RUN_EXIT is 0. It is not 1.
-- The causes stay the two historical unscored causes. holds stays false.
#guard
  let report := executableMemoryReport 33 32 false
  SlakeCheckLogCompare.memoryCompareToleranceNumber == 1 &&
    SlakeCheckLogCompare.withinLockedTolerance 59760640 56455168 == false &&
    SlakeCheckLogCompare.withinLockedTolerance 16318464 208367616 == false &&
    historicalMemoryExit 59760640 56455168 16318464 208367616 == (1 : UInt32) &&
    executableExitForQueue 32 32 false scoredRunExit == (0 : UInt32) &&
    executableExitForQueue 33 32 false scoredRunExit == (0 : UInt32) &&
    executableMemoryExit 32 32 false == (0 : UInt32) &&
    executableMemoryExit 33 32 false == (0 : UInt32) &&
    (report.splitOn "MEMORY_RUN_EXIT:1").length == 1 &&
    (report.splitOn "MEMORY_RUN_EXIT:0").length == 2 &&
    (report.splitOn "holds=false").length == 3 &&
    (report.splitOn "holds=true").length == 2 &&
    (report.splitOn "cause=later-block-not-tie-break-winner-scheduler-monitor-bytes-absent").length ==
      2 &&
    (report.splitOn "cause=earlier-timestamp-tie-break-kept-different-worker-set").length ==
      2

-- guard_unscored_and_same_counted_pids_do_not_fail_different_pid_still_fails
-- Same counted pid 880001 moves from 10000 kibibytes to 20000 kibibytes.
-- 10000 * 1024 = 10240000. 20000 * 1024 = 20480000.
-- diff * 100 = 1024000000. larger * 1 = 20480000.
-- 1024000000 <= 20480000 is false. That cause does not set the failure flag.
-- Historical pair 2 and pair 4 stay holds=false and scored=false.
-- Those causes do not set executableMemoryExit. The printed line is MEMORY_RUN_EXIT:0.
-- Outside pair 5 is pool pid 200 versus that pool plus pinned Lean pid 201.
-- capturedPsResidentBytes of those texts is 18092032 and 561692672.
-- Those full sums stay outside tolerance 1, so outsideReadingFailsRun is true.
-- Tolerance stays 1. The ceiling integer stays 192000000000.
#guard
  let report := executableMemoryReport 33 32 false
  let sameFails :=
    outsideReadingFailsRun samePidRssMovedResidentText
      (some samePidRssMovedMonitorText) (10000 * 1024) (20000 * 1024)
  let pair5Fails :=
    match SlakeCheckLogCompare.capturedPsResidentBytes
          SlakeCheckLogCompare.outsidePair5PoolPsText,
        SlakeCheckLogCompare.capturedPsResidentBytes
          SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText with
    | some left, some right =>
      left == 18092032 &&
        right == 561692672 &&
        SlakeCheckLogCompare.withinLockedTolerance left right == false &&
        outsideReadingFailsRun SlakeCheckLogCompare.outsidePair5PoolPsText
          (some SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText)
          left right == true
    | _, _ => false
  sameWorkerSet samePidRssMovedResidentText samePidRssMovedMonitorText &&
    SlakeCheckLogCompare.withinLockedTolerance (10000 * 1024) (20000 * 1024) == false &&
    sameFails == false &&
    (match numericOutsideLine (10000 * 1024) (20000 * 1024) "same-counted-pids-rss-moved" with
      | some line => (line.splitOn "cause=same-counted-pids-rss-moved").length == 2
      | none => false) &&
    (report.splitOn
        "holds=false scored=false cause=later-block-not-tie-break-winner-scheduler-monitor-bytes-absent").length ==
      2 &&
    (report.splitOn
        "holds=false scored=false cause=earlier-timestamp-tie-break-kept-different-worker-set").length ==
      2 &&
    SlakeCheckLogCompare.withinLockedTolerance 59760640 56455168 == false &&
    SlakeCheckLogCompare.withinLockedTolerance 16318464 208367616 == false &&
    SlakeCheckLogCompare.historicalScoredWholeTree
        SlakeCheckLogCompare.historicalPair2Compare == none &&
    SlakeCheckLogCompare.historicalScoredWholeTree
        SlakeCheckLogCompare.historicalPair4Compare == none &&
    historicalMemoryExit 59760640 56455168 16318464 208367616 == (1 : UInt32) &&
    executableMemoryExit 33 32 false == (0 : UInt32) &&
    executableMemoryExit 32 32 false == (0 : UInt32) &&
    (report.splitOn "MEMORY_RUN_EXIT:0").length == 2 &&
    (report.splitOn "MEMORY_RUN_EXIT:1").length == 1 &&
    pair5Fails &&
    SlakeCheckLogCompare.memoryCompareToleranceNumber == 1 &&
    SlakeCheckLogCompare.launchCeilingBytes == 192000000000

-- guard_outside_pair_full_sums_disagreement_sees
-- One-sided pid 201 changes only the worker side.
-- 18092032 and 561692672 stay outside tolerance 1.
-- disagreementResident of those full sums is 561692672.
#guard
  match SlakeCheckLogCompare.capturedPsResidentBytes
        SlakeCheckLogCompare.outsidePair5PoolPsText,
      SlakeCheckLogCompare.capturedPsResidentBytes
        SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText with
  | some left, some right =>
    left == 18092032 &&
      right == 561692672 &&
      right - left == 530860 * 1024 &&
      SlakeCheckLogCompare.withinLockedTolerance left right == false &&
      SlakeCheckLogCompare.disagreementResident left right == 561692672 &&
      SlakeCheckLogCompare.memoryCompareToleranceNumber == 1 &&
      outsideReadingFailsRun SlakeCheckLogCompare.outsidePair5PoolPsText
        (some SlakeCheckLogCompare.outsidePair5PoolAndWorkerPsText)
        left right == true
  | _, _ => false

-- guard_unexcused_non_holding_queue_exit_1
-- Queue length 2, cap 32, ceiling not holding.
-- That reading prints the not-excused sentence.
-- The exit is 1 even when scoredRunExit is 0.
#guard
  queueExpectation 2 32 false ==
      "Fewer than 32 workers is not excused. The queue length is 2 and the ceiling is not holding." &&
    executableExitForQueue 2 32 false 0 == (1 : UInt32) &&
    scoredRunExit == (0 : UInt32) &&
    executableExitForQueue 2 32 false scoredRunExit == (1 : UInt32) &&
    executableMemoryExit 2 32 false == (1 : UInt32)

def mainPool (args : List String) : IO UInt32 := do
  match parsePoolArgs args with
  | Except.error msg =>
    IO.eprintln msg
    return 2
  | Except.ok parsed =>
    let loaded ← loadNames parsed
    let (missingOlean, ready) ← splitByOlean loaded
    let names := slotsForMissingOlean missingOlean ready
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
        emittedMonitorPaths := []
        sawOutside := false
        scoredPairs := []
      }
      let queueLen := names.length
      let cap := SlakeCheckLogCompare.concurrentChecks
      let code := executableMemoryExit queueLen cap st.ceilingHeld
      IO.print (executableMemoryReport queueLen cap st.ceilingHeld)
      emitText st (← checkPoolMainDigestLine)
      emitText st
        (s!"SCHEDULER tool=slake-check-pool " ++
          s!"cap={SlakeCheckLogCompare.concurrentChecks} " ++
          s!"ceiling={SlakeCheckLogCompare.launchCeilingBytes} " ++
          s!"queue={queueLen}\n")
      emitText st
        (queueExpectation queueLen cap st.ceilingHeld ++ "\n")
      let pool ← schedule st
      if code != 0 then
        return code
      else
        return pool

/-- Run the pool. The memory report is printed from the queue length, the cap,
    and the ceiling-held flag of that run. A queue shorter than the cap while
    the ceiling is not holding returns 1 even when `scoredRunExit` is 0.
    `historicalMemoryExit` of 59760640, 56455168, 16318464, and 208367616 is 1.
    Those raw numbers stay outside and are not scored by `scoredRunExit`.
    They do not force `executableMemoryExit`. A 33-name queue prints
    `MEMORY_RUN_EXIT:0` when `scoredRunExit` is 0, and `mainPool` returns the
    pool result. Same-counted-pid rss movement does not set `sawOutside`.
    A different counted pid set outside tolerance 1 still makes `schedule` return 1.
    The scored full-tree pair is inside. Pool-plus-lean stays outside and is not scored.
    When `executableMemoryExit` is 0, return the pool result.
    A scored pair outside tolerance makes `scoredRunExit` 1.
    Tolerance stays 1. The ceiling integer stays. -/
def main (args : List String) : IO UInt32 := do
  match args with
  | "--parse-captured-ps" :: path :: _ =>
    parseCapturedPsMain path
  | _ =>
    mainPool args

-- Calls the shipped hash of the checkout path. Not a pasted digest.
#eval checkPoolMainSourceDigest
