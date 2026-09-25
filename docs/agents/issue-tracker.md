# docs/agents/issue-tracker.md: GitHub Issues via `gh`

> **Solo mode is active** (`CLAUDE.md` § Solo mode): the board is the Issues of the participant's own fork. Every command below targets the fork, never its parent; check with `gh repo set-default --view` before the first write.

The board is the GitHub Issues of this repository. Tool: the GitHub CLI `gh`, authenticated with `gh auth login`. Run every command from the repo root; `gh` picks the repo from the git remote.

## First write of every session: claim

```
gh issue edit <n> --add-assignee @me
gh issue comment <n> --body "Claimed by @<handle> (group <X>). Plan: <one sentence>."
```

Several groups and agent sessions run on this board in parallel, each in its own worktree. A peer's uncommitted work is invisible in your tree; the assignee is the only shared signal that an issue is taken. **An issue assigned to someone else is live work. Do not take it over.** Ask in a comment; the assignee hands it over (see *Handoff*).

## Frontier (wayfinder)

Open, unassigned children of a map, oldest first:

```
gh issue list --state open --search "no:assignee label:wayfinder:research,wayfinder:prototype,wayfinder:grilling,wayfinder:task sort:created-asc" --json number,title,labels,body
```

Drop any issue whose body lists a `Blocked by #N` where `#N` is still open (`gh issue view N --json state`). The first remaining number wins.

## Creating issues

Use the issue forms in `.github/ISSUE_TEMPLATE/` or `gh`:

```
gh issue create --title "<a question or an outcome, as a sentence>" --label "wayfinder:research,groep-b" --body-file <file>
```

- **Map** = one issue labelled `wayfinder:map`. Its body holds a task list of its children (`- [ ] #14`), so GitHub shows progress.
- **Children** carry exactly one of `wayfinder:research` / `wayfinder:prototype` / `wayfinder:grilling` / `wayfinder:task`, plus the group label.
- **Blocking** is a line in the child's body: `Blocked by #13`. If the repository has GitHub's native issue relationships, add the same edge there too (issue sidebar → Relationships); the body line stays the source of truth for the frontier query.
- Titles are sentences. No `#` in a title.

## Handoff to another person or group

```
gh issue comment <n> --body-file handoff.md        # done / open / next skill / links; <REDACTED> secrets
gh issue edit <n> --remove-assignee @me --add-assignee <handle>   # or leave it unassigned and label groep-<y>
```

Delete `handoff.md` afterwards. The comment is the handoff; the repo never holds one.

## Closing

A PR body says `Closes #<n>`. A research or grilling issue without code is closed with a comment that links the note or the ADR: `gh issue close <n> --comment "Answered in docs/research/<n>-<slug>.md"`.

## Traps

- `--search` uses GitHub search syntax: labels with a colon must be written exactly (`label:wayfinder:task`), several labels comma-separated mean OR.
- `gh` on Windows PowerShell: wrap `--search` in double quotes; do not nest double quotes inside.
- A collaborator invitation must be accepted (github.com/notifications) before `--add-assignee` works for that person.
- Every agent comment starts with: `> Written by an AI agent for @<handle>; a human read it before posting.`
