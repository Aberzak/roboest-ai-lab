# docs/agents/triage-labels.md

The five canonical triage roles, as GitHub labels. They are orthogonal to open/closed: `ready-for-agent` on an open issue is normal.

| Label | Means | Next step |
|---|---|---|
| `needs-triage` | Raw: nobody has looked yet. Every issue filed for another group starts here. | `/triage` |
| `needs-info` | Cannot be decided or built without an answer from a person. The question is in the last comment. | wait, or `/to-questionnaire` |
| `ready-for-agent` | Clear enough that an agent can take it in a clean context from the issue alone. | claim → `/implement`, `/research` or `/prototype` |
| `ready-for-human` | Needs judgement, a conversation or access an agent must not have. | claim → a person |
| `wontfix` | Decided not to do; the reason is in the closing comment. | close |

Other labels on this board:

- `wayfinder:map`, `wayfinder:research`, `wayfinder:prototype`, `wayfinder:grilling`, `wayfinder:task`: the ticket types of a wayfinder map.
- `groep-a` … `groep-d`: which group owns the issue now. Moving an issue to another group = swap this label.
- `handoff`: the issue changed hands at least once. Keep it; it is how we count collaboration in the plenary.

Never triage the output of `/to-tickets`: those issues are born `ready-for-agent`.
