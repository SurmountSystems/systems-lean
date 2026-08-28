# Lake versus Slake on one named job (2026-08-13)

Named job: host package elaborate under `src/systems` (hot `lake build` when the package is already Built). Compile-path develop-step Lake actually runs.

| Arm | Number |
|-----|--------|
| Lake | 0.447 s real (hot second pass; user 0.304, sys 0.129) |
| Slake | Slake cannot do this job yet: full host package elaborate. Missing classic Lean elaborator parity. |

Recipe first pass 29.613 s (not idle). Earlier stale rebuild 696.357 s is not the same-job number.

TDD: `just bench-same-job-contract` RED (exit 1) then GREEN (exit 0).
Timed with `just bench-same-job` (exit 0). `just hygiene` exit 0.
Full `just bench` not run; CompCert arm is long. Smallest recipe produced both arms.

Living report `doc/BENCH-latest.md` leads with the same-job table. `just bench` writer now emits the same lead so a later full suite stays honest.

Review follow-up: contract locks idle-hot (RED on 29.613 first-pass headline, then green). Writer greps exclude the contract body. `just bench-same-job` writes `doc/BENCH-SAME-JOB-latest.md` (latest Lake 0.459 s). Suite file stays `doc/BENCH-latest.md`. No B/A emit-versus-elaborate ratio. Residual left to lockstep.

No unlike-job speed claim. No claim flips.
