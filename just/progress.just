# Modular just: just/progress.just -- role recipes (import into root justfile).
# Pure Nix expression: progress report text from live tree (impure root only).
_progress_report := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  p = import ./nix/progress { inherit lib; };
in (p.mk ./. ).report
'''

_progress_console := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  p = import ./nix/progress { inherit lib; };
in (p.mk ./. ).console
'''

progress:
    mkdir -p doc
    nix eval --impure --raw --expr {{quote(_progress_report)}} > doc/PROGRESS.md
    nix eval --impure --raw --expr {{quote(_progress_console)}}
    @echo "wrote doc/PROGRESS.md"

# Progress meters plus scc novel snapshot (size appendix; scc is an external binary).
# Honest novel excludes: ref (upstream), skills (agent skill submodules), .lake, .cache, .git.
# Product wire C and behavioral tests remain in the count; they are permanent roles.
progress-scc: progress
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p doc .cache
    set +e
    scc . --exclude-dir .git --exclude-dir ref --exclude-dir skills --exclude-dir .lake --exclude-dir .cache \
      > .cache/last-scc.txt 2>&1
    scc_rc=$?
    set -e
    tr -cd '\11\12\15\40-\176\n' < .cache/last-scc.txt > .cache/last-scc.ascii
    {
      echo "# scc novel snapshot (generated)"
      echo ""
      echo "Exit: $scc_rc"
      echo "Generator: just progress-scc (scc from PATH / nixpkgs)"
      echo "Excludes: .git ref skills .lake .cache (honest novel; not freestanding vs classic AOT confusion)"
      echo ""
      echo '```'
      head -n 80 .cache/last-scc.ascii
      echo '```'
      echo ""
      echo "SPDX-License-Identifier: Unlicense"
    } > doc/PROGRESS-scc.txt
    {
      echo ""
      echo "## Code size (\`scc\` novel)"
      echo ""
      echo "Exit: $scc_rc -- full snapshot: \`doc/PROGRESS-scc.txt\`"
      echo "Excludes: .git ref skills .lake .cache"
      echo ""
      echo '```'
      head -n 22 .cache/last-scc.ascii
      echo '```'
    } >> doc/PROGRESS.md
    echo "scc novel snapshot -> doc/PROGRESS-scc.txt (rc=$scc_rc)"

# Pure Nix source hygiene (ASCII + no trailing WS) plus professional-tone
# (novel *.md banned tokens). Live impure worktree eval; no git stage needed.
