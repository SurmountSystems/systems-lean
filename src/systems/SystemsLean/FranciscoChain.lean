/-
  Module: SystemsLean.FranciscoChain
  Tries each Francisco shape reader. The first module wins.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan
import SystemsLean.FranciscoLiveSource
import SystemsLean.FranciscoStringAlias
import SystemsLean.FranciscoLiveParser
import SystemsLean.FranciscoEmbeddedMain
import SystemsLean.FranciscoPinnedChecker
import SystemsLean.FranciscoIrWriter
import SystemsLean.FranciscoClaimBundle
import SystemsLean.FranciscoTheoremSurface
import SystemsLean.FranciscoStructSurface
import SystemsLean.FranciscoCfgTable
import SystemsLean.FranciscoProductSurface
import SystemsLean.FranciscoPackageEnv
import SystemsLean.FranciscoPathProject
import SystemsLean.FranciscoPackageWriter
import SystemsLean.FranciscoWalkJoin
import SystemsLean.FranciscoUseCheck

namespace SystemsLean.FranciscoChain

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan
open SystemsLean.FranciscoLiveSource
open SystemsLean.FranciscoStringAlias
open SystemsLean.FranciscoLiveParser
open SystemsLean.FranciscoEmbeddedMain
open SystemsLean.FranciscoPinnedChecker
open SystemsLean.FranciscoIrWriter
open SystemsLean.FranciscoClaimBundle
open SystemsLean.FranciscoTheoremSurface
open SystemsLean.FranciscoStructSurface
open SystemsLean.FranciscoCfgTable
open SystemsLean.FranciscoProductSurface
open SystemsLean.FranciscoPackageEnv
open SystemsLean.FranciscoPathProject
open SystemsLean.FranciscoPackageWriter
open SystemsLean.FranciscoWalkJoin
open SystemsLean.FranciscoUseCheck

def readers : List (String -> Option Module) :=
  [ parseTypecheckDriver
  , parseLiveSource
  , parseStringAlias
  , parsePackageEnv
  , parsePathProject
  , parsePackageWriter
  , parseWalkJoin
  , parseUseCheck
  , parseCfgTable
  , parseEmbeddedMain
  , parseLiveParser
  , parsePinnedChecker
  , parseIrWriter
  , parseClaimBundle
  , parseTheoremSurface
  , parseStructSurface
  , parseProductSurface
  ]

def parseFrancisco (src : String) : Option Module :=
  go readers src
where
  go : List (String -> Option Module) -> String -> Option Module
    | [], _ => none
    | f :: rest, s =>
      match f s with
      | some m => some m
      | none => go rest s

end SystemsLean.FranciscoChain
