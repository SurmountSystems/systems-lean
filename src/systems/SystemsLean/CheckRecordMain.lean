/-
SPDX-License-Identifier: Unlicense

Lake executable slake-check-record.
Builds one SlakeCheckLogCompare.CheckRecord and calls checkRecordComplete.
A path under /tmp is rejected by that function. Exit 0 is accepted.
Exit 1 is rejected. Exit 2 is a usage error.
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
  "slake-check-record --record FILE\n" ++
  "slake-check-record --tool NAME --command COMMAND --path PATH " ++
  "[--sha256 HEX] [--exit N] [--log LINE]\n" ++
  "Record file keys: tool, command, path, sha256, exit, log.\n" ++
  "Repeat log once per line. A missing sha256 or exit stays missing.\n"

structure RecordAcc where
  toolName : String
  canonicalCommand : String
  checkoutPath : String
  sha256 : Option String
  exitCode : Option Nat
  logLines : List String

def emptyAcc : RecordAcc :=
  { toolName := ""
    canonicalCommand := ""
    checkoutPath := ""
    sha256 := none
    exitCode := none
    logLines := [] }

def splitKey (line : String) : Option (String × String) :=
  match line.splitOn "=" with
  | [] => none
  | key :: rest =>
    if rest.isEmpty then none
    else some (key, String.intercalate "=" rest)

def addKey (acc : RecordAcc) (key value : String) : Except String RecordAcc :=
  if key == "tool" || key == "toolName" then
    Except.ok { acc with toolName := value }
  else if key == "command" || key == "canonicalCommand" then
    Except.ok { acc with canonicalCommand := value }
  else if key == "path" || key == "checkoutPath" then
    Except.ok { acc with checkoutPath := value }
  else if key == "sha256" then
    Except.ok { acc with sha256 := some value }
  else if key == "exit" || key == "exitCode" then
    match value.toNat? with
    | some n => Except.ok { acc with exitCode := some n }
    | none => Except.error usage
  else if key == "log" || key == "logLines" then
    Except.ok { acc with logLines := acc.logLines ++ [value] }
  else
    Except.ok acc

def parseLines (lines : List String) : Except String RecordAcc :=
  let rec go (acc : RecordAcc) : List String → Except String RecordAcc
    | [] => Except.ok acc
    | line :: rest =>
      let trimmed := line.trimAscii.copy
      if trimmed == "" || String.startsWith trimmed "#" then
        go acc rest
      else
        match splitKey trimmed with
        | none => Except.error usage
        | some (key, value) =>
          match addKey acc key value with
          | Except.error msg => Except.error msg
          | Except.ok next => go next rest
  go emptyAcc lines

def toRecord (acc : RecordAcc) : SlakeCheckLogCompare.CheckRecord :=
  { toolName := acc.toolName
    canonicalCommand := acc.canonicalCommand
    checkoutPath := acc.checkoutPath
    sha256 := acc.sha256
    exitCode := acc.exitCode
    logLines := acc.logLines }

structure FlagAcc where
  recordFile : Option String
  acc : RecordAcc

def parseFlags (args : List String) : Except String FlagAcc :=
  go { recordFile := none, acc := emptyAcc } args
where
  go (flag : FlagAcc) : List String → Except String FlagAcc
    | [] => Except.ok flag
    | "--" :: rest => go flag rest
    | "--record" :: path :: rest =>
      go { flag with recordFile := some path } rest
    | "--tool" :: value :: rest =>
      match addKey flag.acc "tool" value with
      | Except.ok acc => go { flag with acc } rest
      | Except.error msg => Except.error msg
    | "--command" :: value :: rest =>
      match addKey flag.acc "command" value with
      | Except.ok acc => go { flag with acc } rest
      | Except.error msg => Except.error msg
    | "--path" :: value :: rest =>
      match addKey flag.acc "path" value with
      | Except.ok acc => go { flag with acc } rest
      | Except.error msg => Except.error msg
    | "--sha256" :: value :: rest =>
      match addKey flag.acc "sha256" value with
      | Except.ok acc => go { flag with acc } rest
      | Except.error msg => Except.error msg
    | "--exit" :: value :: rest =>
      match addKey flag.acc "exit" value with
      | Except.ok acc => go { flag with acc } rest
      | Except.error msg => Except.error msg
    | "--log" :: value :: rest =>
      match addKey flag.acc "log" value with
      | Except.ok acc => go { flag with acc } rest
      | Except.error msg => Except.error msg
    | _ => Except.error usage

def report (record : SlakeCheckLogCompare.CheckRecord) : IO UInt32 := do
  if SlakeCheckLogCompare.checkRecordComplete record then
    IO.println "ACCEPTED"
    return 0
  else
    writeDefaultToolLog ToolLogLevel.warn "check-record rejected"
    IO.println "REJECTED"
    return 1

def hasWorkArg : List String → Bool
  | [] => false
  | "--" :: rest => hasWorkArg rest
  | _ :: _ => true

def main (args : List String) : IO UInt32 := do
  writeDefaultToolLog ToolLogLevel.log "check-record start"
  if !hasWorkArg args then
    writeDefaultToolLog ToolLogLevel.error "check-record usage"
    IO.eprintln usage
    return 2
  else
    match parseFlags args with
    | Except.error msg =>
      writeDefaultToolLog ToolLogLevel.error "check-record argument error"
      IO.eprintln msg
      return 2
    | Except.ok flag =>
      match flag.recordFile with
      | some path =>
        let text ← IO.FS.readFile path
        match parseLines (text.splitOn "\n") with
        | Except.error msg =>
          writeDefaultToolLog ToolLogLevel.error "check-record record parse error"
          IO.eprintln msg
          return 2
        | Except.ok acc =>
          report (toRecord acc)
      | none =>
        report (toRecord flag.acc)
