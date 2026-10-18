# SPDX-License-Identifier: Unlicense
# Pure Nix: fail closed when nix/slake-bootstrap.nix closureMods omits a
# SystemsLean module the bootstrap ELF must include. Required names must
# appear before HostFront or the store filter drops them. No bash-in-Nix.
# Does not rewrite slake-bootstrap.nix. Does not start the derivation.
#
#   import ./slake-bootstrap-closure { inherit lib; root = repoRoot; }
#   -> { ok, violations, summary }
{ lib, root }:
let
  specs = import ./specs.nix;
  inherit (specs)
    bootstrapRel
    compiledListOpen
    compiledListClose
    orderAnchor
    requiredNames
    ;

  bootstrapText =
    if builtins.pathExists (root + "/${bootstrapRel}") then
      builtins.readFile (root + "/${bootstrapRel}")
    else
      null;

  afterOpen =
    if bootstrapText == null then
      null
    else
      let
        parts = lib.splitString compiledListOpen bootstrapText;
      in
      if builtins.length parts < 2 then null else lib.concatStringsSep compiledListOpen (lib.drop 1 parts);

  listBody =
    if afterOpen == null then
      null
    else
      builtins.head (lib.splitString compiledListClose afterOpen);

  isModName = s: builtins.match "[A-Za-z][A-Za-z0-9]*" s != null;

  quotedNames =
    body:
    let
      odds = lib.filter (p: lib.mod p.i 2 == 1) (
        lib.imap0 (i: s: { inherit i s; }) (lib.splitString "\"" body)
      );
    in
    lib.filter isModName (map (p: p.s) odds);

  compiledNames = if listBody == null then [ ] else quotedNames listBody;

  omittedFrom = compiled: required: lib.filter (n: !(lib.elem n compiled)) required;

  indexOf =
    name: xs:
    let
      hits = lib.filter (p: p.v == name) (lib.imap0 (i: v: { inherit i v; }) xs);
    in
    if hits == [ ] then null else (builtins.head hits).i;

  notBeforeAnchor =
    compiled: required: anchor:
    let
      ai = indexOf anchor compiled;
    in
    if ai == null then
      [ ]
    else
      lib.filter (n: lib.elem n compiled && (indexOf n compiled) >= ai) required;

  omitMsgs = map (n: "${bootstrapRel}: compiled-name list omits ${n}") (
    omittedFrom compiledNames requiredNames
  );

  orderMsgs =
    if compiledNames != [ ] && indexOf orderAnchor compiledNames == null then
      [ "${bootstrapRel}: compiled-name list omits order anchor ${orderAnchor}" ]
    else
      map (n: "${bootstrapRel}: ${n} must appear before ${orderAnchor}") (
        notBeforeAnchor compiledNames requiredNames orderAnchor
      );

  parseMsgs =
    if bootstrapText == null then
      [ "missing file: ${bootstrapRel}" ]
    else if listBody == null then
      [ "${bootstrapRel}: missing compiled-name list ${compiledListOpen}" ]
    else if compiledNames == [ ] then
      [ "${bootstrapRel}: compiled-name list parsed zero module names" ]
    else
      [ ];

  # Toy lists prove fail-closed without rewriting slake-bootstrap.nix.
  selfOmit = omittedFrom [ "Mult" orderAnchor ] requiredNames;
  selfOrder = notBeforeAnchor ([ "Mult" orderAnchor ] ++ requiredNames) requiredNames orderAnchor;
  selfMsgs =
    (if selfOmit == requiredNames then [ ] else [ "self-check: omittedFrom must report all required names" ])
    ++ (
      if selfOrder == requiredNames then [ ] else [ "self-check: notBeforeAnchor must report names after ${orderAnchor}" ]
    );

  violations = parseMsgs ++ omitMsgs ++ orderMsgs ++ selfMsgs;
  ok = violations == [ ];
  summary =
    if ok then
      "slake-bootstrap-closure OK (required=${toString (builtins.length requiredNames)} before ${orderAnchor}; compiled=${toString (builtins.length compiledNames)})"
    else
      "slake-bootstrap-closure FAILED:\n" + lib.concatStringsSep "\n" violations;
in
{
  inherit
    ok
    violations
    summary
    requiredNames
    compiledNames
    ;
}
