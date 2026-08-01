# SPDX-License-Identifier: Unlicense
# Substring presence without lib.hasInfix / builtins.match (regex).
#
# lib.strings.hasInfix uses:
#   builtins.match ".*${escapeRegex needle}.*" hay
# On large files (e.g. src/systems/self-host.md ~300k+ chars) that regex can
# stack-overflow under libstdc++ (NixOS/nix#2147 and related). CI GHA runners
# hit this on just systems-host after reading hostSpecs tokens against large
# docs/Lean. builtins.replaceStrings is a primop and stays stack-safe.
#
#   import ./string-contains.nix needle hay -> Bool
#
# Empty needle: false (gates never pass empty honesty tokens).
needle: hay:
needle != "" && builtins.replaceStrings [ needle ] [ "" ] hay != hay
