/-
SPDX-License-Identifier: Unlicense

Lake executable slake-memory-pair.
Pairs scheduler SAMPLE lines with an independent monitor log by calling
SlakeCheckLogCompare.pairByNearestTimestamp, memoryPairInsideTolerance,
absDiffBytes, and absDiffPercentOfLarger.
This file does not sample resident memory.
Tool log lines use SystemsLean.ToolLog at the default threshold log.
-/

import SystemsLean.SlakeCheckLogCompare
import SystemsLean.ToolLog

-- toolLogWrite at defaultToolLogThreshold. Open failure keeps the caller's exit code.
def writeDefaultToolLog (level : ToolLogLevel) (message : String) : IO Unit := do
  let ms ← IO.monoMsNow
  try
    IO.FS.withFile "/dev/stderr" IO.FS.Mode.append fun handle =>
      toolLogWrite handle defaultToolLogThreshold level (toString ms) message
  catch _ =>
    pure ()

def usage : String :=
  "slake-memory-pair --scheduler-log PATH --monitor-log PATH\n" ++
  "Scheduler lines: SAMPLE ts=<sec> resident_bytes=<bytes>\n" ++
  "Monitor lines: ts=<sec> rss_kib=<kibibytes> " ++
  "or ts=<sec> resident_bytes=<bytes>\n" ++
  "rss_kib is converted to bytes by multiplying by 1024.\n"

structure PairArgs where
  schedulerLog : Option String
  monitorLog : Option String

def parsePairArgs (args : List String) : Except String PairArgs :=
  go { schedulerLog := none, monitorLog := none } args
where
  go (acc : PairArgs) : List String → Except String PairArgs
    | [] => Except.ok acc
    | "--" :: rest => go acc rest
    | "--scheduler-log" :: path :: rest =>
      go { acc with schedulerLog := some path } rest
    | "--monitor-log" :: path :: rest =>
      go { acc with monitorLog := some path } rest
    | _ => Except.error usage

def lineKVs (line : String) : List (String × String) :=
  (line.splitOn " ").filterMap SlakeCheckLogCompare.parseKV

def kvNat (key : String) (toks : List (String × String)) : Option Nat :=
  match toks with
  | [] => none
  | (k, v) :: rest =>
    if k == key then v.toNat? else kvNat key rest

def monitorSample (line : String) : Option SlakeCheckLogCompare.ResidentSample :=
  let toks := lineKVs line
  match kvNat "ts" toks with
  | none => none
  | some ts =>
    let bytes :=
      match kvNat "rss_kib" toks with
      | some kib => some (kib * 1024)
      | none => kvNat "resident_bytes" toks
    match bytes with
    | none => none
    | some resident => some { timestampSec := ts, residentBytes := resident }

def schedulerSample (line : String) : Option SlakeCheckLogCompare.ResidentSample :=
  if !String.startsWith line "SAMPLE " then
    none
  else
    let toks := lineKVs line
    match kvNat "ts" toks, kvNat "resident_bytes" toks with
    | some ts, some resident => some { timestampSec := ts, residentBytes := resident }
    | _, _ => none

def collect (parse : String → Option SlakeCheckLogCompare.ResidentSample)
    (text : String) : List SlakeCheckLogCompare.ResidentSample :=
  (text.splitOn "\n").foldl (fun acc line =>
    match parse line with
    | none => acc
    | some sample => acc ++ [sample]) []

def meanOf : List Nat → Nat
  | [] => 0
  | xs => xs.foldl (fun acc n => acc + n) 0 / xs.length

def maxOf (xs : List Nat) : Nat :=
  xs.foldl Nat.max 0

def timeOk (pair : SlakeCheckLogCompare.MemoryPair) : Bool :=
  let gap := SlakeCheckLogCompare.natAbsDiff
    pair.scheduler.timestampSec pair.monitor.timestampSec
  decide (gap <= SlakeCheckLogCompare.pairTimestampWindowSec)

structure PairFold where
  outside : Nat
  unpaired : Nat
  diffBytes : List Nat
  diffPercent : List Nat

def renderPair (sched : SlakeCheckLogCompare.ResidentSample)
    (paired : Option SlakeCheckLogCompare.MemoryPair) : String :=
  match paired with
  | none =>
    s!"UNPAIRED ts={sched.timestampSec} resident_bytes={sched.residentBytes} " ++
    "cause=outside-1-second-window\n"
  | some pair =>
    let inside := SlakeCheckLogCompare.memoryPairInsideTolerance pair
    let diffB := SlakeCheckLogCompare.absDiffBytes
      pair.scheduler.residentBytes pair.monitor.residentBytes
    let diffP := SlakeCheckLogCompare.absDiffPercentOfLarger
      pair.scheduler.residentBytes pair.monitor.residentBytes
    let cause :=
      if inside then "inside"
      else if timeOk pair then "byte-gap"
      else "timestamp-window"
    s!"PAIR ts={pair.scheduler.timestampSec} " ++
    s!"scheduler_bytes={pair.scheduler.residentBytes} " ++
    s!"monitor_bytes={pair.monitor.residentBytes} " ++
    s!"diff_bytes={diffB} diff_percent={diffP} " ++
    s!"inside={inside} cause={cause}\n"

def foldPair (acc : PairFold) (sched : SlakeCheckLogCompare.ResidentSample)
    (monitors : List SlakeCheckLogCompare.ResidentSample) : IO PairFold := do
  let paired := SlakeCheckLogCompare.pairByNearestTimestamp sched monitors
  IO.print (renderPair sched paired)
  match paired with
  | none =>
    return { acc with unpaired := acc.unpaired + 1 }
  | some pair =>
    let inside := SlakeCheckLogCompare.memoryPairInsideTolerance pair
    let diffB := SlakeCheckLogCompare.absDiffBytes
      pair.scheduler.residentBytes pair.monitor.residentBytes
    let diffP := SlakeCheckLogCompare.absDiffPercentOfLarger
      pair.scheduler.residentBytes pair.monitor.residentBytes
    return {
      acc with
      outside := acc.outside + (if inside then 0 else 1)
      diffBytes := acc.diffBytes ++ [diffB]
      diffPercent := acc.diffPercent ++ [diffP]
    }

def main (args : List String) : IO UInt32 := do
  writeDefaultToolLog ToolLogLevel.log "memory-pair start"
  match parsePairArgs args with
  | Except.error msg =>
    writeDefaultToolLog ToolLogLevel.error "memory-pair argument error"
    IO.eprintln msg
    return 2
  | Except.ok parsed =>
    match parsed.schedulerLog, parsed.monitorLog with
    | some schedPath, some monPath =>
      if schedPath == monPath then
        writeDefaultToolLog ToolLogLevel.error "memory-pair monitor-is-scheduler-log"
        IO.eprintln "REJECTED monitor-is-scheduler-log"
        return 1
      else
        let schedText ← IO.FS.readFile schedPath
        let monText ← IO.FS.readFile monPath
        let schedulers := collect schedulerSample schedText
        let monitors := collect monitorSample monText
        if schedulers.isEmpty then
          writeDefaultToolLog ToolLogLevel.error "memory-pair scheduler log has no SAMPLE lines"
          IO.eprintln "scheduler log has no SAMPLE resident_bytes lines"
          return 2
        else
          let mut acc : PairFold :=
            { outside := 0, unpaired := 0, diffBytes := [], diffPercent := [] }
          for sample in schedulers do
            let next ← foldPair acc sample monitors
            acc := next
          let count := schedulers.length
          IO.println
            (s!"PAIRS count={count} inside={count - acc.unpaired - acc.outside} " ++
              s!"outside={acc.outside} unpaired={acc.unpaired}")
          IO.println
            (s!"DIFF_BYTES mean={meanOf acc.diffBytes} max={maxOf acc.diffBytes}")
          IO.println
            (s!"DIFF_PERCENT mean={meanOf acc.diffPercent} max={maxOf acc.diffPercent}")
          if acc.unpaired == 0 && acc.outside == 0 then
            return 0
          else
            writeDefaultToolLog ToolLogLevel.warn
              s!"memory-pair outside={acc.outside} unpaired={acc.unpaired}"
            return 1
    | _, _ =>
      writeDefaultToolLog ToolLogLevel.error "memory-pair missing log path"
      IO.eprintln usage
      return 2
