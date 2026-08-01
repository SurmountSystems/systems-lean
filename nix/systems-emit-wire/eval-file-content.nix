# SPDX-License-Identifier: Unlicense
# Generic file/content and optional content violations for systems-emit-wire.
# Cold eval only; hostPin family scanners stay in default.nix.
# No bash, no ripgrep, no Python.
{
  lib,
  exists,
  readRel,
  checkContent,
  requiredFiles,
  contentSpecs,
  optionalContentSpecs,
}:
{
  fileViolations = lib.concatMap (
    rel: if exists rel then [ ] else [ "missing file: ${rel}" ]
  ) requiredFiles;

  contentViolations = lib.concatMap (
    spec:
    let
      content = readRel spec.rel;
    in
    if content == null then
      [ ]
    else
      checkContent spec.rel content {
        all = spec.all or [ ];
        anyGroups = spec.anyGroups or [ ];
        allInsensitive = spec.allInsensitive or [ ];
        anyGroupsInsensitive = spec.anyGroupsInsensitive or [ ];
        none = spec.none or [ ];
        noneInsensitive = spec.noneInsensitive or [ ];
      }
  ) contentSpecs;

  # Optional release: missing is OK; present must satisfy tokens.
  optionalContentViolations = lib.concatMap (
    spec:
    let
      content = readRel spec.rel;
    in
    if content == null then
      [ ]
    else
      checkContent spec.rel content {
        all = spec.all or [ ];
        anyGroups = spec.anyGroups or [ ];
        allInsensitive = spec.allInsensitive or [ ];
        anyGroupsInsensitive = spec.anyGroupsInsensitive or [ ];
        none = spec.none or [ ];
        noneInsensitive = spec.noneInsensitive or [ ];
      }
  ) optionalContentSpecs;
}
