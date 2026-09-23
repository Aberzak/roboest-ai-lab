# CODING_STANDARDS.md

Read by `/code-review` (Standards axis). A line here overrides the Fowler smell baseline. Every line must be checkable in a diff.

## Language and naming

- Identifiers, comments, commit messages and docs in English. Domain terms from `CONTEXT.md` verbatim; a synonym is a finding.
- Dutch appears only as a UI label, and then exactly the `_UI_` label from `CONTEXT.md`.
- ADR titles carry the tension (`… costs us …`); research titles are a sentence.

## Prototypes

- One question per prototype. The question is the first line of its `README.md`.
- Plain HTML, CSS and JavaScript in one folder, no build step, no backend, no external calls: it must open from disk in a browser.
- Lives on `prototype/<name>`, never merged into `main`. Throwaway by design: no tests, no abstractions.

## Shape (for anything that is not a prototype)

- Prefer deep modules: a small interface, real behaviour behind it, one obvious seam to test at.
- A concept that travels as a string or a tuple gets its own type. Three outcomes are a union, not a boolean plus an exception.
- No speculative generality: nothing the issue did not ask for (that is a Spec-axis finding).

## Tests

- Red before green; tests at pre-agreed public seams; expected values are literals.
- Test names read as a behaviour: `approved_claim_cannot_be_edited`.

## Git and board

- Branch `claude/<skill>-<n>-<slug>` or `prototype/<name>`; commit `Refs #<n>: <sentence>`; PR `Closes #<n>`.
- Assign yourself before the first edit. One issue per PR. History is never rewritten.

## Fowler smell baseline (judgement calls)

Mysterious Name · Duplicated Code · Feature Envy · Data Clumps · Primitive Obsession · Repeated Switches · Shotgun Surgery · Divergent Change · Speculative Generality · Message Chains · Middle Man · Refused Bequest
