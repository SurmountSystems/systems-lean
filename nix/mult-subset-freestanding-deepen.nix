# SPDX-License-Identifier: Unlicense
# mult-subset-freestanding-deepen. Seven text files must exist. Fixed
# tokens must appear in the Mult deepen module, the Mult subset package,
# the freestanding product header and source, and the Mult host emit
# SSOT. Four Bool defs must be true. Does not call lake. Does not run a
# binary. Does not invoke another recipe. Fixed strings via
# nix/string-contains.nix. No whole-file regex.
#   import ./mult-subset-freestanding-deepen.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  has = import ./string-contains.nix;
  absent = rel: kind: [ "${rel}: ${kind}" ];
  load = rel:
    let
      path = root + "/${rel}";
      exists = builtins.pathExists path;
    in
    {
      inherit rel exists;
      content = if exists then builtins.readFile path else "";
    };
  mod = load "src/systems/SystemsLean/MultFsDeepen.lean";
  outH = load "src/systems/emit/slake_mult_subset.h";
  outC = load "src/systems/emit/slake_mult_subset.c";
  fsH = load "src/systems/emit/slake_freestanding.h";
  fsC = load "src/systems/emit/slake_freestanding.c";
  ssot = load "src/systems/emit/host_emit_mult.ssot.txt";
  rebuild = load "src/systems/SystemsLean/MultSubsetRebuild.lean";
  files = [ mod outH outC fsH fsC ssot rebuild ];
  allExist = lib.all (f: f.exists) files;
  boolIs = name: value: content:
    let
      tails = lib.tail (lib.splitString "def ${name}" content);
      hit = tail:
        let
          window = builtins.substring 0 64 tail;
          compact = builtins.replaceStrings [ " " "\t" "\n" "\r" ] [ "" "" "" "" ] window;
        in
        lib.hasPrefix ":Bool:=${value}" compact;
    in
    tails != [ ] && lib.any hit tails;
  rows = file: toks: map (tok: { inherit file tok; }) toks;
  tokenRows =
    (rows mod [
      "freestandingDeepenPartial"
      "freestandingDriverComplete"
      "multFsDeepenReady"
      "mult-subset-freestanding-deepen"
      "multFsDeepenKeepsHostLake"
      "multFsDeepenNotPrebuiltOnly"
      "SLAKE_MULT_FS_DEEPEN_V0"
    ])
    ++ (rows outH [
      "MULT-0"
      "HOST-EMIT-MULT"
      "enum slake_mult"
      "MULT-SUBSET-EMIT"
      "SLAKE_MULT_SUBSET_EMIT_V0"
      "SLAKE_FIRST_SURFACE_MULT"
    ])
    ++ (rows fsH [
      "MULT-0"
      "HOST-EMIT-MULT"
      "enum slake_mult"
    ])
    ++ (rows outC [
      "MULT-0"
      "HOST-EMIT-MULT"
      "slake_mult_is_valid"
      "MULT-SUBSET-EMIT"
      "SLAKE_MULT_SUBSET_EMIT_V0"
      "SLAKE_FIRST_SURFACE_MULT"
    ])
    ++ (rows fsC [
      "MULT-0"
      "HOST-EMIT-MULT"
      "slake_mult_is_valid"
    ])
    ++ (rows ssot [
      "MULT-0"
      "slake_mult_is_valid"
    ]);
  pin = file: name: value: { inherit file name value; };
  bools = [
    (pin mod "freestandingDeepenPartial" "true")
    (pin mod "stillUsesLake" "true")
    (pin mod "dependsOnLake" "true")
    (pin rebuild "multSubsetRebuildWithoutLakeFinishedClaimed" "true")
  ];
  tokenViolations =
    if !allExist then [ ]
    else lib.concatMap (row:
      if has row.tok row.file.content then [ ]
      else absent row.file.rel "missing token ${row.tok}"
    ) tokenRows;
  boolViolations =
    if !allExist then [ ]
    else lib.concatMap (p:
      if boolIs p.name p.value p.file.content then [ ]
      else absent p.file.rel "def ${p.name} is not Bool := ${p.value}"
    ) bools;
  missing =
    lib.concatMap (f: if f.exists then [ ] else absent f.rel "missing file") files;
  passedToken =
    if allExist then lib.filter (row: has row.tok row.file.content) tokenRows else [ ];
  passedBool =
    if allExist then lib.filter (p: boolIs p.name p.value p.file.content) bools else [ ];
  checked = builtins.length passedToken + builtins.length passedBool;
  expect = builtins.length tokenRows + builtins.length bools;
  violations = missing ++ tokenViolations ++ boolViolations;
  ok = violations == [ ] && checked == expect;
  summary =
    if ok then
      "mult-subset-freestanding-deepen: check passed; count is ${toString expect}"
    else
      "mult-subset-freestanding-deepen: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
