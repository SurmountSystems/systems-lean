# Lake and Nix remote builders (recipe, not applied)

Date: 2026-08-17
Status: **not applied**. This file is a recipe only. Laptop Nix config was not changed. The mail VPS was not touched. Lake was not run. No hostname was invented.

This track is the Lean monorepo at `/home/hunter/Projects/ai/iso`. It is **not** surmount-server. Do not edit surmount-server product, `RESIDUAL.md`, or management-ui for this work.

## Status answers (required)

| Question | Answer |
|----------|--------|
| Where is the Lean repo? | **Found:** `/home/hunter/Projects/ai/iso` |
| Is a builder box / SSH ready? | **No.** No `/etc/nix/machines`, no `~/.ssh/config` Host alias, no `nix.buildMachines` on this laptop. `known_hosts` has `github.com` plus unlabeled IPs (not printed). Prior chat used the placeholder name `the-beefy-box`; that is **not** a configured host. |
| Was Lake run? | **No.** Exit: not invoked. |
| Did Grow HostModuleCheckRequiredDeclsLater land? | **Parked.** Remaining named subset is still **29 of about 206**. Product module `SystemsLean.HostModuleCheckRequiredDeclsLater` already exists. There is no ready SSH worktree on a beefy box, and this laptop OOMs on `lake build SystemsLean.ElabMeetTheorems`. Do not start Lake here. |

Sources: `/tmp/grok-1000/l3-lean-repo-find.md`, `/tmp/grok-1000/l3-builder-inventory.md`, `WATCHER.md`, `RESIDUAL.md` Name 156.

## Facts already known (laptop)

- Laptop label: `horizon`. Arch: **x86_64-linux**. Distro: Garuda (not NixOS; `/etc/nixos` absent).
- Nix is installed. `nix-daemon` is active. Local `max-jobs` is `1`. Local `system-features` include `big-parallel`.
- `/etc/nix/nix.conf` has `trusted-users` and `experimental-features`. No `builders` line. `nix show-config` points at `@/etc/nix/machines`, and that file is **absent**.
- `builders-use-substitutes` is currently `false`.
- Lean pin (root and `src/systems`): `leanprover/lean4:v4.32.0`.
- Product Lake package: `src/systems` (`lakefile.lean`, package SystemsLean). Root `lakefile.lean` is a thin umbrella (`Iso`) that requires `src/systems`.
- `.agents/` exists. Later reports belong under `.agents/reports/`. Do not create a project-root `.grok/` for reports.
- Next compiler slice (when a RAM-capable box exists): **Grow HostModuleCheckRequiredDeclsLater**. Skip Linear and IrGraph as named members. Do not flip FullHost or package-typecheck pins (`slakeOwnsPackageTypecheck`, `elabMeetFullHostElaborateRemains`, `FullHostElaborateRemains`).

Do **not** change this laptop's Nix config until the operator supplies the box facts below.

## Two jobs (do not mix them)

### Job A: Lake (Lean itself)

Command (always from `src/systems` only):

```bash
cd /path/to/iso/src/systems
lake build SystemsLean.ElabMeetTheorems
# WATCHER also names:
lake build SystemsLean.ElabMeet
```

This is a **host process**, not a Nix derivation. Nix distributed builders (`nix.buildMachines` / `ssh-ng`) **do not pick up Lake**. They only run store builds that the Nix daemon scheduled. If you run `lake` on the laptop, Lean stays on the laptop and can OOM.

Ways Job A can run on the box:

1. **Preferred for now:** SSH to the box, same worktree (or rsync of at least `src/systems` plus the matching `lean-toolchain` and Lake files), same pin `leanprover/lean4:v4.32.0`, write access to `.lake/`, tens of GB of RAM. Then run Lake **on the box**.
2. **Alternative:** wrap Lake in a Nix derivation so the daemon *does* schedule it as a store build. Then Job A becomes Job B's shape. That wrap does not exist today. Do not invent one in this parked turn.
3. **Stopgap only:** swap on this laptop. Not a builder plan.

### Job B: Nix store builds (remote builders help)

These **are** Nix store / eval work. A wired `ssh-ng` builder can take the heavy derivations.

Typical commands from the repo root `/home/hunter/Projects/ai/iso`:

```bash
just hygiene
just systems-host
just check
nix flake check
```

What they are (from `justfile` and `doc/nix-tooling.md`):

- `just hygiene` and `just systems-host` are live impure evals of the worktree (pure Nix under `nix/source-hygiene.nix` and `nix/systems-host-presence/`).
- `nix flake check` is a real Nix store check set (`source-hygiene`, `systems-host-presence`, and the other flake checks).
- `just check` runs product wire (`just build`), then hygiene, systems-host, systems-emit-wire, systems-llvm-ir, idris-side, lean-side, then `nix flake check`, then elaborator / cc / CompCert recipes. The Lake-shaped pieces inside `just check` (`just systems-lake`, elaborators) are still **Job A** unless wrapped.

Remote builders help the Nix store half. They do **not** magically move `lake build` unless Lake is a derivation.

## NixOps is the wrong tool

Do **not** introduce NixOps for this. The wanted tool is **Nix distributed builds**: `nix.buildMachines` plus `ssh-ng` (and the machines file the daemon already looks for at `/etc/nix/machines`).

NixOps deploys NixOS networks. This job is "run my laptop's Nix builds on a bigger x86_64-linux store" and separately "run Lake where there is RAM." Those are not a NixOps rollout.

Do **not** treat Surmount `hosts/mail-vps` as a Lean or Nix compile box.

## Recipe (not applied)

### On the builder box (operator or a later apply pass)

Need a dedicated **x86_64-linux** NixOS (or Nix-daemon) host with a large `/nix/store` disk and tens of GB of RAM if it will also run Job A.

1. Create a **builder user** (placeholder: `<builder-user>`). Key-only SSH. No password login for that user.
2. Install the **laptop public key** only. Do not paste private keys into docs or chat.
3. Put `<builder-user>` (or a dedicated Nix builders user) in `nix.settings.trusted-users` **on the box**. The Nix daemon on the laptop will SSH as this user; untrusted remote users cannot accept delegated builds.
4. Raise `nix.nrBuildUsers` enough for the jobs you will send (more than the laptop's local `max-jobs = 1`).
5. Advertise `system-features` that include **`big-parallel`** (and keep `kvm` / `nixos-test` only if you actually want those scheduled there).
6. Confirm the box is **x86_64-linux**, same as the laptop (`builtins.currentSystem` here is `x86_64-linux`). Cross builds are a different recipe.
7. Open SSH so the laptop can reach it as `<builder-host>` (DNS name or SSH alias the operator chooses). Do not invent that name here.
8. For Job A on the same box: elan or equivalent at **`leanprover/lean4:v4.32.0`**, checkout or rsync of `/home/hunter/Projects/ai/iso` (or at least `src/systems` plus matching toolchain and lakefiles), and **write access to `src/systems/.lake/`**. Lake writes oleans and build products there.

Sketch only (placeholders; do not apply; do not invent a real hostname):

```nix
# ON THE BOX -- NixOS sketch, not applied
{ ... }:
{
  users.users."<builder-user>" = {
    isNormalUser = true;
    # openssh.authorizedKeys.keys = [ "<laptop-ed25519-pub>" ];
  };
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
  nix.settings.trusted-users = [ "root" "<builder-user>" ];
  nix.nrBuildUsers = 32; # size to RAM and disk; example only
  nix.settings.system-features = [ "benchmark" "big-parallel" "kvm" "nixos-test" ];
  nix.settings.max-jobs = "auto";
}
```

### On the laptop (placeholders only; do not apply)

This laptop is Garuda, not NixOS. Distributed builds go in **Nix daemon config**, not `/etc/nixos`. Typical shapes:

- NixOS-style (if this machine were NixOS): `nix.distributedBuilds = true;` and `nix.buildMachines = [ ... ];`
- Multi-user Nix on Garuda: write `/etc/nix/machines` (the path `nix show-config` already names) **and** set `builders-use-substitutes = true` in `/etc/nix/nix.conf` (or a drop-in the daemon reads). User `~/.config/nix/nix.conf` alone does not always move daemon builds.

Machines-file line (ssh-ng). Placeholders only:

```
ssh-ng://<builder-user>@<builder-host> x86_64-linux /path/to/key 8 2 big-parallel,benchmark,kvm,nixos-test
```

Fields in order: store URI, systems, SSH identity file, `maxJobs`, `speedFactor`, `supportedFeatures`.

NixOS-shaped equivalent (for a future NixOS workstation; **not** this Garuda host unless rewritten):

```nix
# LAPTOP SNIPPET -- not applied; placeholders only
{
  nix.distributedBuilds = true;
  nix.settings.builders-use-substitutes = true;
  nix.buildMachines = [
    {
      hostName = "<builder-host>";
      sshUser = "<builder-user>";
      sshKey = "/path/to/key";
      system = "x86_64-linux";
      protocol = "ssh-ng";
      maxJobs = 8;
      speedFactor = 2;
      supportedFeatures = [ "benchmark" "big-parallel" "kvm" "nixos-test" ];
      mandatoryFeatures = [ ];
    }
  ];
}
```

Gotcha: the **nix-daemon** must be able to read `/path/to/key` and to use SSH as `<builder-user>`. A key that only exists in an interactive user agent is a common miss. Prefer a dedicated key file readable by root / the daemon, not a passphrase prompt mid-build.

Optional: set laptop `max-jobs = 0` **only if** the box is always up, so every store build is forced off-laptop. If the box can be down, leave local `max-jobs = 1` (current) so small builds still finish here.

Do not apply any of this until the operator names `<builder-host>`, `<builder-user>`, and the key path.

### Prove later (cheap Nix build, not Lake)

After the machines file / `buildMachines` exists, prove **Job B** with a small store build, not ElabMeet:

```bash
nix build --rebuild nixpkgs#hello
# or, from the iso repo, a named flake check that is cheaper than just check:
nix build .#checks.x86_64-linux.source-hygiene
```

Success looks like the build trace showing `builder` / `ssh-ng` / `<builder-host>`, not only `localhost`. If the trace never leaves the laptop, the daemon cannot see the machines file or cannot SSH.

Do **not** use `lake build SystemsLean.ElabMeetTheorems` as the first proof. That is Job A and will OOM here if it still runs locally.

### Job A on the box (when the operator says the repo is there)

```bash
# From the laptop, after the operator names the host (placeholders):
ssh <builder-user>@<builder-host> 'test -d /path/to/iso/src/systems'

# If the tree is not on the box, rsync the novel tree (not ref/lean4):
# rsync -a --delete \
#   --exclude .lake --exclude ref --exclude out \
#   /home/hunter/Projects/ai/iso/ \
#   <builder-user>@<builder-host>:/path/to/iso/

ssh -t <builder-user>@<builder-host> 'cd /path/to/iso/src/systems && cat lean-toolchain && lake build SystemsLean.ElabMeetTheorems'
```

The box `lean-toolchain` must read `leanprover/lean4:v4.32.0`. The Lake process must be able to write `.lake/`. Tens of GB RAM. Swap on `horizon` remains a last-ditch stopgap only.

When that Lake command is green on the box, Grow HostModuleCheckRequiredDeclsLater can start there. Until then it stays parked.

## If still parked: exact operator facts needed

1. **Hostname or SSH alias** of the beefy x86_64-linux box. Do not invent one. No Host alias exists on this laptop today.
2. **SSH user** for key-only login (`<builder-user>`).
3. Whether that user is already in `trusted-users` **on the box**, and whether the laptop **nix-daemon** can use the SSH key.
4. Whether **`/home/hunter/Projects/ai/iso` (or a worktree) is already on the box**. Distributed Nix builds do not copy a Lake worktree by themselves.
5. Whether the box should take **Job A** (Lake / tens of GB RAM), **Job B** (Nix store), or both.

Until those are named, do not start Lake on this laptop, do not wire `buildMachines`, and do not treat the mail VPS as a compile box.

## What this turn did not do

- Did not run Lake. Did not OOM.
- Did not mutate laptop NixOS / Nix config.
- Did not SSH. Did not touch the mail VPS.
- Did not invent a hostname. Did not print IPs, private keys, or secret env values.
- Did not apply the snippets above.
- Did not flip FullHost or package-typecheck pins.
- Did not edit surmount-server.

## Copy of this report

- `/tmp/grok-1000/lake-remote-builder-report.md`
- `/home/hunter/Projects/ai/iso/.agents/reports/lake-remote-builder-2026-08-14.md`
