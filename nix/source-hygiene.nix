# SPDX-License-Identifier: Unlicense
# Pure Nix source hygiene: printable ASCII (tab/LF/CR + 0x20-0x7E) outside
# allowlist; no trailing whitespace on any novel text path; no stitch/merge
# conflict marker lines in product sources (agent cut marks and git markers).
#
#   import ./source-hygiene.nix { inherit lib; root = novelSource; }
#   -> { ok, violations, summary }
#
# No bash, no ripgrep, no Python. Flake checks force-eval this module.
# Stitch/merge RCA: doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md
{ lib, root }:
let
  # Unicode allowed here; trailing whitespace still forbidden.
  allowlist = {
    "README.md" = true;
    "doc/vocabulary.md" = true;
    "doc/ascii-symbol-map.md" = true;
  };

  skipDir =
    name:
    name == ".git"
    || name == "ref"
    || name == "skills"
    || name == ".cache"
    || name == ".lake"
    || name == "__pycache__"
    # Compiler local output (Idris dual elaborator under examples/build; Lake uses .lake).
    || name == "build"
    # Host ELF dest (Nix readFile cannot load binaries as strings).
    || name == "slake-produced-elf"
    || name == "slake-host-tool-elf"
    || lib.hasPrefix "result" name;

  skipFile =
    name:
    lib.hasSuffix ".pyc" name
    || lib.hasSuffix ".ttc" name
    || name == "flake.lock";

  # tab, LF, CR, space..tilde
  printable =
    " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
  allowed = lib.listToAttrs (
    map (c: {
      name = c;
      value = true;
    }) (lib.stringToCharacters ("\t\n\r" + printable))
  );

  isAllowedChar = c: builtins.hasAttr c allowed;

  # Leading whitespace only (spaces/tabs). Pure; no lib.trim dependency.
  stripLeadingWs =
    s:
    if s == "" then
      s
    else if lib.hasPrefix " " s || lib.hasPrefix "\t" s then
      stripLeadingWs (builtins.substring 1 (builtins.stringLength s - 1) s)
    else
      s;

  # Agent cut marks (==== section ===) and git merge conflict markers.
  # Stitch ban applies to *.lean (product Lean). Merge markers banned on all novel text.
  isMergeConflictMarker =
    t: lib.hasPrefix "<<<<<<<" t || lib.hasPrefix ">>>>>>>" t || t == "=======";

  isStitchMarker = t: lib.hasPrefix "====" t;

  collectFiles =
    dir: rel:
    let
      entries = builtins.readDir dir;
    in
    lib.concatMap (
      name:
      let
        typ = entries.${name};
        childRel = if rel == "" then name else "${rel}/${name}";
        childPath = dir + "/${name}";
      in
      if typ == "directory" then
        if skipDir name then [ ] else collectFiles childPath childRel
      else if typ == "regular" then
        if skipFile name then [ ] else [ { path = childPath; rel = childRel; } ]
      else
        [ ]
    ) (builtins.attrNames entries);

  files = collectFiles root "";

  checkFile =
    { path, rel }:
    let
      content = builtins.readFile path;
      allowUnicode = builtins.hasAttr rel allowlist;
      badChars =
        if allowUnicode then
          [ ]
        else
          lib.filter (c: !(isAllowedChar c)) (lib.stringToCharacters content);
      lines = lib.splitString "\n" content;
      trailing = lib.filter (l: lib.hasSuffix " " l || lib.hasSuffix "\t" l) lines;
      isLean = lib.hasSuffix ".lean" rel;
      markerHits = lib.filter (
        l:
        let
          t = stripLeadingWs l;
        in
        isMergeConflictMarker t || (isLean && isStitchMarker t)
      ) lines;
      msgs =
        (if badChars == [ ] then [ ] else [ "${rel}: non-ASCII outside allowlist" ])
        ++ (
          if trailing == [ ] then
            [ ]
          else
            [ "${rel}: trailing whitespace (${toString (builtins.length trailing)} line(s))" ]
        )
        ++ (
          if markerHits == [ ] then
            [ ]
          else
            [
              "${rel}: stitch/merge marker line (forbidden in product sources; ${toString (builtins.length markerHits)} line(s))"
            ]
        );
    in
    msgs;

  violations = lib.concatMap checkFile files;
  ok = violations == [ ];
  maxShow = 40;
  shown = lib.take maxShow violations;
  more =
    let
      n = builtins.length violations;
    in
    if n > maxShow then "\n... and ${toString (n - maxShow)} more" else "";
  summary =
    if ok then
      "source-hygiene OK (${toString (builtins.length files)} files; ASCII except allowlist; no trailing whitespace; no stitch/merge markers)"
    else
      "source-hygiene FAILED:\n" + lib.concatStringsSep "\n" shown + more;
in
{
  inherit ok violations summary files;
}
