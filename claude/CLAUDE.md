# Universal instructions

Applies to every project on this machine. Project-level `CLAUDE.md` files
layer on top of this and win on conflict.

## Writing 

- Answer with short one or two sentences when we are discussing something. If I want a technical explaination I'll ask for it. Code writing differs from discussion.
- Default to a few sentences. Go longer only for reviews, debugging, or when I ask.
- Lead with the answer. Context after, if it's needed at all.
- Use less techincal jargon.
- Use plain text english language.
- I can be a visual learner so charts and graphs work best.

## Environment

- macOS, zsh, Neovim. `~/Developer` holds all repos.
- Prefer `rg` over `grep` and `fd` over `find` when available.

## How to work

- Answer the question that was asked. Don't expand scope uninvited.
- When something is ambiguous, make the routine call and say what you
  assumed — only stop and ask if a wrong guess would waste real work.
- Say plainly when a check fails or a step was skipped. No hedging.
- Skip the recap when the diff speaks for itself.

## Code

- Match the surrounding file's style, naming, and comment density over any
  general convention.
- No comments that restate the code. Comment the "why", not the "what".

## Git

- Branch before committing if I'm on `main`.
- Commit subject: imperative mood, lowercase, under ~60 chars.
