# Expenses

The Expenses context: how an employee claims money back for costs made for work, and how a claim is approved and paid. A new module; nothing here is decided until an ADR says so. Entries marked _(draft)_ are the facilitator's starting point and are there to be grilled, renamed or thrown away.

## How to read this glossary

Use the English headword in all prose, code, issues and commit messages.

- `_NL_`, the Dutch term it replaced. Here so a translator recognises it, not so it can be used.
- `_UI_`, the Dutch label the end user actually sees, where the UI stays Dutch.
- `_Avoid_`: synonyms that drift. Pick the headword.

## Rules for editing

- Be opinionated: one word per concept; the others go under `_Avoid_`.
- Definitions are one or two sentences. Define what it *is*, not what it does.
- Only concepts specific to this context. General programming concepts do not belong.
- A missing term is a signal for `/domain-modeling`, not a licence to invent a synonym.
- Group under subheadings when clusters emerge.

## The claim

**Expense claim** _(draft)_:
A request by one employee to be paid back for one or more costs made for work, submitted as a whole and approved as a whole.
_NL_: onkostennota · _UI_: Onkostennota · _Avoid_: expense report, declaration, note

**Expense line** _(draft)_:
One cost inside an expense claim: an amount, a date, a category and, where required, a receipt.
_NL_: onkostenlijn · _UI_: Kost · _Avoid_: item, entry, row

**Receipt** _(draft)_:
The document that proves an expense line: a till receipt, an invoice, a ticket. May be a photo.
_NL_: bewijsstuk · _UI_: Bewijsstuk · _Avoid_: ticket, bonnetje, attachment, proof

## Allowances

**Mileage allowance** _(draft)_:
An amount per kilometre paid for a work trip with the employee's own vehicle, instead of the real cost of the trip.
_NL_: kilometervergoeding · _UI_: Kilometervergoeding · _Avoid_: km-cost, travel cost, fuel cost

**Flat-rate allowance** _(draft)_:
A fixed amount paid per period to cover small recurring costs without a receipt per cost.
_NL_: forfaitaire onkostenvergoeding · _UI_: Forfait · _Avoid_: lump sum, fixed fee, allowance (alone)

**Work trip** _(draft)_:
A journey made for work between two places, which may give a right to a mileage allowance. Whether commuting counts is an open question.
_NL_: dienstverplaatsing · _UI_: Verplaatsing · _Avoid_: ride, journey, travel

## People and the flow

**Claimant** _(draft)_:
The employee who submits an expense claim and is paid if it is approved.
_NL_: aanvrager · _Avoid_: requester, submitter, user

**Approver** _(draft)_:
The person who accepts or refuses an expense claim. Never the claimant for their own claim.
_NL_: goedkeurder · _UI_: Goedkeurder · _Avoid_: manager, reviewer, validator

**Payout** _(draft)_:
The payment of an approved expense claim to the claimant.
_NL_: uitbetaling · _UI_: Uitbetaald · _Avoid_: refund, reimbursement, transfer

## Borrowed from Tikklok (for reference, not yet part of this context)

**Workplace**: the place where an employee works on a given moment, as the working-time register records it. A candidate source for work trips; see case B.

**Correction**: in Tikklok a registered fact is never edited; a mistake is fixed by a new, linked record. Whether expenses follow the same rule is case D's question.
