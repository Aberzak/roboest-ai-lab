# CLAUDE.md: Roboest AI Lab

Project instructions for agents working in this repo. `README.md` explains what the lab is; read it first, then `CONTEXT.md`, then `docs/agents/*.md`, then the issue.

## Public repo: what never goes in here

This repository is **public**. Every issue, comment, commit, branch name and file is readable by anyone.

- **No customer or employer names**, no names of real employees other than the GitHub handles of the participants.
- **No internal URLs** (our Azure DevOps organisation, internal portals, environment names) and **no code copied from internal repositories** (MyRoboest, Tikklok). Describe what Tikklok taught us in your own words; never paste it.
- **No secrets.** Not in code, not in notes, not in a prototype. Write `<REDACTED>`. Credentials only via environment variables.
- **Research uses public primary sources only**: official government pages, Microsoft Learn, the CLI's own `--help`. Internal process facts go in a question for a person (`/to-questionnaire`), answered outside this repo.
- If in doubt, leave it out and ask the facilitator.

## Rules that have already cost us (carried over from Tikklok)

- **A number means a link.** On GitHub `#12` links issue 12 of this repo, which is what you want in commits and PRs (`Refs #12`, `Closes #12`). A work item from our Azure DevOps boards is written `MyRoboest 277`, never `#277`: GitHub would link the wrong issue, Azure DevOps would link organisation-wide.
- **Claim before you touch.** Several groups and several agent sessions work on this board in parallel. The assignee is the only shared signal that an issue is taken.
- **Documented is not tested.** A guarantee written in an ADR without a test or a build check that names it is a wish. Say which check enforces it, or say that none does.

## Language

**Everything in this repo and on its board is English**: docs, code, comments, commit messages, branch names, issue titles and discussion. The Expenses UI is Dutch; English prose that names a Dutch UI label is correct (`CONTEXT.md` carries the `_UI_` label).

`CONTEXT.md` is the glossary. Use its terms verbatim. A missing concept is a signal for `/domain-modeling`, not a licence to invent a synonym.

## Agent skills

The Matt Pocock skills are installed per participant (see README) into `.claude/skills/`, which is git-ignored here.

- **Issue tracker**: GitHub Issues of this repo, driven with `gh`. See `docs/agents/issue-tracker.md`. Claiming (assign yourself) is the **first write of every session**.
- **Triage labels**: the five canonical roles as labels. See `docs/agents/triage-labels.md`.
- **Domain docs**: single context, `CONTEXT.md` at the root plus `docs/adr/`. See `docs/agents/domain.md`.
- **Guardrails**: `.claude/settings.json` registers `.claude/hooks/block-dangerous-git.sh`, which blocks `git push`, `reset --hard`, `clean -f`, `branch -D`, `checkout .`, `restore .`. The agent proposes; a human pushes.

## Working conventions

- One issue per session, one worktree per issue: `git worktree add .claude/worktrees/<skill>-<n>-<slug> -b claude/<skill>-<n>-<slug>`.
- Prototypes live on `prototype/<name>` and are never merged into `main`; `prototypes/README.md` on `main` lists them.
- Commit messages are a sentence: `Refs #12: <what changed and what it taught us>`. A PR that finishes an issue says `Closes #12`.
- Every looked-up fact goes to `docs/research/NNN-<slug>.md` (NNN = the issue number); every hard-to-reverse decision to `docs/adr/NNNN-<tension>.md`; every new term to `CONTEXT.md`.
- A handoff to another person or group is a **comment on the issue** (what is done, what is open, which skill to run next), then reassign. No handoff file is ever committed.
