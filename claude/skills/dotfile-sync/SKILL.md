---
name: dotfile-sync
description: Pull the latest dotfiles from GitHub and verify every symlink on this machine points at the repo. Use when the user runs /dotfile-sync, or asks to sync, update, or repair their dotfiles or dotfile symlinks.
---

# Dotfile sync

Bring this machine in line with `git@github.com:miotke/dotfiles.git`: pull the
latest commits, then make sure each managed path is a symlink into the repo.

Repo location: `~/Developer/dotfiles` (referred to below as `$DOTFILES`).

## 1. Pull the latest

Run from `$DOTFILES`:

```sh
git -C ~/Developer/dotfiles status --porcelain
git -C ~/Developer/dotfiles pull --ff-only
```

- If `status` shows uncommitted changes, report them and ask before pulling —
  never stash or discard the user's work on your own.
- If the fast-forward pull fails (diverged branches), stop and report the
  divergence rather than merging or rebasing.

## 2. Check the symlinks

| Link | Target in repo |
| --- | --- |
| `~/.zshrc` | `zshrc` |
| `~/.zprofile` | `zprofile` |
| `~/.tmux.conf` | `tmux.conf` |
| `~/.config/nvim` | `nvim` |
| `~/.config/ghostty` | `ghostty` |
| `~/.claude/CLAUDE.md` | `claude/CLAUDE.md` |
| `~/.claude/skills` | `claude/skills` |

For each row, check the current state of the link path:

- **Correct symlink** — already points at the repo target. Leave it alone.
- **Missing** — create it: `ln -s $DOTFILES/<target> <link>` (make the parent
  directory first if needed).
- **Symlink pointing somewhere else** — replace it: `rm <link>` then relink.
- **A real file or directory** — do not delete it. Back it up first
  (`mv <link> <link>.bak-$(date +%Y%m%d%H%M%S)`), then create the symlink and
  tell the user where the backup went.

Resolve with `readlink` and compare against the expected absolute path; note
that `~/Developer` is case-insensitive on macOS, so a link written as
`.../developer/dotfiles/...` still resolves correctly — treat it as correct but
mention it.

Keep this table in sync with `create_symlinks()` in `$DOTFILES/setup.py`. If
that function manages a path this skill doesn't list, add it here.

## 3. Reload what changed

Only reload the things whose files actually changed in the pull (check
`git diff --name-only HEAD@{1} HEAD`):

- `tmux.conf` — if tmux is running, `tmux source-file ~/.tmux.conf`; otherwise
  say it will apply on next launch.
- `zshrc` / `zprofile` — tell the user to open a new shell or run
  `source ~/.zshrc`; do not source it into the tool shell.
- `nvim`, `ghostty`, `claude/` — no action, they read from the symlink on start.

## 4. Report

Finish with a short summary: what was pulled (commit range or "already up to
date"), which symlinks were created, repaired, or backed up, which were already
fine, and anything reloaded. Keep it to a few lines — call out only what
changed or needs the user's attention.
