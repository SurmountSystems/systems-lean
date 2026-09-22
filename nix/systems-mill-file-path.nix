# SPDX-License-Identifier: Unlicense
# Pure Nix mill file(1) helper-path fence: mill 67, mill 68, and mill 69
# keep FILE= PATH= and the mill-known Nix store file-5.48 path on the same
# just line as the helper (mill 67 PATH miss). Helper fallback in
# first-host-tool.just must name the same path.
# Presence only. Does not mill. Does not rewrite just N-host-tool compile.
# Does not require the store path to exist on this host. Does not read dest ELFs.
# Living mill fence is 69 of 69. Occupancy stays 49. FullHost stays false.
# Does not claim Lake-gone. Does not fold into systems-host-presence.
# Sibling of systems-mill-packed-extras (extras lists), not a clone.
#
#   import ./systems-mill-file-path.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary }
{ lib, root }:
let
  laterRel = "just/later-host-tools.just";
  helperRel = "just/first-host-tool.just";
  millFile = "/nix/store/36cxvi2s369aw85pp7fyzq2dqv459d7c-file-5.48/bin/file";
  mill67Marker = "_compile-inventory-exe slake-host-module-check";
  mill68Marker = "_compile-inventory-exe slake-mult-fs-write";
  mill69Marker = "_compile-inventory-exe slake-freestanding-self-host-complete";

  exists = rel: builtins.pathExists (root + "/${rel}");
  has = import ./string-contains.nix;

  laterContent =
    if exists laterRel then builtins.readFile (root + "/${laterRel}") else null;
  helperContent =
    if exists helperRel then builtins.readFile (root + "/${helperRel}") else null;

  firstHit =
    marker: content:
    let
      hits = lib.filter (line: has marker line) (lib.splitString "\n" content);
    in
    if hits == [ ] then null else builtins.head hits;

  mill67Line =
    if laterContent == null then null else firstHit mill67Marker laterContent;
  mill68Line =
    if laterContent == null then null else firstHit mill68Marker laterContent;
  mill69Line =
    if laterContent == null then null else firstHit mill69Marker laterContent;

  lineHasFile =
    line:
    line != null && has "FILE=" line && has millFile line && has "PATH=" line;

  missingLater =
    if laterContent == null then [ "missing file: ${laterRel}" ] else [ ];
  missingHelper =
    if helperContent == null then [ "missing file: ${helperRel}" ] else [ ];

  mill67LineViolations =
    if laterContent == null then
      [ ]
    else if mill67Line == null then
      [ "${laterRel}: missing helper line ${mill67Marker}" ]
    else if lineHasFile mill67Line then
      [ ]
    else
      [ "${laterRel}: mill 67 helper line must keep FILE= PATH= and mill-known file(1) on the same just line" ];

  mill68LineViolations =
    if laterContent == null then
      [ ]
    else if mill68Line == null then
      [ "${laterRel}: missing helper line ${mill68Marker}" ]
    else if lineHasFile mill68Line then
      [ ]
    else
      [ "${laterRel}: mill 68 helper line must keep FILE= PATH= and mill-known file(1) on the same just line" ];

  mill69LineViolations =
    if laterContent == null then
      [ ]
    else if mill69Line == null then
      [ "${laterRel}: missing helper line ${mill69Marker}" ]
    else if lineHasFile mill69Line then
      [ ]
    else
      [ "${laterRel}: mill 69 helper line must keep FILE= PATH= and mill-known file(1) on the same just line" ];

  helperFallbackViolations =
    if helperContent == null then
      [ ]
    else if has millFile helperContent then
      [ ]
    else
      [ "${helperRel}: helper missing mill-known file(1) fallback ${millFile}" ];

  laterTokens = [
    "FILE on the same just line"
    "Mill 67 fire missed"
    millFile
  ];

  helperTokens = [
    "Honor FILE="
    millFile
  ];

  tokenMiss =
    rel: content: tokens:
    if content == null then
      [ ]
    else
      lib.concatMap (
        t: if has t content then [ ] else [ "${rel}: missing token ${t}" ]
      ) tokens;

  violations =
    missingLater
    ++ missingHelper
    ++ mill67LineViolations
    ++ mill68LineViolations
    ++ mill69LineViolations
    ++ helperFallbackViolations
    ++ tokenMiss laterRel laterContent laterTokens
    ++ tokenMiss helperRel helperContent helperTokens;

  ok = violations == [ ];
  summary =
    if ok then
      "systems-mill-file-path OK (mill 67/68/69 FILE PATH on helper just line; mill 69 of 69; not remill; occupancy 49)"
    else
      "systems-mill-file-path FAILED:\n" + lib.concatStringsSep "\n" violations;
in
{
  inherit
    ok
    violations
    summary
    laterRel
    helperRel
    millFile
    ;
}
