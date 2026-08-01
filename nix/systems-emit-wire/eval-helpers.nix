# SPDX-License-Identifier: Unlicense
# Cold eval helpers for systems-emit-wire pure gate.
# Shared path/read/token checks used by generic violations, unit walk,
# emit/out match, and hostPin family scanners in default.nix.
# No bash, no ripgrep, no Python.
{ lib, root }:
rec {
  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel =
    rel:
    if exists rel then
      builtins.readFile (root + "/${rel}")
    else
      null;

  has = needle: hay: lib.hasInfix needle hay;
  hasI = needle: hay: lib.hasInfix (lib.toLower needle) (lib.toLower hay);

  # all / anyGroups (case-sensitive) + insensitive variants + none (forbidden).
  checkContent =
    rel: content:
    {
      all ? [ ],
      anyGroups ? [ ],
      allInsensitive ? [ ],
      anyGroupsInsensitive ? [ ],
      none ? [ ],
      noneInsensitive ? [ ],
    }:
    (lib.concatMap (
      t: if has t content then [ ] else [ "${rel}: missing token ${t}" ]
    ) all)
    ++ (lib.concatMap (
      t: if hasI t content then [ ] else [ "${rel}: missing token (ci) ${t}" ]
    ) allInsensitive)
    ++ (lib.concatMap (
      group:
      if lib.any (t: has t content) group then
        [ ]
      else
        [ "${rel}: missing any of [${lib.concatStringsSep " | " group}]" ]
    ) anyGroups)
    ++ (lib.concatMap (
      group:
      if lib.any (t: hasI t content) group then
        [ ]
      else
        [ "${rel}: missing any of (ci) [${lib.concatStringsSep " | " group}]" ]
    ) anyGroupsInsensitive)
    ++ (lib.concatMap (
      t: if has t content then [ "${rel}: forbidden token ${t}" ] else [ ]
    ) none)
    ++ (lib.concatMap (
      t: if hasI t content then [ "${rel}: forbidden token (ci) ${t}" ] else [ ]
    ) noneInsensitive);
}
