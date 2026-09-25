# The four cases

One domain (Expenses), four cases, each worked alone in your own fork (see the Quick start in the main README). Every case ends with **at least one research note and at least one ADR**, and every case uses a different skill as its engine.

| Case | Engine | Research | ADR from `/grill-with-docs` |
|---|---|---|---|
| [A. Map the Expenses module](A-map-the-expenses-module.md) | `/wayfinder` | the first research issue on the frontier | the first grilling issue on the frontier |
| [B. Mileage from the working-time register?](B-mileage-from-the-register.md) | `/research` ×2 | mileage rules · GDPR purpose limitation | where work trips come from |
| [C. Submit a claim on a phone](C-submit-a-claim-on-a-phone.md) | `/prototype` UI | receipts: photo and retention | photo-first or form-first |
| [D. Approve, pay, correct](D-approve-pay-correct.md) | `/prototype` logic | Power Automate Approvals | is an approved claim ever edited |

`scripts/Seed-Board.ps1` puts the case issues on your fork's board: one map issue (A), and for B, C and D a research, a prototype or second research, and a grilling issue that is **blocked by** the other two. You start on a real frontier.

## How to work a case

Pick one case, 45–60 minutes. Time left? Take a second one.

| Minute | What |
|---|---|
| 0–5 | Assign the case's issues to yourself. Read `CLAUDE.md` → `README` → `CONTEXT.md` → the issue. |
| 5–20 | Start `/research` in the background, then your engine (`/wayfinder` or `/prototype`). |
| 20–25 | Open every source the agent cites. A number without a date goes back. |
| 25–45 | Close the research issue with the note; `/grill-with-docs` on the grilling issue → `CONTEXT.md` + ADR. |
| 45–55 | PR to your fork's `main`, `/code-review`, merge, close the issues. |
| 55–60 | Write your 3-2-1. |

You play all four roles yourself:

| Role | Means |
|---|---|
| **Driver** | Read every proposal of the agent before you accept it. |
| **Decider** | Answer the grilling rounds yourself. Facts are the agent's job; decisions are yours. |
| **Board keeper** | Assign, run the frontier query, file new issues, check `Blocked by` lines. |
| **Skeptic** | Open every source the agent cites. Call `/wait-what`. Keep an "AI was wrong" log. |

## When you are done: 3-2-1

Send the facilitator the link to your fork and:

- **3** things you made (the board, the note, the ADR, the prototype).
- **2** moments the AI was wrong, or you disagreed.
- **1** rule you would add to `CLAUDE.md`.
