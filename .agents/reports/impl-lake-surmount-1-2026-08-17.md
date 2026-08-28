# Lake on surmount-1 (2026-08-17)

Status: **continued, not GREEN**. First run died at 15/40. Same niced
command resumed (pid 2515, NI=19). At 12:19:47 local the log was
**24/40**. Named subset stays **29 of about 206**. Do not claim Lake
finished. Do not flip FullHost or package-typecheck.

## Box

- Allowed host is **surmount-1** (mail and Lean share it). Older "do not
  use the mail VPS as a Lean box" is superseded.
- RAM/disk: plenty. No `hunter` home. Worktree: **`/var/lib/iso`**.
- Elan: **`/var/lib/elan`**, pin `leanprover/lean4:v4.32.0` (rsync of the
  laptop toolchain). Generic ELF needed patchelf to the NixOS loader.
- Verified before Lake: `lean --version` = 4.32.0; `lake --version` ok.

## Product

- Do not invent `HostModuleCheckRequiredDeclsLater`. Probe, walk
  wrappers, and four `*_true` theorems already exist.
- No fake red. Contract GREEN is Lake on the box.

## Command

```text
cd /var/lib/iso/src/systems
export ELAN_HOME=/var/lib/elan
export PATH=/var/lib/elan/toolchains/leanprover--lean4---v4.32.0/bin:$PATH
nice -n 19 ionice -c3 lake build SystemsLean.ElabMeetTheorems
# pid 105473  NI=19  user=root
# log /var/lib/iso/src/systems/lake-elabmeet-2026-08-17.log
```

First exit: **incomplete** (pid 105473 gone; log ended at 15/40
`ElabMeetOlean`). Host reachable again 12:16:06 local. Continued the
same command, appended the same log. Continue pid **2515** NI=19 still
running at 12:22 (**26/40**, `ElabMeetSubset`). Host went dark again
about 12:29 (ssh timeout; public health 000). cache.nixos.org 200. Do
not claim 30/206. Do not flip FullHost or package-typecheck. Skip
Linear and IrGraph. Did not start Lake on horizon. Did not start a
second Lake while this one is live.

## When Lake finishes

1. `tail` the log; record Lake exit.
2. If GREEN, update `WATCHER.md` / `RESIDUAL.md` to **30 of about 206**
   and close Name 156.
3. Optional: `lake build SystemsLean.ElabMeet`.
