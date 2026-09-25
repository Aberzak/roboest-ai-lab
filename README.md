# Roboest AI Lab

A public practice repository for the Roboest AI coding training. Four groups work here at the same time with Claude Code and the Matt Pocock skills on one shared issue board. The domain is **Expenses**: a small, new module that lets an employee claim expenses (a receipt, a trip) and lets a manager approve them. Nothing here is production code, and nothing here comes from a customer.

> **This repository is public.** Everyone on the internet can read every issue, comment, commit and file. Read [CLAUDE.md § Public repo](CLAUDE.md#public-repo-what-never-goes-in-here) before you write anything.

## Quick start (10 minutes, once)

You need: git, Node 20+, Claude Code, the GitHub CLI `gh`, PowerShell 7 (`pwsh`), a GitHub account.

You work in **your own fork**: your repo, your board, your PRs. A fork copies the files but not the issues, so one script puts the case issues on your board. Read [CLAUDE.md § Solo mode](CLAUDE.md#solo-mode-active-your-own-fork).

```powershell
gh auth login                                   # GitHub.com, HTTPS, browser
gh repo fork Aberzak/roboest-ai-lab --clone     # your copy on GitHub, cloned to this folder
cd roboest-ai-lab
pwsh ./scripts/Seed-Board.ps1                   # turns on Issues in your fork, adds the ten case issues,
                                                # and points gh at YOUR fork, not the original
gh repo set-default --view                      # must print <your-handle>/roboest-ai-lab

# the skills: every participant installs the same set; .claude/skills/ is git-ignored in this public repo
npx skills add mattpocock/skills -a claude-code -y `
  -s ask-matt -s code-review -s codebase-design -s diagnosing-bugs -s domain-modeling `
  -s grill-me -s grill-with-docs -s grilling -s handoff -s implement `
  -s improve-codebase-architecture -s prototype -s research -s resolving-merge-conflicts `
  -s setup-matt-pocock-skills -s tdd -s teach -s to-questionnaire -s to-spec -s to-tickets `
  -s triage -s wait-what -s wayfinder -s wizard -s writing-for-agents

claude
```

In Claude Code, check: `/ask-matt I am new here, which skill do I start with?` must answer with the main flow. Then open your group's case in [`cases/`](cases/).

The git guardrail hook ships with the repo (`.claude/settings.json`): the agent cannot `git push`, `reset --hard`, `clean -f`, `branch -D` or `checkout .`. The agent proposes; a human pushes.

## The four rules

1. **Claim first.** Assign the issue to yourself (`gh issue edit <n> --add-assignee @me`) before you read code or type a prompt. An issue assigned to someone else is live work: do not take it over without asking in a comment.
2. **Read the contract.** `CLAUDE.md` → this README → `CONTEXT.md` → the issue, then code.
3. **Numbers mean something.** Here `#12` links issue 12 of *this* repo, which is what you want. A number from our Azure DevOps boards is written as `MyRoboest 277`, never `#277`: on GitHub that would link the wrong issue.
4. **Public means public.** No customer names, no internal URLs, no secrets, no code from internal repos. Ever.

## Where things live

| Path | What |
|---|---|
| `CLAUDE.md` | The rules for agents (and people) in this repo |
| `CONTEXT.md` | The Expenses glossary. One word per concept. |
| `docs/research/` | One note per measured or looked-up fact, in the house format |
| `docs/adr/` | One file per hard-to-reverse decision, the tension in the title |
| `docs/agents/` | How the skills talk to this board (`gh`), the triage labels, the domain layout |
| `prototypes/` | Throwaway spikes: plain HTML, open in a browser. The code lives on `prototype/<name>` branches. |
| `cases/` | The four team cases (A–D) |
| `.github/ISSUE_TEMPLATE/` | Issue forms for the four wayfinder ticket types and raw requests |

## The main flow

```
/wayfinder (foggy, multi-session) ─▶ issues: research · prototype · grilling · task
/research ─▶ docs/research/NNN-*.md            (facts: the agent's job)
/prototype ─▶ prototype/<name> branch          (a question that won't settle on paper)
/grill-with-docs ─▶ CONTEXT.md + docs/adr/     (decisions: ours)
/to-spec ─▶ /to-tickets ─▶ /implement ─▶ /code-review ─▶ PR
```
