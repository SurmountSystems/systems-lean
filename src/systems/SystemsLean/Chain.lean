/-
  Module: SystemsLean.Chain
  Tries each shape reader. The first module wins.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.TopScan
import SystemsLean.LiveSource
import SystemsLean.StringAlias
import SystemsLean.LiveParser
import SystemsLean.EmbeddedMain
import SystemsLean.PinnedChecker
import SystemsLean.IrWriter
import SystemsLean.ClaimBundle
import SystemsLean.TheoremSurface
import SystemsLean.StructSurface
import SystemsLean.CfgTable
import SystemsLean.ProductSurface
import SystemsLean.PackageEnv
import SystemsLean.PathProject
import SystemsLean.PackageWriter
import SystemsLean.WalkJoin
import SystemsLean.Walker

namespace SystemsLean.Chain

open SystemsLean.HostTerm
open SystemsLean.TopScan
open SystemsLean.LiveSource
open SystemsLean.StringAlias
open SystemsLean.LiveParser
open SystemsLean.EmbeddedMain
open SystemsLean.PinnedChecker
open SystemsLean.IrWriter
open SystemsLean.ClaimBundle
open SystemsLean.TheoremSurface
open SystemsLean.StructSurface
open SystemsLean.CfgTable
open SystemsLean.ProductSurface
open SystemsLean.PackageEnv
open SystemsLean.PathProject
open SystemsLean.PackageWriter
open SystemsLean.WalkJoin
open SystemsLean.Walker

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

def parseChain (src : String) : Option Module :=
  go readers src
where
  go : List (String -> Option Module) -> String -> Option Module
    | [], _ => none
    | f :: rest, s =>
      match f s with
      | some m => some m
      | none => go rest s

end SystemsLean.Chain
