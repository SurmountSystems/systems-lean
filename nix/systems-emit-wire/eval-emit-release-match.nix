# SPDX-License-Identifier: Unlicense
# Emit vs optional release byte identity for systems-emit-wire.
# Cold eval only; hostPin family scanners stay in default.nix.
# Missing out/ is still OK (optional release); present-but-stale fails closed.
# Does not flip freestandingProductSelfHostComplete; not residual free.
# No bash, no ripgrep, no Python.
{
  readRel,
  emitH,
  emitC,
  releaseH,
  releaseC,
}:
{
  # SELF-HOST-KERNEL-SELF-APPLY / SELF-HOST-KERNEL-REBUILD (partial B2):
  # when release surface is present, it must be byte-identical to product emit.
  emitReleaseMatchViolations =
    let
      eh = readRel emitH;
      er = readRel releaseH;
      ec = readRel emitC;
      erc = readRel releaseC;
    in
    (if eh != null && er != null && eh != er then
      [
        "SELF-HOST-KERNEL-SELF-APPLY: emit/out mismatch ${emitH} != ${releaseH}"
      ]
    else
      [ ])
    ++ (
      if ec != null && erc != null && ec != erc then
        [
          "SELF-HOST-KERNEL-SELF-APPLY: emit/out mismatch ${emitC} != ${releaseC}"
        ]
      else
        [ ]
    );
}
