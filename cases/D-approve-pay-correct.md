# Case D: Approve, pay, correct

**Group:** `groep-d` · **Engine:** `/prototype` (logic) · **Also:** `/research`, `/grill-with-docs` · **Starts on:** one prototype issue, one research issue, one grilling issue blocked by both

## The situation
In Tikklok a registered punch is never edited: a mistake is fixed by a new, linked correction, and the database refuses the rest. Should an expense claim work the same way? What happens when an approved claim turns out to be wrong, before or after the payout? Who may approve, and what if they are on holiday? Roboest builds on the Power Platform, so what Power Automate Approvals can and cannot do is a fact that shapes the answer.

## Goal
A clickable state machine that shows every transition, one research note, and one ADR that decides whether an approved claim is ever edited, with its price.

## The questions (already on the board)
1. **Prototype (logic):** What are the states and transitions of an expense claim, from draft to payout, including refused, withdrawn and corrected? Show it as a walkthrough you can click through.
2. **Research:** What does Power Automate **Approvals** offer: approval types (first to respond, everyone must approve, sequential), reassignment, what happens when nobody responds, how long a flow can wait? Microsoft Learn and the product documentation only, with the date read.
3. **Decide** (blocked by 1 and 2): is an approved expense claim ever edited, or only corrected by a new linked claim? And may the approver ever be the claimant?

## Steps
1. Board keeper assigns issues 1 and 2. One person starts `/research` on issue 2 in its own session (background).
2. The rest: `git switch -c prototype/claim-state-machine`, then `/prototype` for **logic**: one `prototypes/claim-state-machine/index.html` that shows the states, lets you click a transition, and shows the history of the claim as it grows. Every transition from `CONTEXT.md` terms.
3. Try to break it: correct a paid claim, approve your own claim, approve twice, withdraw after approval. Every "hmm" is a transition the model forgot.
4. **Exchange (minute 20):** group C's phone screen needs your states. Send them the list as a request, and take their request if they filed one. Take one issue from A's map if it fits (the absent approver is a good one).
5. Close the research issue with the note. `/grill-with-docs` on issue 3, with the prototype on screen. ADR title with the tension, for example *"An approved claim is never edited, and that costs us correction claims"*.
6. §3 of the ADR: which test would enforce it? Write it as a test name (`approved_claim_cannot_be_edited`), even if nobody builds it today.
7. Prototype committed on its branch; note, ADR, `CONTEXT.md` and a row in `prototypes/README.md` on `main`. PR, reviewer from another group.

## Deliverables
- Branch `prototype/claim-state-machine` with a clickable walkthrough.
- `docs/research/<n>-power-automate-approvals.md`, `docs/adr/NNNN-<tension>.md`, new headwords (at least **Correction** decided for this context).

## Conversation prompts
- Which Tikklok lesson carries over, and which one does not fit money?
- The research says the platform does X out of the box. Do we want X, or do we want what the platform gives us?
- Who is harmed if an approved claim can be edited quietly?

## Success criteria
- The walkthrough shows "corrected" without the original claim disappearing.
- The ADR names the check that would enforce it, or says honestly that none exists yet.
- Every platform claim in the note links to Microsoft Learn or product docs.

---
Claim first · Read the contract · `#12` for this repo, `MyRoboest 277` for Azure DevOps · Public means public
