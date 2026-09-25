# Case A: Map the Expenses module

**Engine:** `/wayfinder` · **Also:** `/research`, `/grill-with-docs`, `/to-questionnaire` · **Starts on:** the `wayfinder:map` issue on your fork's board · **Time:** 45–60 min

## The situation
Roboest wants an Expenses module next to Tikklok: an employee claims costs, a manager approves, finance pays. Nobody knows yet how big it is. Cases B, C and D each own one corner of the fog; their issues are already on the map. **You own the map itself**: everything that is not yet anybody's corner.

## Goal
A bigger map with blocking edges, plus one research note and one ADR from the first issues on its frontier.

## Steps
1. Assign the map issue to yourself. Open Claude Code and have it read `CLAUDE.md`, `CONTEXT.md`, `docs/agents/issue-tracker.md` and the map. Check that `gh repo set-default --view` prints your fork.
2. `/wayfinder` on the existing map. Ask it to **extend**, not restart: keep the B, C and D issues as children and add at least five new ones: ≥1 `wayfinder:research`, ≥1 `wayfinder:prototype`, ≥2 `wayfinder:grilling`, ≥1 `wayfinder:task`. Every task is `Blocked by` at least one grilling issue. Update the map's task list.
   Where to look for fog: expense categories, the flat-rate allowance, who is the approver when the manager is absent, the link with payroll, what happens when an employee leaves, how finance exports payouts.
3. Run the frontier query. Assign the first research issue to yourself and start `/research` on it in a second session, in the background (public primary sources only).
4. While it runs, read the new issues as if a stranger wrote them. Is every title a question or an outcome, as a sentence? Label the two clearest `ready-for-agent`.
5. When the note is in: close the research issue with a link. `/grill-with-docs` on the first grilling issue it unblocks. At least one new headword in `CONTEXT.md` and one ADR with the price in its title.
6. (Time left) One question only a person inside Roboest can answer (for example "how are expenses paid today?"): `/to-questionnaire` for one named role. The questionnaire goes in the PR; **the answer never goes in this public repo**.
7. PR to your fork's `main` with the note, the ADR and the `CONTEXT.md` change, `Closes #<research>` and `Closes #<grilling>`. Run `/code-review`, read what it says, then merge.

## Deliverables
- The map extended with ≥5 issues and correct `Blocked by` lines; the task list up to date.
- `docs/research/<n>-<slug>.md` and `docs/adr/NNNN-<tension>.md`.
- (Time left) one questionnaire.

## Questions to ask yourself
- Which issue on the map is a task disguised as a decision? Plan, don't do.
- Which of these questions is not technical at all, but a question for HR or finance?
- The agent's recommended answer: did you decide, or did you just accept?

## Success criteria
- Every grilling issue holds an either/or with the price of each option.
- Every new task is `Blocked by` a grilling issue, and the map's task list shows all of them.
- Nothing internal in any issue, comment or file.

## Practise at home
Workbook exercises 7 (wayfinder), 3 (grilling round), 4 (headwords + ADR), 13 (questionnaire).

---
Your fork, your board · Read the contract · `#12` for this repo, `MyRoboest 277` for Azure DevOps · Public means public
