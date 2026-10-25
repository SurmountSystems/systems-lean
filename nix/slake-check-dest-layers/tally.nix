# SPDX-License-Identifier: Unlicense
# Fold one slake-check walk log into counts. The caller passes lines.
# Reject layer: the next non-empty line after
# "slake-check checker returned false for <name>".
# That line is kept as printed (kept reject, front reject, or other).
# Accept layer key drops " for <name>": the name is already on EXIT.
# The line immediately before EXIT is counted separately. In the stage-1
# log that predecessor is boilerplate, not the reject phrase.
lines:
let
  bump = acc: key: acc // { ${key} = (acc.${key} or 0) + 1; };

  step = st: line:
    let
      isBanner = builtins.match "===.*" line != null;
      isFalse = builtins.match "slake-check checker returned false for (.*)" line != null;
      isTrue = builtins.match "(slake-check checker returned true) for .*" line;
      isExit = builtins.match "EXIT=([0-9]+) NAME=(.*)" line;
    in
    if line == "" then st
    else if isBanner then
      st // { expectLayer = false; pending = null; prev = line; }
    else if isExit != null then
      let
        code = builtins.elemAt isExit 0;
        name = builtins.elemAt isExit 1;
        layer = if st.pending == null then "no layer line" else st.pending;
        ts = builtins.match ".*TheoremSurface.*" name != null;
        zero = code == "0";
        one = code == "1";
      in
      st // {
        exit0 = st.exit0 + (if zero then 1 else 0);
        exit1 = st.exit1 + (if one then 1 else 0);
        exitOther = st.exitOther + (if zero || one then 0 else 1);
        lineBeforeExit = bump st.lineBeforeExit st.prev;
        layer = bump st.layer layer;
        theoremSurfaceExit0 = st.theoremSurfaceExit0 + (if zero && ts then 1 else 0);
        otherExit0 = st.otherExit0 + (if zero && !ts then 1 else 0);
        expectLayer = false;
        pending = null;
        prev = line;
      }
    else if isFalse then
      st // { expectLayer = true; prev = line; }
    else if st.expectLayer then
      st // { expectLayer = false; pending = line; prev = line; }
    else if isTrue != null then
      st // { pending = builtins.head isTrue; prev = line; }
    else
      st // { prev = line; };

  empty = {
    expectLayer = false;
    pending = null;
    prev = "";
    exit0 = 0;
    exit1 = 0;
    exitOther = 0;
    lineBeforeExit = { };
    layer = { };
    theoremSurfaceExit0 = 0;
    otherExit0 = 0;
  };
in
builtins.foldl' step empty lines
