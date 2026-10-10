# SPDX-License-Identifier: Unlicense
# lake-retire-inventory. Three Lean modules must exist. Inventory tokens
# are fixed strings in LakeRetireInventory.lean. Named Bool defs must
# match the recipe pin (whitespace ignored in a short window). Forge bans
# reject the opposite Bool. Eight recipe names must be line-start names
# in justfile or just/*.just. Does not call lake. Does not run a binary.
# Does not invoke another recipe. Fixed strings via nix/string-contains.nix.
# No whole-file regex.
#   import ./lake-retire-inventory.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  leanRel = "src/systems/SystemsLean";
  has = import ./string-contains.nix;
  absent = rel: kind: [ "${rel}: ${kind}" ];
  load = base:
    let
      rel = "${leanRel}/${base}";
      path = root + "/${rel}";
      exists = builtins.pathExists path;
    in
    {
      inherit rel exists;
      content = if exists then builtins.readFile path else "";
    };
  inv = load "LakeRetireInventory.lean";
  self = load "SelfHostComplete.lean";
  dual = load "DualResidual.lean";
  allExist = inv.exists && self.exists && dual.exists;
  tokens = [
    "lakeRetireInventoryReady"
    "lakeRetireInventoryFinishedClaimed"
    "productPathMeasuredStepsLakeFreeEvidence"
    "lakeRetireProductPathLakeRetired"
    "lakeRetireKeepsProductStillUsesLake"
    "justRecipeLakeRetireInventory"
    "lake-retire-inventory"
    "lakeRetireHostElaborateRemains"
    "lakeRetireBootstrapPrebuildRemains"
    "lakeRetireDiagnosticLakeRecipesRemain"
    "measuredLakeFreeJustBuild"
    "measuredLakeFreeProductWireWrite"
    "measuredLakeFreeCapableRegenerate"
    "measuredLakeFreeMultRebuild"
    "measuredLakeFreeMultWrite"
    "measuredLakeFreeMultDeepen"
    "measuredLakeFreeSubsetPackageJoin"
    "stillUsesLake"
    "dependsOnLake"
    "LAKE-RETIRE-INVENTORY"
    "SLAKE_LAKE_RETIRE_INVENTORY_V0"
    "HOST-LAKE-RETIRE-INVENTORY"
  ];
  boolIs = name: value: content:
    let
      parts = lib.splitString "def ${name}" content;
      rest = if builtins.length parts < 2 then "" else builtins.elemAt parts 1;
      window = builtins.substring 0 64 rest;
      compact = builtins.replaceStrings [ " " "\t" "\n" "\r" ] [ "" "" "" "" ] window;
    in
    lib.hasPrefix ":Bool:=${value}" compact;
  pin = file: name: value: { inherit file name value; };
  bools = [
    (pin inv "lakeRetireInventoryFinishedClaimed" "true")
    (pin inv "stillUsesLake" "false")
    (pin inv "dependsOnLake" "false")
    (pin inv "lakeRetireHostElaborateRemains" "true")
    (pin self "productPathOfficialPathStillUsesLake" "false")
    (pin self "productPathPerformDependsOnLake" "false")
    (pin dual "hostElaboratorResidualRemains" "false")
    (pin dual "hostElaboratorResidualFreeClaimed" "true")
    (pin dual "residualFreeClaimed" "true")
  ];
  bans = [
    (pin inv "stillUsesLake" "true")
    (pin inv "dependsOnLake" "true")
    (pin self "productPathOfficialPathStillUsesLake" "true")
    (pin dual "hostElaboratorResidualRemains" "true")
    (pin dual "hostElaboratorResidualFreeClaimed" "false")
  ];
  recipes = [
    "product-wire-freestanding-write"
    "freestanding-capable-regenerate-without-lake"
    "mult-subset-rebuild-without-lake"
    "mult-subset-freestanding-write"
    "mult-subset-freestanding-deepen"
    "subset-packages-rebuild-join-without-lake"
    "lake-retire-inventory"
    "build"
  ];
  justDir = root + "/just";
  justEnts = if builtins.pathExists justDir then builtins.readDir justDir else { };
  justNames = lib.filter (n: justEnts.${n} == "regular") (builtins.attrNames justEnts);
  justPaths = [ (root + "/justfile") ] ++ map (n: justDir + "/${n}") justNames;
  justTexts = map (p: if builtins.pathExists p then builtins.readFile p else "") justPaths;
  recipePresent = name:
    lib.any (text:
      lib.any (line: lib.hasPrefix "${name}:" line) (lib.splitString "\n" text)
    ) justTexts;
  tokenViolations =
    if !allExist then [ ]
    else lib.concatMap (tok:
      if has tok inv.content then [ ] else absent inv.rel "missing token ${tok}"
    ) tokens;
  boolViolations =
    if !allExist then [ ]
    else lib.concatMap (p:
      if boolIs p.name p.value p.file.content then [ ]
      else absent p.file.rel "def ${p.name} is not Bool := ${p.value}"
    ) bools;
  banViolations =
    if !allExist then [ ]
    else lib.concatMap (p:
      if boolIs p.name p.value p.file.content then
        absent p.file.rel "forge ban def ${p.name} Bool := ${p.value}"
      else [ ]
    ) bans;
  recipeViolations =
    if !allExist then [ ]
    else lib.concatMap (name:
      if recipePresent name then [ ] else [ "just ${name}: missing recipe name" ]
    ) recipes;
  missing =
    lib.concatMap (f: if f.exists then [ ] else absent f.rel "missing file") [ inv self dual ];
  passedToken = if allExist then lib.filter (tok: has tok inv.content) tokens else [ ];
  passedBool = if allExist then lib.filter (p: boolIs p.name p.value p.file.content) bools else [ ];
  passedRecipe = if allExist then lib.filter recipePresent recipes else [ ];
  checked = builtins.length passedToken + builtins.length passedBool + builtins.length passedRecipe;
  expect = builtins.length tokens + builtins.length bools + builtins.length recipes;
  violations = missing ++ tokenViolations ++ boolViolations ++ banViolations ++ recipeViolations;
  ok = violations == [ ] && checked == expect;
  summary =
    if ok then "lake-retire-inventory: check passed; count is ${toString expect}"
    else "lake-retire-inventory: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
