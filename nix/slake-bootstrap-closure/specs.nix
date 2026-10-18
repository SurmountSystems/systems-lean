# SPDX-License-Identifier: Unlicense
# Data only: bootstrap compiled-name list location and names the ELF
# store filter must keep. Imported by ./default.nix. Does not rewrite
# nix/slake-bootstrap.nix.
{
  bootstrapRel = "nix/slake-bootstrap.nix";
  compiledListOpen = "closureMods = [";
  compiledListClose = "];";
  orderAnchor = "HostFront";
  requiredNames = [
    "MutualForm"
    "KeptForm"
    "KeptWalk"
    "KeptDrop"
    "KeptHitKernel"
    "KeptReject"
    "RejectBne"
    "RejectBeqThm"
    "RejectDecideBang"
    "RejectMatch"
  ];
}
