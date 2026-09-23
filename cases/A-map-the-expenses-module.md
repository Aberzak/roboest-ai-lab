# Case A: Map the Expenses module

**Group:** `groep-a` · **Engine:** `/wayfinder` · **Also:** `/research`, `/grill-with-docs`, `/to-questionnaire` · **Starts on:** the `wayfinder:map` issue

## The situation
Roboest wants an Expenses module next to Tikklok: an employee claims costs, a manager approves, finance pays. Nobody knows yet how big it is. Groups B, C and D each own one corner of the fog; the facilitator already put their issues on the map. **You own the map itself**: everything that is not yet anybody's corner.

## Goal
A map that the other groups can pull work from: more decision issues with blocking edges, one research note and one ADR from the first issues on your own frontier.

## Steps
1. Board keeper assigns the map issue to the group. Driver opens Claude Code and has it read `CLAUDE.md`, `CONTEXT.md`, `docs/agents/issue-tracker.md` and the map.
2. `/wayfinder` on the existing map. Ask it to **extend**, not restart: keep B, C and D's issues as children and add at least five new ones: ≥1 `wayfinder:research`, ≥1 `wayfinder:prototype`, ≥2 `wayfinder:grilling`, ≥1 `wayfinder:task`. Every task is `Blocked by` at least one grilling issue. Update the map's task list.
   Where to look for fog: expense categories, the flat-rate allowance, who is the approver when the manager is absent, the link with payroll, what happens when an employee leaves, how finance exports payouts.
3. Run the frontier query. Assign the first research issue to yourselves and start `/research` in the background (public primary sources only).
4. **Exchange (minute 20):** label two new issues `ready-for-agent` and announce them in the room. Other groups may take them. File one request for another group.
5. When the note is in: close the research issue with a link. `/grill-with-docs` on the first grilling issue it unblocks. At least one new headword in `CONTEXT.md` and one ADR with the price in its title.
6. (60 min) One question only a person inside Roboest can answer (for example "how are expenses paid today?"): `/to-questionnaire` for one named role. The questionnaire goes in the PR; **the answer never goes in this public repo**.
7. PR with the note, the ADR and the `CONTEXT.md` change, `Closes #<research>` and `Closes #<grilling>`. Reviewer from another group.

## Deliverables
- The map extended with ≥5 issues and correct `Blocked by` lines; the task list up to date.
- `docs/research/<n>-<slug>.md` and `docs/adr/NNNN-<tension>.md`.
- (60 min) one questionnaire.

## Conversation prompts
- Which issue on the map is a task disguised as a decision? Plan, don't do.
- Which of these questions is not technical at all, but a question for HR or finance?
- The agent's recommended answer: did we decide, or did we just accept?

## Success criteria
- Every grilling issue holds an either/or with the price of each option.
- At least one of your new issues was taken by another group.
- Nothing internal in any issue, comment or file.

---
Claim first · Read the contract · `#12` for this repo, `MyRoboest 277` for Azure DevOps · Public means public
