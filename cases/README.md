# The four team cases

## Working solo (now)

Pick one case and follow its **Steps** on your own, 45–60 minutes, in your own fork (see the Quick start). You play every role; skip the exchange and the cross-group review. The case issues are on your fork's board: assign them to yourself, close them, open a PR to your own `main` and merge it. Your deliverables stay the same: at least one research note and one ADR. Time left? Take a second case.

## In groups

Four groups, one board, one domain (Expenses). Every case ends with **at least one research note and at least one ADR**, and every case uses a different skill as its engine.

| Case | Group | Engine | Research | ADR from `/grill-with-docs` |
|---|---|---|---|---|
| [A. Map the Expenses module](A-map-the-expenses-module.md) | `groep-a` | `/wayfinder` | the first research issue on the frontier | the first grilling issue on the frontier |
| [B. Mileage from the working-time register?](B-mileage-from-the-register.md) | `groep-b` | `/research` ×2 | mileage rules · GDPR purpose limitation | where work trips come from |
| [C. Submit a claim on a phone](C-submit-a-claim-on-a-phone.md) | `groep-c` | `/prototype` UI | receipts: photo and retention | photo-first or form-first |
| [D. Approve, pay, correct](D-approve-pay-correct.md) | `groep-d` | `/prototype` logic | Power Automate Approvals | is an approved claim ever edited |

The facilitator seeds the board before the session: one map issue (A), and for B, C and D a research, a prototype or second research, and a grilling issue that is **blocked by** the other two. Group A's map lists all of them as children. You start on a real frontier.

## Roles (every group)

| Role | Does |
|---|---|
| **Driver** | At the keyboard in Claude Code; reads the agent's proposals aloud. Rotates every 15 minutes. |
| **Decider** | Answers the grilling rounds. Facts are the agent's job; decisions are ours. |
| **Board keeper** | Claims (assigns), runs the frontier query, files and moves issues, checks `Blocked by` lines. |
| **Skeptic** | Opens every source the agent cites. Calls `/wait-what`. Keeps the "AI was wrong" log and presents the pitch. |

## Timeline

| Minute (60) | Minute (30) | Everyone |
|---|---|---|
| 0–5 | 0–3 | Assign your group's issues. Read `CLAUDE.md` → `README` → `CONTEXT.md` → the issue. |
| 5–20 | 3–12 | Start `/research` in the background, then your engine (`/wayfinder` or `/prototype`). |
| 20–25 | 12–15 | **Exchange** (below). |
| 25–45 | 15–25 | Close the research issue with the note; `/grill-with-docs` on the grilling issue → `CONTEXT.md` + ADR. |
| 45–55 | (skip) | PR, reviewed by **someone from another group**. |
| 55–60 | 25–30 | Stop. Skeptic prepares the 3-2-1. |

## The exchange: how groups work with each other

1. **Give one.** Every group files at least one issue for another group with the *Request for another group* form: an open point from your research, a finding from your prototype, a question your ADR cannot answer. It starts `needs-triage`; the receiving group triages it.
2. **Take one.** Every group takes over at least one issue it did not create: from A's map, or a request. Assign it; if someone else was faster, pick the next one on the frontier. That collision is the lesson, not a mistake.
3. **Hand over properly.** Passing an issue on = a comment (done / open / next skill / links), then reassign or swap the `groep-*` label, and add `handoff`. Never a file in the repo.
4. **Review across.** Your PR needs one approval from someone outside your group. Ask in the room; they read it without having seen your session.

## Plenary: 3-2-1 (3 minutes per group)

- **3** things we made (show the board, the note, the ADR, the prototype).
- **2** moments the AI was wrong, or we disagreed.
- **1** rule we would add to `CLAUDE.md`.
