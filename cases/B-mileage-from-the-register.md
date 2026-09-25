# Case B: Mileage from the working-time register?

**Engine:** `/research` ×2 (in parallel) · **Also:** `/grill-with-docs`, `/to-questionnaire` · **Starts on:** two research issues and one grilling issue blocked by both · **Time:** 45–60 min

## The situation
Tikklok already records, for every punch, **where** an employee works. Someone asks: "If we know you went from workplace X to workplace Y, can the Expenses module fill in the mileage allowance by itself?" It sounds like free value. It may also be illegal, wrong or both. Before anybody builds anything, we need two facts and one decision.

## Goal
Two research notes from public primary sources, and one ADR that decides where a **work trip** comes from, with the price of the choice in its title.

## The questions (already on your board)
1. **Research:** What are the official Belgian rules for a mileage allowance for a work trip with the employee's own vehicle: which trips count (commuting or not), which amount per kilometre applies for which period, and what proof is required? Cite the official source and the date it was read.
2. **Research:** May data recorded for working-time registration be reused to calculate an allowance? Look at GDPR purpose limitation (article 5(1)(b)) and what the Belgian data protection authority publishes about it. What would we need: a new legal basis, information to the employee, a data protection impact assessment?
3. **Decide** (blocked by 1 and 2): work trips derived from punches, entered by hand, or derived and confirmed by the claimant.

## Steps
1. Assign both research issues to yourself. Start `/research` on each in its own Claude Code session: both run in the background at the same time.
2. While they run, write the three options for issue 3 on paper, each with *gives us … costs us …*.
3. Open every source in both notes. A number without a date, or a claim without a link, goes back to the agent.
4. Close both research issues with a link to the note. `/grill-with-docs` on issue 3. The ADR title carries the tension, for example *"Derived work trips cost us a confirmation step and a DPIA"*.
5. (Time left) What the law leaves to Roboest (a company policy) goes into a `/to-questionnaire` for HR, in the PR, **not answered here**.
6. PR to your fork's `main`, `Closes` all three issues. Run `/code-review`, read what it says, then merge.

## Deliverables
- `docs/research/<n>-mileage-allowance-rules.md` and `docs/research/<n>-reuse-of-working-time-data.md`.
- `docs/adr/NNNN-<tension>.md`, new headwords in `CONTEXT.md` (at least **Work trip** sharpened).

## Questions to ask yourself
- The agent is sure about an amount. Where exactly does it say so, and for which period?
- If the law allows it but an employee would feel watched, does that change the decision?
- Which of the Tikklok ADRs would this decision touch?

## Success criteria
- Every claim in both notes has a link to a primary source; every amount has a date and a period.
- The ADR names at least one option it did not take, and why.
- No internal policy, no real employee, no customer in any file.

## Practise at home
Workbook exercises 6 (research), 4 (headwords + ADR), 13 (questionnaire), 12 (`/wait-what`).

---
Your fork, your board · Read the contract · `#12` for this repo, `MyRoboest 277` for Azure DevOps · Public means public
