/-
SPDX-License-Identifier: Unlicense

Tool log levels for a caller-supplied handle.
A message is emitted only when its rank is at least the threshold rank.
The default threshold is log, so trace and debug stay off.
-/

inductive ToolLogLevel where
  | trace
  | debug
  | log
  | warn
  | error
  deriving DecidableEq, Repr

def toolLogRank : ToolLogLevel → Nat
  | ToolLogLevel.trace => 0
  | ToolLogLevel.debug => 1
  | ToolLogLevel.log => 2
  | ToolLogLevel.warn => 3
  | ToolLogLevel.error => 4

def defaultToolLogThreshold : ToolLogLevel := ToolLogLevel.log

def toolLogEnabled (threshold messageLevel : ToolLogLevel) : Bool :=
  decide (toolLogRank messageLevel ≥ toolLogRank threshold)

def toolLogLevelName : ToolLogLevel → String
  | ToolLogLevel.trace => "trace"
  | ToolLogLevel.debug => "debug"
  | ToolLogLevel.log => "log"
  | ToolLogLevel.warn => "warn"
  | ToolLogLevel.error => "error"

def toolLogLine (timestamp : String) (level : ToolLogLevel) (message : String) : String :=
  timestamp ++ " " ++ toolLogLevelName level ++ " " ++ message ++ "\n"

def parseToolLogLevel (word : String) : Option ToolLogLevel :=
  match word with
  | "trace" => some ToolLogLevel.trace
  | "debug" => some ToolLogLevel.debug
  | "log" => some ToolLogLevel.log
  | "info" => some ToolLogLevel.log
  | "warn" => some ToolLogLevel.warn
  | "error" => some ToolLogLevel.error
  | _ => none

def toolLogWrite (handle : IO.FS.Handle) (threshold level : ToolLogLevel)
    (timestamp message : String) : IO Unit := do
  if toolLogEnabled threshold level then
    IO.FS.Handle.write handle (toolLogLine timestamp level message).toUTF8
    IO.FS.Handle.flush handle
  else
    pure ()

#guard toolLogEnabled ToolLogLevel.log ToolLogLevel.trace = false
#guard toolLogEnabled ToolLogLevel.log ToolLogLevel.debug = false
#guard toolLogEnabled ToolLogLevel.log ToolLogLevel.log = true
#guard toolLogEnabled ToolLogLevel.log ToolLogLevel.warn = true
#guard toolLogEnabled ToolLogLevel.log ToolLogLevel.error = true
#guard toolLogEnabled ToolLogLevel.error ToolLogLevel.warn = false
#guard toolLogEnabled ToolLogLevel.trace ToolLogLevel.trace = true
#guard parseToolLogLevel "info" = some ToolLogLevel.log
#guard parseToolLogLevel "nope" = none
#guard defaultToolLogThreshold = ToolLogLevel.log
#guard toolLogRank ToolLogLevel.trace = 0
#guard toolLogRank ToolLogLevel.debug = 1
#guard toolLogRank ToolLogLevel.log = 2
#guard toolLogRank ToolLogLevel.warn = 3
#guard toolLogRank ToolLogLevel.error = 4
#guard toolLogLine "2026-10-26T00:00:00Z" ToolLogLevel.warn "disk full" =
  "2026-10-26T00:00:00Z warn disk full\n"
