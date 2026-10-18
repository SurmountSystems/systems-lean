# SPDX-License-Identifier: Unlicense
# Pure Nix: fail closed when SlakeCheckSource.lean lacks a live
# (non-comment) match SystemsLean.HostKernel.kernelFailAt on rejectLayer.
# Comments-only // and block forms do not count. Occupancy 49.
# FullHost false. slakeOwnsPackageTypecheck stays false. Do not mill.
# Remote ELF proof is out of this gate. Dual clocks stay unadded.
# Not wired into flake.nix this slice (HITL).
#
#   import ./slake-kernel-fail-at { inherit lib; root = repoRoot; }
#   -> { ok, violations, summary, hasLiveCall }
#
# Live impure eval (flake checks see only git-tracked paths):
#   nix eval --impure --raw --expr 'let lib = (import (builtins.getFlake "nixpkgs") {}).lib;
#     root = ./.; g = import ./nix/slake-kernel-fail-at { inherit lib root; };
#     in if g.ok then g.summary + "\n" else throw g.summary'
{ lib, root }:
let
  specs = import ./specs.nix;
  has = import ../string-contains.nix;
  inherit (specs)
    checkRel liveNeedle
    toyCommentsOnly toyBlockOnly toyLive
    heldRows;

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel = rel: if exists rel then builtins.readFile (root + "/${rel}") else null;

  # Literal split. lib.splitString is regex; "/*" would eat a leading "/-".
  splitLit = needle: hay:
    let
      tok = "KFAILATSPLIT";
      marked = builtins.replaceStrings [ needle ] [ tok ] hay;
    in lib.splitString tok marked;

  stripBlock = open: close: text:
    let parts = splitLit open text;
    in if builtins.length parts < 2 then text
    else
      let
        pre = builtins.head parts;
        rest = lib.concatStringsSep open (lib.drop 1 parts);
        after = splitLit close rest;
      in
      # Unmatched opener is not a comment (SystemsLean/*.lean is a glob).
      if builtins.length after < 2 then text
      else pre + " " + stripBlock open close (
        lib.concatStringsSep close (lib.drop 1 after)
      );

  cutLine = line:
    let
      at = m:
        let p = splitLit m line;
        in if builtins.length p < 2 then null
        else builtins.stringLength (builtins.head p);
      iSlash = at "//";
      iDash = at "--";
      i =
        if iSlash == null then iDash
        else if iDash == null then iSlash
        else if iSlash < iDash then iSlash else iDash;
    in
    if i == null then line
    else builtins.substring 0 i line;

  codeOf = text:
    let
      noC = stripBlock "/*" "*/" text;
      noLean = stripBlock "/-" "-/" noC;
    in
    lib.concatStringsSep "\n" (map cutLine (lib.splitString "\n" noLean));

  rejectBody = text:
    let
      parts = splitLit "def rejectLayer" (codeOf text);
    in
    if builtins.length parts < 2 then null
    else builtins.head (splitLit "\ndef " (builtins.elemAt parts 1));

  hasLiveCall = text:
    let body = rejectBody text;
    in body != null && has liveNeedle body;

  srcText = readRel checkRel;
  liveOk = srcText != null && hasLiveCall srcText;
  commentsStayOut =
    !(hasLiveCall toyCommentsOnly) && !(hasLiveCall toyBlockOnly);
  liveToyOk = hasLiveCall toyLive;

  flag = cond: msg: if cond then [ msg ] else [ ];
  violations =
    flag (srcText == null) "missing file: ${checkRel}"
    ++ flag (srcText != null && !liveOk)
      "live kernelFailAt match on rejectLayer: FAIL"
    ++ flag (!commentsStayOut)
      "self-check: comments-only kernelFailAt counted"
    ++ flag (!liveToyOk) "self-check: live toy must count";

  ok = violations == [ ];
  yn = b: if b then "OK" else "FAIL";
  summary =
    (if ok then "slake-kernel-fail-at OK" else "slake-kernel-fail-at FAILED")
    + "\nlive kernelFailAt match on rejectLayer: ${yn liveOk}"
    + "\ncomments-only kernelFailAt does not count"
    + "\n"
    + lib.concatStringsSep "\n" heldRows
    + (if ok then "" else "\n" + lib.concatStringsSep "\n" violations);
in
{
  inherit ok violations summary hasLiveCall liveOk commentsStayOut;
}
