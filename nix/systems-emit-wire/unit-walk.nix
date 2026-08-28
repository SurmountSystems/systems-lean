# SPDX-License-Identifier: Unlicense
# Data only: dynamic freestanding unit walk under src/systems.
# Imported by ./specs.nix. Every *.lean / *.slake needs SKELETON or UNIT_SURFACE.
{
  unitWalkRoot = "src/systems";
  # Package-local Lake / VCS / cache (novel-source only filters repo-root .lake/).
  unitWalkSkipDirs = [
    ".lake"
    ".git"
    ".cache"
  ];
  unitWalkExtensions = [
    ".lean"
    ".slake"
  ];
  unitSurfaceRequiredAny = [
    "MULT-0"
    "MULT-1"
    "MULT-OMEGA"
    "JOIN-ALG"
    "ConsumeToken"
    "EDGE-PROP"
    "ERASE-PROP"
    "RUNTIME-FS"
    "EDGE-RUNTIME"
    "linear resource"
    "erasure rule"
    "extract boundary"
  ];
  # UNIT_SURFACE files must say they are not the freestanding product emit
  # wire. Product emit modules use "Not freestanding emit". Host elaborator
  # meet modules (ElabMeet family) already say "(not freestanding C)" in the
  # header. Either phrase satisfies the walk. Do not require the emit phrase
  # on every probe; that would farm 200+ headers for one substring.
  unitSurfaceNotEmitAny = [
    "Not freestanding emit"
    "not freestanding C"
  ];
  unitSurfaceModuleAny = [
    "module "
    "namespace "
  ];
}
