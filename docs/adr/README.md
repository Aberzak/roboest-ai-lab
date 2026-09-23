# Architecture decision records

One file per decision that is **hard to reverse, surprising without context, and a real trade-off**. All three, or no ADR.

- File name: `NNNN-<the-tension-in-lowercase>.md`, numbered in order of acceptance (`0001`, `0002`, …). Two groups racing for the same number: the first merged PR wins, the other renumbers.
- House rule: **put the tension in the title, not the resolution.** A title reads *what we get … costs us … what we give up*.
  - Good: `0003-photo-first-costs-us-a-second-pass-for-the-amount.md`
  - Bad: `0003-use-a-camera.md` (records nothing; nobody was going to not use it)
- An ADR points at the research notes it rests on and at the issue that asked the question (`Decides: #14`).
- Start from [TEMPLATE.md](TEMPLATE.md). `/grill-with-docs` drafts it; the group decides it.
