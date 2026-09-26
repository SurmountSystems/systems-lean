/-
  Local tokenizer for live HostModuleCheckPackageEnv.lean.
  tokenizeHostTerm calls takeStringN with liveHostTermParseFuel 256.
  On none it drops the quote and the String def is not kept.
  Product string literals are longer than 256 characters and one command
  each. This file calls takeStringN with fuel 1024, then
  parseCmdsLlvmComposeTextMain. It does not edit the shared tokenizer.
  kernelFuel stays 64. Not FullHost. Occupancy stays 49.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvParse
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvParse

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- String literal fuel. Product strings are one command, not 256 commands. -/
def packageEnvStringFuel : Nat := 1024

/-- Same walk as tokenizeHostTermN, with takeStringN fuel 1024. -/
def tokenizePackageEnvN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizePackageEnvN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveHostTermParseFuel [c] rest
      tokenizePackageEnvN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN packageEnvStringFuel [c] rest with
      | none => tokenizePackageEnvN n rest acc
      | some (rev, rest2) =>
        tokenizePackageEnvN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizePackageEnvN n rest2 (":=" :: acc)
      | _ => tokenizePackageEnvN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizePackageEnvN n rest2 ("=>" :: acc)
      | '=' :: rest2 => tokenizePackageEnvN n rest2 ("==" :: acc)
      | _ => tokenizePackageEnvN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizePackageEnvN n rest2 ("->" :: acc)
      | _ => tokenizePackageEnvN n rest ("-" :: acc)
    else if c == '&' then
      match rest with
      | '&' :: rest2 => tokenizePackageEnvN n rest2 ("&&" :: acc)
      | _ => tokenizePackageEnvN n rest acc
    else if c == '!' then
      tokenizePackageEnvN n rest ("!" :: acc)
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' || c == '[' || c == ']' then
      tokenizePackageEnvN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveHostTermParseFuel [c] rest
      tokenizePackageEnvN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizePackageEnvN n rest acc

/-- Tokenize after the string-safe comment strip. -/
def tokenizePackageEnv (src : String) : List String :=
  tokenizePackageEnvN (src.length + 8) src.toList []

/-- Accepted commands from the local tokenizer.
    Greppable: parseLiveHostModuleCheckPackageEnvSource. -/
def parseLiveHostModuleCheckPackageEnvSource (src : String) : FrontResult :=
  let toks := tokenizePackageEnv (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmComposeTextMain liveLlvmComposeTextMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmComposeTextMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvParse
