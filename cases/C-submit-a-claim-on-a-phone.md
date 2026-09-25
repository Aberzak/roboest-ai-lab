# Case C: Submit a claim on a phone

**Engine:** `/prototype` (UI) · **Also:** `/research`, `/grill-with-docs` · **Starts on:** one prototype issue, one research issue, one grilling issue blocked by both · **Time:** 45–60 min

## The situation
An employee pays for parking on a building site. The claim should take less time than finding the receipt again next month. What should the phone screen look like? A spec would take a week to argue about; three clickable variants take minutes. And whether a photo of the receipt is even enough is a fact, not a taste.

## Goal
Three UI variants side by side, a choice made by looking at them, one research note, and one ADR that records the choice with its price.

## The questions (already on your board)
1. **Prototype:** How does a claimant submit an expense line on a phone? Variant A *photo first* (take the picture, fill in afterwards), B *form first* (amount, category, then the picture), C *batch* (collect photos all month, submit one expense claim at the end).
2. **Research:** In Belgium, is a photo or scan of a receipt accepted as proof for an expense reimbursement, and how long must receipts be kept? Public primary sources only, with the date read.
3. **Decide** (blocked by 1 and 2): which flow, and what it costs us.

## Steps
1. Assign issues 1 and 2 to yourself. Start `/research` on issue 2 in its own session (background).
2. In a second Claude Code session: `git switch -c prototype/submit-on-phone`, and run `/prototype` with the three variants in **one** `prototypes/submit-on-phone/index.html`: plain HTML, Dutch labels from `CONTEXT.md` (`_UI_`), no backend, fake data. First variant visible within a few minutes.
3. Open it on a real phone if you can (or the browser's device mode). Give each variant one honest minute, as if you stood on a building site with gloves on. Then choose, and write down why.
4. The prototype will show states nobody asked for (a refused line? a missing receipt?). File one as an issue on your own board (`needs-triage`): case D owns those.
5. Close the research issue with the note. `/grill-with-docs` on issue 3: your choice plus the research. ADR title with the tension, for example *"Photo first costs us a second pass for the amount"*.
6. Commit the prototype on its branch (never merged). On `main`: the note, the ADR, `CONTEXT.md` and one row in `prototypes/README.md` pointing at the branch.
7. PR to your fork's `main`. Run `/code-review`, open the prototype once more from its branch, then merge.

## Deliverables
- Branch `prototype/submit-on-phone` with three variants in one file.
- `docs/research/<n>-receipts-photo-and-retention.md`, `docs/adr/NNNN-<tension>.md`, a row in `prototypes/README.md`.

## Questions to ask yourself
- Did you choose, or did the prettiest variant win? What would a site worker with gloves choose?
- What did the prototype show that nobody wrote in the issue?
- If the research says photos are not enough, which variant dies?

## Success criteria
- Three variants in one file, openable from disk.
- The ADR cites both the prototype branch and the research note.
- No prototype code on `main`.

## Practise at home
Workbook exercises 5 (UI and logic spike), 6 (research), 4 (headwords + ADR).

---
Your fork, your board · Read the contract · `#12` for this repo, `MyRoboest 277` for Azure DevOps · Public means public
